<?php

namespace App\Http\Controllers;

use App\Models\BusinessStyle;
use App\Models\BusinessStyleLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BusinessStyleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new BusinessStyle())->getDatas($request->all());
        return view('admin.business_style.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.business_style.create', ['languages' => $languages]);
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
            return redirect(route('businessStyle.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataBusinessStyle = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $businessStyle = BusinessStyle::create($dataBusinessStyle);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataBusinessStyleLang = [
                'name' => $name,
                'business_style_id' => $businessStyle->id,
                'lang' => $language->code
            ];
            BusinessStyleLanguage::create($dataBusinessStyleLang);
        }
        return redirect(route('businessStyle.index'));
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(BusinessStyle $businessStyle)
    {
        $languages = getLanguage();
        $data = [
            'businessStyle' => $businessStyle,
            'languages' => $languages,
        ];
        return view('admin.business_style.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(BusinessStyle $businessStyle, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('businessStyle.edit', ['businessStyle' => $businessStyle->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataBusinessStyle = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $businessStyle->fill($dataBusinessStyle);
        $businessStyle->save();
        $arrLang = [];
        foreach ($businessStyle->businessStyleLanguages as $businessStyleLanguage) {
            $arrLang[] = $businessStyleLanguage->lang;
            $name = "";
            if (empty($request['name_' . $businessStyleLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $businessStyleLanguage->lang];
            }
            $dataBusinessStyleLang = [
                'name' => $name
            ];
            $businessStyleLanguage->fill($dataBusinessStyleLang);
            $businessStyleLanguage->save();
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
                    $dataBusinessStyleLang = [
                        'name' => $name,
                        'business_style_id' => $businessStyle->id,
                        'lang' => $language->code
                    ];
                    BusinessStyleLanguage::create($dataBusinessStyleLang);
                }
            }
        }
        return redirect(route('businessStyle.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\LandStyle $landStyle
     * @return \Illuminate\Http\Response
     */
    public function destroy(BusinessStyle $businessStyle)
    {
        if (!empty($businessStyle)) {
            foreach ($businessStyle->businessStyleLanguages as $businessStyleLanguage) {
                $businessStyleLanguage->delete();
            }
            $businessStyle->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
