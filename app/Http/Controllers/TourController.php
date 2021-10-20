<?php

namespace App\Http\Controllers;

use App\Models\View;
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

        $mView = new View();
        $ip = request()->ip();
        $userAgent = request()->header('user-agent');
        $dateNow = date("Y-m-d H:i:s");
        $view = $mView->where("ip", $ip)->where('user_agent', $userAgent)->orderBy('updated_at', 'desc')->first();
        if (empty($view)) {
            $mView->user_agent = $userAgent;
            $mView->ip         = $ip;
            $mView->save();
        } else {
            $info = $view->toArray();
            $diff = (strtotime($dateNow) - strtotime($info['updated_at'])) / 60;
            if ($diff > 30) {
                $mView->user_agent = $userAgent;
                $mView->ip         = $ip;
                $mView->save();
            }
        }

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
