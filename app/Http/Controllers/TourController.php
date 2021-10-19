<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TourController extends Controller
{
    public function index($lang = 'en')
    {
        if (!empty($lang)) {
            \Session::put("website_language", $lang);
        }
        \App::setLocale(\Session::get("website_language"));
        if (((!empty(\Session::get('website_language')) && \Session::get('website_language') == 'en')) || $lang == 'en') {
            $lang = 'en';
        } else {
            $lang = '';
        }
        return view('index');
    }

    /**
     * Change language
     */
    public function changLanguage($language)
    {
        \Session::put("website_language", $language);
        \App::setLocale(\Session::get("website_language"));
        return redirect()->route("tour", ["lang" => \Session::get("website_language")]);
    }
}
