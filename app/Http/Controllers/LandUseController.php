<?php

namespace App\Http\Controllers;

use App\Models\LandUse;
use App\Models\LandUseLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LandUseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new LandUse())->getDatas($request->all());
        return view('admin.land_use.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.land_use.create', ['languages' => $languages]);
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
            return redirect(route('landUse.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataLandUse = [
            'name' => $request['name_' . $languages[0]->code]
        ];
        $landUse = LandUse::create($dataLandUse);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataLandUseLang = [
                'name' => $name,
                'land_use_id' => $landUse->id,
                'note' => $request['note_' . $language->code],
                'lang' => $language->code
            ];
            LandUseLanguage::create($dataLandUseLang);
        }
        return redirect(route('landUse.index'));
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
    public function edit(LandUse $landUse)
    {
        $languages = getLanguage();
        $data = [
            'landUse' => $landUse,
            'languages' => $languages,
        ];
        return view('admin.land_use.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(LandUse $landUse, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('landUse.edit', ['landUse' => $landUse->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataLandUse = [
            'name' => $request['name_' . $languages[0]->code],
        ];
        $landUse->fill($dataLandUse);
        $landUse->save();
        $arrLang = [];
        foreach ($landUse->landUseLanguages as $landUseLanguage) {
            $arrLang[] = $landUseLanguage->lang;
            $name = "";
            if (empty($request['name_' . $landUseLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $landUseLanguage->lang];
            }
            $dataLandUseLang = [
                'name' => $name,
                'note' => $request['note_' . $landUseLanguage->lang],
            ];
            $landUseLanguage->fill($dataLandUseLang);
            $landUseLanguage->save();
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
                    $dataLandUseLang = [
                        'name' => $name,
                        'land_use_id' => $landUse->id,
                        'lang' => $language->code,
                        'note' => $request['note_' . $language->code],
                    ];
                    LandUseLanguage::create($dataLandUseLang);
                }
            }
        }
        return redirect(route('landUse.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(LandUse $landUse)
    {
        if (!empty($landUse)) {
            foreach ($landUse->landUseLanguages as $landUseLanguage) {
                $landUseLanguage->delete();
            }
            $landUse->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
