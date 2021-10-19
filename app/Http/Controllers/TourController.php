<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TourController extends Controller
{
    public function index(Request $request)
    {
        if (!empty($request->lang)) {
            \Session::put("website_language", $request->lang);
        } else {
            \Session::put("website_language", 'en');
        }
        \App::setLocale(\Session::get("website_language"));
        return view('index');
    }

    /**
     * Change language
     */
    public function changeLanguage($language)
    {
        \Session::put("website_language", $language);
        \App::setLocale(\Session::get("website_language"));
        return redirect()->route("tour", ["lang" => \Session::get("website_language")]);
    }
}
