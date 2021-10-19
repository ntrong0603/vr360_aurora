<?php

namespace App\Http\Controllers;

use App\Models\Visiting;
use App\Models\VisitingLanguage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VisitingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Visiting())->getDatas($request->all());
        return view('admin.visiting.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.visiting.create', ['languages' => $languages]);
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
            return redirect(route('visiting.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataVisiting = [
            'name' => $request['name_' . $languages[0]->code]
        ];
        $visiting = Visiting::create($dataVisiting);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataVisitingLang = [
                'name' => $name,
                'visiting_id' => $visiting->id,
                'lang' => $language->code
            ];
            VisitingLanguage::create($dataVisitingLang);
        }
        return redirect(route('visiting.index'));
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
    public function edit(Visiting $visiting)
    {
        $languages = getLanguage();
        $data = [
            'visiting' => $visiting,
            'languages' => $languages,
        ];
        return view('admin.visiting.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Visiting $visiting, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('visiting.edit', ['visiting' => $visiting->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataVisiting = [
            'name' => $request['name_' . $languages[0]->code],
        ];
        $visiting->fill($dataVisiting);
        $visiting->save();
        $arrLang = [];
        foreach ($visiting->visitingLanguages as $visitingLanguage) {
            $arrLang[] = $visitingLanguage->lang;
            $name = "";
            if (empty($request['name_' . $visitingLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $visitingLanguage->lang];
            }
            $dataVisitingLang = [
                'name' => $name
            ];
            $visitingLanguage->fill($dataVisitingLang);
            $visitingLanguage->save();
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
                    $dataVisitingLang = [
                        'name' => $name,
                        'visiting_id' => $visiting->id,
                        'lang' => $language->code
                    ];
                    VisitingLanguage::create($dataVisitingLang);
                }
            }
        }
        return redirect(route('visiting.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
