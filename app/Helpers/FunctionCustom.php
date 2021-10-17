<?php

use App\Models\ContactModel;
use App\Models\Language;
use App\Models\ReservationVistModel;
use App\Models\Setting;

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

if (!function_exists('getLanguage')) {
    function getLanguage()
    {
        $value = (new Language())->where("status", 1)->get();
        return $value;
    }
}


if (!function_exists('saveSetting')) {
    function saveSetting($where, $data)
    {
        $value = (new Setting())->createdOrUpdate($where, $data);
        return $value;
    }
}

if (!function_exists('contactCount')) {
    function contactCount()
    {
        $value = (new ContactModel())
            ->where("status", 1)
            ->count();
        return $value;
    }
}


if (!function_exists('reservationCount')) {
    function reservationCount()
    {
        $value = (new ReservationVistModel())
            ->where("loai", 1)
            ->where("new", 1)
            ->count();
        return $value;
    }
}

if (!function_exists('visitCount')) {
    function visitCount()
    {
        $value = (new ReservationVistModel())
            ->where("loai", 2)
            ->where("new", 1)
            ->count();
        return $value;
    }
}
