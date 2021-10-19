<?php

namespace App\Http\Controllers;

use App\Models\Enquiry;
use App\Models\EnquiryLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EnquiryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Enquiry())->getDatas($request->all());
        return view('admin.enquiry.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.enquiry.create', ['languages' => $languages]);
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
            return redirect(route('enquiry.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataEnquiry = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $enquiry = Enquiry::create($dataEnquiry);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataEnquiryLang = [
                'name' => $name,
                'enquiry_id' => $enquiry->id,
                'note' => $request['note_' . $language->code],
                'lang' => $language->code
            ];
            EnquiryLanguage::create($dataEnquiryLang);
        }
        return redirect(route('enquiry.index'));
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
    public function edit(Enquiry $enquiry)
    {
        $languages = getLanguage();
        $data = [
            'enquiry' => $enquiry,
            'languages' => $languages,
        ];
        return view('admin.enquiry.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Enquiry $enquiry, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('enquiry.edit', ['landStyle' => $enquiry->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataEnquiry = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $enquiry->fill($dataEnquiry);
        $enquiry->save();
        $arrLang = [];
        foreach ($enquiry->enquiryLanguages as $enquiryLanguage) {
            $arrLang[] = $enquiryLanguage->lang;
            $name = "";
            if (empty($request['name_' . $enquiryLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $enquiryLanguage->lang];
            }
            $dataEnquiryLang = [
                'name' => $name,
                'note' => $request['note_' . $enquiryLanguage->lang],
            ];
            $enquiryLanguage->fill($dataEnquiryLang);
            $enquiryLanguage->save();
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
                    $dataEnquiryLang = [
                        'name' => $name,
                        'enquiry_id' => $enquiry->id,
                        'lang' => $language->code,
                        'note' => $request['note_' . $language->code],
                    ];
                    EnquiryLanguage::create($dataEnquiryLang);
                }
            }
        }
        return redirect(route('enquiry.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\LandStyle $landStyle
     * @return \Illuminate\Http\Response
     */
    public function destroy(Enquiry $enquiry)
    {
        if (!empty($enquiry)) {
            foreach ($enquiry->enquiryLanguages as $enquiryLanguage) {
                $enquiryLanguage->delete();
            }
            $enquiry->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
