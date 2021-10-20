<?php

namespace App\Http\Controllers;

use App\Models\Land;
use App\Models\LandLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Land())->getDatas($request->all());
        return view('admin.land.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.land.create', ['languages' => $languages]);
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
            return redirect(route('land.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataLand = [
            'name' => $request['name_' . $languages[0]->code],
            'name_land' => $request['name_land'],
            // 'style' => $request['style'],
        ];
        $land = Land::create($dataLand);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataLandLang = [
                'name' => $name,
                'land_id' => $land->id,
                'content' => $request['content_' . $language->code],
                'lang' => $language->code
            ];
            LandLanguage::create($dataLandLang);
        }
        return redirect(route('land.index'));
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
     * @param  \App\Models\Land $land
     * @return \Illuminate\Http\Response
     */
    public function edit(Land $land)
    {
        $languages = getLanguage();
        $data = [
            'land' => $land,
            'languages' => $languages,
        ];
        return view('admin.land.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Models\Land $land
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Land $land, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('land.edit', ['land' => $land->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataLand = [
            'name' => $request['name_' . $languages[0]->code],
            // 'style' => $request['style'],
        ];
        $land->fill($dataLand);
        $land->save();
        $arrLang = [];
        foreach ($land->landLanguages as $landLanguage) {
            $arrLang[] = $landLanguage->lang;
            $name = "";
            if (empty($request['name_' . $landLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $landLanguage->lang];
            }
            $dataLandLang = [
                'name' => $name,
                'content' => $request['content_' . $landLanguage->lang],
            ];
            $landLanguage->fill($dataLandLang);
            $landLanguage->save();
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
                    $dataLandLang = [
                        'name' => $name,
                        'land_id' => $land->id,
                        'content' => $request['content_' . $language->code],
                        'lang' => $language->code
                    ];
                    LandLanguage::create($dataLandLang);
                }
            }
        }
        return redirect(route('land.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Land $land
     * @return \Illuminate\Http\Response
     */
    public function destroy(Land $land)
    {
        if (!empty($land)) {
            foreach ($land->landLanguages as $landLanguage) {
                $landLanguage->delete();
            }
            $land->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }

    public function updateView(Request $request){
        $land = (new Land());
    }
}
