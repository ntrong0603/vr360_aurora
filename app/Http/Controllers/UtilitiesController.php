<?php

namespace App\Http\Controllers;

use App\Models\Utilities;
use App\Models\UtilitiesLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class UtilitiesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Utilities())->getDatas($request->all());
        return view('admin.utilities.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.utilities.create', ['languages' => $languages]);
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
            return redirect(route('utilities.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataUtilities = [
            'name' => $request['name_' . $languages[0]->code],
            'name_hotspot' => $request['name_hotspot'],
        ];
        $utilities = Utilities::create($dataUtilities);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }

            $dataUtilitiesLang = [
                'name' => $name,
                'utilities_id' => $utilities->id,
                'lang' => $language->code
            ];

            if ($request->hasFile('photo_' . $language->code)) {
                $image      = $request->file('photo_' . $language->code);
                $fileName   = 'utilities-image-' . $language->code . '-' .  time() . '.' . $image->getClientOriginalExtension();
                Storage::disk('utilities_image')->putFileAs('', $image, $fileName);
                $dataUtilitiesLang['photo'] = $fileName;
            }

            UtilitiesLanguage::create($dataUtilitiesLang);
        }
        return redirect(route('utilities.index'));
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
     * @param  App\Models\Utilities $utilities
     * @return \Illuminate\Http\Response
     */
    public function edit(Utilities $utilities)
    {
        $languages = getLanguage();
        $data = [
            'utilities' => $utilities,
            'languages' => $languages,
        ];
        return view('admin.utilities.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  App\Models\Utilities $utilities
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Utilities $utilities, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('utilities.edit', ['utilities' => $utilities->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataUtilities = [
            'name' => $request['name_' . $languages[0]->code],
        ];
        $utilities->fill($dataUtilities);
        $utilities->save();
        $arrLang = [];
        foreach ($utilities->utilitiesLanguages as $utilitiesLanguage) {
            $arrLang[] = $utilitiesLanguage->lang;
            $name = "";
            if (empty($request['name_' . $utilitiesLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $utilitiesLanguage->lang];
            }

            $dataUtilitiesLang = [
                'name' => $name,
                'utilities_id' => $utilities->id
            ];
            if ($request->hasFile('photo_' . $utilitiesLanguage->lang)) {
                if (!empty($utilitiesLanguage->photo) && Storage::disk('utilities_image')->has($utilitiesLanguage->photo)) {
                    Storage::disk('utilities_image')->delete($utilitiesLanguage->photo);
                }
                $image      = $request->file('photo_' . $utilitiesLanguage->lang);
                $fileName   = 'utilities-image-' . $utilitiesLanguage->lang . '-' .  time() . '.' . $image->getClientOriginalExtension();
                Storage::disk('utilities_image')->putFileAs('', $image, $fileName);
                $dataUtilitiesLang['photo'] = $fileName;
            }
            $utilitiesLanguage->fill($dataUtilitiesLang);
            $utilitiesLanguage->save();
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

                    $dataUtilitiesLang = [
                        'name' => $name,
                        'utilities_id' => $utilities->id,
                        'lang' => $language->code
                    ];

                    if ($request->hasFile('photo_' . $language->code)) {
                        $image      = $request->file('photo_' . $language->code);
                        $fileName   = 'utilities-image-' . $language->code . '-' .  time() . '.' . $image->getClientOriginalExtension();
                        Storage::disk('utilities_image')->putFileAs('', $image, $fileName);
                        $dataUtilitiesLang['photo'] = $fileName;
                    }

                    UtilitiesLanguage::create($dataUtilitiesLang);
                }
            }
        }
        return redirect(route('utilities.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\Utilites $utilities
     * @return \Illuminate\Http\Response
     */
    public function destroy(Utilities $utilities)
    {
        if (!empty($utilities)) {
            foreach ($utilities->utilitiesLanguages as $utilitiesLanguage) {
                if (!empty($utilitiesLanguage->photo) && Storage::disk('utilities_image')->has($utilitiesLanguage->photo)) {
                    Storage::disk('utilities_image')->delete($utilitiesLanguage->photo);
                }
                $utilitiesLanguage->delete();
            }
            $utilities->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
