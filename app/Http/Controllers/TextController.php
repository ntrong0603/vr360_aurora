<?php

namespace App\Http\Controllers;

use App\Models\Text;
use App\Models\TextLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TextController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Text())->getDatas($request->all());
        return view('admin.text.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.text.create', ['languages' => $languages]);
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
            return redirect(route('text.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataText = [
            'name' => $request['name_' . $languages[0]->code],
            'code' => $request['code']
        ];
        $text = Text::create($dataText);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataTextLang = [
                'name' => $name,
                'text_id' => $text->id,
                'lang' => $language->code
            ];
            TextLanguage::create($dataTextLang);
        }
        return redirect(route('text.index'));
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
    public function edit(Text $text)
    {
        $languages = getLanguage();
        $data = [
            'text' => $text,
            'languages' => $languages,
        ];
        return view('admin.text.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Text $text, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('text.edit', ['text' => $text->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataText = [
            'name' => $request['name_' . $languages[0]->code]
        ];
        $text->fill($dataText);
        $text->save();
        $arrLang = [];
        foreach ($text->textLanguages as $textLanguage) {
            $arrLang[] = $textLanguage->lang;
            $name = "";
            if (empty($request['name_' . $textLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $textLanguage->lang];
            }
            $dataTextLang = [
                'name' => $name
            ];
            $textLanguage->fill($dataTextLang);
            $textLanguage->save();
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
                    $dataTextLang = [
                        'name' => $name,
                        'text_id' => $text->id,
                        'lang' => $language->code
                    ];
                    TextLanguage::create($dataTextLang);
                }
            }
        }
        return redirect(route('text.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\LandStyle $landStyle
     * @return \Illuminate\Http\Response
     */
    public function destroy(Text $text)
    {
        if (!empty($text)) {
            foreach ($text->textLanguages as $textLanguage) {
                $textLanguage->delete();
            }
            $text->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
