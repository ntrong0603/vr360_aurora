<?php

namespace App\Http\Controllers;

use App\Models\Business;
use App\Models\BusinessLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BusinessController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Business())->getDatas($request->all());
        return view('admin.business.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.business.create', ['languages' => $languages]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('business.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataBusiness = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => $request['status'],
        ];
        $business = Business::create($dataBusiness);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }

            $dataBusinessLang = [
                'name' => $name,
                'business_id' => $business->id,
                'lang' => $language->code
            ];

            BusinessLanguage::create($dataBusinessLang);
        }
        return redirect(route('business.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  App\Models\Business $business
     * @return \Illuminate\Http\Response
     */
    public function edit(Business $business)
    {
        $languages = getLanguage();
        $data = [
            'business' => $business,
            'languages' => $languages,
        ];
        return view('admin.business.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  App\Models\Business $business
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Business $business, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('business.edit', ['business' => $business->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataBusiness = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => $request['status'],
        ];
        $business->fill($dataBusiness);
        $business->save();
        $arrLang = [];
        foreach ($business->businessLanguages as $businessLanguage) {
            $arrLang[] = $businessLanguage->lang;
            $name = "";
            if (empty($request['name_' . $businessLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $businessLanguage->lang];
            }
            $dataBusinessLang = [
                'name' => $name
            ];

            $businessLanguage->fill($dataBusinessLang);
            $businessLanguage->save();
        }
        // created
        if (count($languages) != count($arrLang)) {
            foreach ($languages as $language) {
                $isNewLang = true;
                foreach ($arrLang as $lang) {
                    if ($language->code == $lang) {
                        $isNewLang = false;
                    }
                }
                if ($isNewLang) {
                    $name = "";
                    if (empty($request['name_' . $language->code])) {
                        $name = $request['name_' . $languages[0]->code];
                    } else {
                        $name = $request['name_' . $language->code];
                    }

                    $dataBusinessLang = [
                        'name' => $name,
                        'business_id' => $business->id,
                        'lang' => $language->code
                    ];
                    BusinessLanguage::create($dataBusinessLang);
                }
            }
        }
        return redirect(route('business.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\Business $business
     * @return \Illuminate\Http\Response
     */
    public function destroy(Business $business)
    {
        if (!empty($business)) {
            BusinessLanguage::where('business_id', $business->id)->delete();
            $business->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
