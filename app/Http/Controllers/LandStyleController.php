<?php

namespace App\Http\Controllers;

use App\Models\LandStyle;
use App\Models\LandStyleLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LandStyleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new LandStyle())->getDatas($request->all());
        return view('admin.land_style.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.land_style.create', ['languages' => $languages]);
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
            return redirect(route('landStyle.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataLandStyle = [
            'name' => $request['name_' . $languages[0]->code]
        ];
        $landStyle = LandStyle::create($dataLandStyle);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataLandStyleLang = [
                'name' => $name,
                'land_style_id' => $landStyle->id,
                'note' => $request['note_' . $language->code],
                'lang' => $language->code
            ];
            LandStyleLanguage::create($dataLandStyleLang);
        }
        return redirect(route('landStyle.index'));
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
    public function edit(LandStyle $landStyle)
    {
        $languages = getLanguage();
        $data = [
            'landStyle' => $landStyle,
            'languages' => $languages,
        ];
        return view('admin.land_style.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(LandStyle $landStyle, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('landStyle.edit', ['landStyle' => $landStyle->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataLandStyle = [
            'name' => $request['name_' . $languages[0]->code],
        ];
        $landStyle->fill($dataLandStyle);
        $landStyle->save();
        $arrLang = [];
        foreach ($landStyle->landStyleLanguages as $landStyleLanguage) {
            $arrLang[] = $landStyleLanguage->lang;
            $name = "";
            if (empty($request['name_' . $landStyleLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $landStyleLanguage->lang];
            }
            $dataLandStyleLang = [
                'name' => $name,
                'note' => $request['note_' . $landStyleLanguage->lang],
            ];
            $landStyleLanguage->fill($dataLandStyleLang);
            $landStyleLanguage->save();
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
                    $dataLandStyleLang = [
                        'name' => $name,
                        'land_style_id' => $landStyle->id,
                        'lang' => $language->code,
                        'note' => $request['note_' . $language->code],
                    ];
                    LandStyleLanguage::create($dataLandStyleLang);
                }
            }
        }
        return redirect(route('landStyle.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\LandStyle $landStyle
     * @return \Illuminate\Http\Response
     */
    public function destroy(LandStyle $landStyle)
    {
        if (!empty($landStyle)) {
            foreach ($landStyle->landStyleLanguages as $landStyleLanguage) {
                $landStyleLanguage->delete();
            }
            $landStyle->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
