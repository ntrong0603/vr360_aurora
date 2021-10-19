<?php

use App\Models\Business;
use App\Models\BusinessLanguage;
use App\Models\ContactModel;
use App\Models\Country;
use App\Models\CountryLanguage;
use App\Models\Language;
use App\Models\ReservationVistModel;
use App\Models\Setting;
use App\Models\Text;
use App\Models\Visiting;
use App\Models\VisitingLanguage;

if (!function_exists('getSetting')) {
    function getSetting($code)
    {
        $value = (new Setting())->where("code_setting", $code)->first();
        if (!empty($value)) {
            return $value->value;
        }
        return null;
    }
}

if (!function_exists('saveSetting')) {
    function saveSetting($where, $data)
    {
        $value = (new Setting())->createdOrUpdate($where, $data);
        return $value;
    }
}

if (!function_exists('getLanguage')) {
    function getLanguage()
    {
        $value = (new Language())->where("status", 1)->get();
        return $value;
    }
}

if (!function_exists('getTitle')) {
    function getTitle($code)
    {

        $name = '';
        $text = (new Text())->where("code", $code)->first();
        $textLanguages = $text->textLanguages ?? [];

        foreach ($textLanguages as $textLanguage) {
            if (\Session::get('website_language') == $textLanguage->lang) {
                $name = $textLanguage->name;
                $find = true;
                break;
            }
        }
        return $name;
    }
}

if (!function_exists('getCountry')) {
    function getCountry()
    {
        $countryLanguageModel = new CountryLanguage();
        $data = [];
        $countries = (new Country())->where('status', 1)->get();
        foreach ($countries as $country) {
            $id = $country->id;
            $name = $country->name;
            $countryLanguage = $countryLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('country_id', $country->id)->first();
            if (!empty($countryLanguage)) {
                $name = $countryLanguage->name;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
            ];
        }
        return $data;
    }
}

if (!function_exists('getBusiness')) {
    function getBusiness()
    {
        $businessLanguageModel = new BusinessLanguage();
        $data = [];
        $businesses = (new Business())->where('status', 1)->get();
        foreach ($businesses as $business) {
            $id = $business->id;
            $name = $business->name;
            $businessLanguage = $businessLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('business_id', $business->id)->first();
            if (!empty($businessLanguage)) {
                $name = $businessLanguage->name;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
            ];
        }
        return $data;
    }
}

if (!function_exists('getVisiting')) {
    function getVisiting()
    {
        $visitingLanguageModel = new VisitingLanguage();
        $data = [];
        $visitings = (new Visiting())->where('status', 1)->get();
        foreach ($visitings as $visiting) {
            $id = $visiting->id;
            $name = $visiting->name;
            $visitingLanguage = $visitingLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('visiting_id', $visiting->id)->first();
            if (!empty($visitingLanguage)) {
                $name = $visitingLanguage->name;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
            ];
        }
        return $data;
    }
}
