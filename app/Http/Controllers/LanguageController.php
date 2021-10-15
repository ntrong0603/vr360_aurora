<?php

namespace App\Http\Controllers;

use App\Models\LanguageModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;


class LanguageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $datas = LanguageModel::paginate(20);
        return view('admin.language.index', [
            'datas' => $datas
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.language.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'photo' => 'required|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'name' => 'required',
            'code' => 'required|unique:languages',
        ], [
            'photo.required' => "Chọn icon đại diện",
            'name.required' => "Tên không được trống",
            'code.required' => "Ký hiệu không được trống",
            'code.unique' => "Ký hiệu đã tồn tại",
        ]);
        if ($validator->fails()) {
            return redirect(route('language.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $data = $request->all();
        if ($request->hasFile('photo')) {
            $image      = $request->file('photo');
            $fileName   = 'language-image-' .  time() . '.' . $image->getClientOriginalExtension();
            Storage::disk('language_image')->putFileAs('', $image, $fileName);
            $data['photo'] = $fileName;
        }

        $language = LanguageModel::create($data);

        return redirect(route('language.index'));
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
     * @param  App\Models\LanguageModel $language
     * @return \Illuminate\Http\Response
     */
    public function edit(LanguageModel $language)
    {
        $data = [
            'language' => $language,
        ];
        return view('admin.language.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  App\Models\LanguageModel $language
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(LanguageModel $language, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'photo' => 'mimes:jpeg,png,jpg,gif,svg|max:2048',
            'name' => 'required',
            'code' => 'required',
        ], [
            'name.required' => "Tên không được trống",
            'code.required' => "Ký hiệu không được trống",
        ]);
        if ($validator->fails()) {
            return redirect(route('language.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $data = $request->all();
        if ($request->hasFile('photo')) {
            if (!empty($language->photo) && Storage::disk('language_image')->has($language->photo)) {
                Storage::disk('language_image')->delete($language->photo);
            }
            $image      = $request->file('photo');
            $fileName   = 'language-image-' .  time() . '.' . $image->getClientOriginalExtension();
            Storage::disk('language_image')->putFileAs('', $image, $fileName);
            $data['photo'] = $fileName;
        }
        $language->fill($data);
        $language->save();
        return redirect(route('language.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  App\Models\LanguageModel $language
     * @return \Illuminate\Http\Response
     */
    public function destroye(LanguageModel $language)
    {
        if (!empty($language)) {
            $language->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
