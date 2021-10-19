<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SettingController extends Controller
{
    public function index(Request $request)
    {
        if ($request->isMethod('post')) {
            if ($request->hasFile("logo")) {

                if (!empty(getSetting("logo")) && Storage::disk('setting_image')->has(getSetting("logo"))) {
                    Storage::disk('setting_image')->delete(getSetting("logo"));
                }
                $image      = $request->file('logo');
                $fileType = $image->getClientOriginalExtension();
                $arrType = array('JPG', 'jpg', 'jpeg', 'JPEG', 'png', 'PNG', 'svg', 'SVG');
                if (!in_array($fileType, $arrType)) {
                    return redirect(route('setting'))->with('loi', 'Bạn chỉ được chọn file có đuôi: JPG, jpg, jpeg, JPEG, png, PNG, svg, SVG');
                }
                $fileName   = 'setting-image-' .  time() . '.' . $image->getClientOriginalExtension();
                Storage::disk('setting_image')->putFileAs('', $image, $fileName);

                saveSetting(["code_setting" => "logo"], ["value" => $fileName]);
            }

            saveSetting(["code_setting" => "company_name"], ["value" => $request->company_name]);
            saveSetting(["code_setting" => "to_email"], ["value" => $request->to_email]);
            saveSetting(["code_setting" => "title"], ["value" => $request->title]);
            saveSetting(["code_setting" => "keywork"], ["value" => $request->keywork]);
            saveSetting(["code_setting" => "description"], ["value" => $request->description]);
            saveSetting(["code_setting" => "hotline"], ["value" => $request->hotline]);

            return redirect(route('setting.index'))->with('thongbao', 'Sửa thông tin thành công');
        } else {
            return view("admin.setting.index");
        }
    }
}
