<?php

namespace App\Http\Controllers;

use App\Models\CountryModel;
use Illuminate\Http\Request;

class CountryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = (new CountryModel())->paginate(25);
        return view('admin.country.index', ['data' => $items]);
    }

    public function editView($id)
    {
        $item = (new CountryModel())->find($id);
        return view('back_end.country.edit', ['item' => $item]);
    }

    public function addView()
    {
        return view('back_end.country.add');
    }

    public function save(Request $request)
    {
        $rules = [
            'country'    => 'required',
            'country_en' => 'required',
        ];
        $rulesMessage = [];
        if (isset($request->id)) {
            $item = (new CountryModel())->find($request->id);
        } else {
            $item = new CountryModel();
        }

        $this->validate(
            $request,
            $rules,
            $rulesMessage
        );

        $item->country    = $request->country;
        $item->country_en = $request->country_en;
        $item->save();
        if (isset($request->id)) {
            return redirect(route('country.view_edit', ['id' => $request->id]))->with('thongbao', 'Sửa thông tin thành công');
        } else {
            return redirect(route('country'))->with('thongbao', 'Thêm thông tin thành công');
        }
    }

    public function delete($id)
    {
        $item = (new CountryModel())->find($id);
        $item->delete();
        return redirect(route('country'))->with('thongbao', 'Xóa "' . $item->country . '" thành công');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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
