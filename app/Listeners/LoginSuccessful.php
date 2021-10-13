<?php

namespace App\Listeners;

use Illuminate\Auth\Events\Login;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Session;
use App\Models\UserPlace;

class LoginSuccessful
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  Login  $event
     * @return void
     */
    public function handle(Login $event)
    {
        $arrPlace = [];
        // if ((auth('admin')->user()->hasRole('agency') || auth('admin')->user()->hasRole('member')) && auth('customer')->user()) {
        if (auth('admin') && (auth('admin')->user()->hasRole('agency') || auth('admin')->user()->hasRole('member'))) {
            $arrPlace = $event->user->places->pluck('id')->all() ?? [];
        }
        session(['places' => $arrPlace]);
    }
}
