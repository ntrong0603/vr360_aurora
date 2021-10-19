<?php

namespace App\Http\Controllers;

use App\Models\Scene;
use App\Models\SceneLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SceneController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Scene())->getDatas($request->all());
        return view('admin.scene.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.scene.create', ['languages' => $languages]);
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
            return redirect(route('scene.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataScene = [
            'name' => $request['name_' . $languages[0]->code],
            'name_scene' => $request['name_scene'],
        ];
        $scene = Scene::create($dataScene);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataSceneLang = [
                'name' => $name,
                'scene_id' => $scene->id,
                'content' => $request['content_' . $language->code],
                'lang' => $language->code
            ];
            SceneLanguage::create($dataSceneLang);
        }
        return redirect(route('scene.index'));
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
     * @param  \App\Models\Scene $scene
     * @return \Illuminate\Http\Response
     */
    public function edit(Scene $scene)
    {
        $languages = getLanguage();
        $data = [
            'scene' => $scene,
            'languages' => $languages,
        ];
        return view('admin.scene.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Models\Scene $scene
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Scene $scene, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('scene.edit', ['scene' => $scene->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataScene = [
            'name' => $request['name_' . $languages[0]->code],
        ];
        $scene->fill($dataScene);
        $scene->save();
        $arrLang = [];
        foreach ($scene->sceneLanguages as $sceneLanguage) {
            $arrLang[] = $sceneLanguage->lang;
            $name = "";
            if (empty($request['name_' . $sceneLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $sceneLanguage->lang];
            }
            $datasceneLang = [
                'name' => $name,
                'content' => $request['content_' . $sceneLanguage->lang],
            ];
            $sceneLanguage->fill($datasceneLang);
            $sceneLanguage->save();
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
                    $dataSceneLang = [
                        'name' => $name,
                        'scene_id' => $scene->id,
                        'content' => $request['content_' . $language->code],
                        'lang' => $language->code
                    ];
                    SceneLanguage::create($dataSceneLang);
                }
            }
        }
        return redirect(route('scene.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\Scene $scene
     * @return \Illuminate\Http\Response
     */
    public function destroy(Scene $scene)
    {
        if (!empty($scene)) {
            foreach ($scene->sceneLanguages as $sceneLanguage) {
                $sceneLanguage->delete();
            }
            $scene->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
