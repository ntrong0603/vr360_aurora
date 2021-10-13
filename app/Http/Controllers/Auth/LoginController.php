<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/';
    protected $redirectToAdmin = '/admin';

    protected $redirectToAdminLogin = '/admin/login';

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function adminLogin(Request $request)
    {
        $credentials = $request->validate([
            'username' => ['required'],
            'password' => ['required'],
        ]);

        if (Auth::guard('admin')->attempt($credentials)) {
            // if (!auth('admin')->user()->hasRole('admin')) {
            //     Auth::guard('admin')->logout();
            //     $request->session()->invalidate();
            //     $request->session()->regenerateToken();
            //     return back()->withErrors([
            //         'login_fail' => 'Tên đăng nhập hoặc mật khẩu không chính xác.',
            //     ]);
            // }
            $request->session()->regenerate();

            return redirect($this->redirectToAdmin);
        }

        return back()->withErrors([
            'login_fail' => 'Tên đăng nhập hoặc mật khẩu không chính xác.',
        ]);
    }

    public function showAdminLoginForm()
    {
        return view('admin.auth.login', ['url' => route('admin.login')]);
    }

    public function adminLogout(Request $request)
    {
        Auth::guard('admin')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect($this->redirectToAdminLogin);
    }
}
