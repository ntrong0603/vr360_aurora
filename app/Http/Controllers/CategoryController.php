<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\CategoryLanguage;
use App\Models\Scene;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $where = $request->all();
        $where['category_id'] = 0;
        $items = (new Category())->getDatas($where);
        return view('admin.category.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        $scenes = (new Scene())->get();
        $categories = (new Category())->where('category_id', 0)->get();
        $data = [
            'languages' => $languages,
            'scenes' => $scenes,
            'categories' => $categories
        ];
        return view('admin.category.create',  $data);
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
            return redirect(route('category.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataCategory = [
            'name' => $request['name_' . $languages[0]->code],
            'link' => $request['link'],
            'style_event' => $request['style_event'],
            'name_scene' => $request['name_scene'],
            'name_hotspot' => $request['name_hotspot'],
            'category_id' => $request['category_id'],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $category = Category::create($dataCategory);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }
            $dataCategoryLang = [
                'name' => $name,
                'category_id' => $category->id,
                'content' => $request['content_' . $language->code],
                'lang' => $language->code
            ];
            CategoryLanguage::create($dataCategoryLang);
        }
        return redirect(route('category.index'));
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
    public function edit(Category $category)
    {
        $languages = getLanguage();
        $scenes = (new Scene())->get();
        $categories = (new Category())->where('category_id', 0)->get();
        $data = [
            'category' => $category,
            'languages' => $languages,
            'scenes' => $scenes,
            'categories' => $categories
        ];
        return view('admin.category.edit',  $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Category $category, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('category.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataCategory = [
            'name' => $request['name_' . $languages[0]->code],
            'link' => $request['link'],
            'style_event' => $request['style_event'],
            'name_scene' => $request['name_scene'],
            'name_hotspot' => $request['name_hotspot'],
            'category_id' => $request['category_id'],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $category->fill($dataCategory);
        $category->save();
        $arrLang = [];

        foreach ($category->categoryLanguages as $categoryLanguage) {
            $arrLang[] = $categoryLanguage->lang;
            $name = "";
            if (empty($request['name_' . $categoryLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $categoryLanguage->lang];
            }
            $dataCategoryLang = [
                'name' => $name,
                'content' => $request['content_' . $categoryLanguage->lang],
            ];
            $categoryLanguage->fill($dataCategoryLang);
            $categoryLanguage->save();
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
                    $dataCategoryLang = [
                        'name' => $name,
                        'category_id' => $category->id,
                        'content' => $request['content_' . $language->code],
                        'lang' => $language->code
                    ];
                    CategoryLanguage::create($dataCategoryLang);
                }
            }
        }
        return redirect(route('category.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        if (!empty($category)) {
            foreach ($category->categoryLanguages as $categoryLanguage) {
                $categoryLanguage->delete();
            }
            $category->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
