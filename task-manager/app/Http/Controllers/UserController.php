<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET show login page
     */
    public function showLogin() {
        return view('validation.login');
    }


    /**
     * @param Request $request
     * @POST login details
     */
    public function postLogin(Request $request) {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password], $request->checked)){
            return redirect()->route('tasks');
        }else{
            return back();
        }
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     * @GET show signup page
     */
    public function showSignup() {
        return view('validation.signup');
    }

    /**
     * @param Request $request
     * @POST signup to task manager
     */
    public function postSignup(Request $request) {
        //validate form
        request()->validate([
            'fname' => 'required',
            'lname' => 'required',
            'email' => 'required|email',
            'password' => 'required|confirmed'
        ]);

        //check if user model has email
        $user = User::where('email', $request->email)->first();

        if($user){
            dd('email already taken');
            //return page with email already taken error
        }else{
            //insert into database
            $user = User::create([
                'first_name' => $request->fname,
                'last_name' => $request->lname,
                'address' => $request->email,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);

            //login user
            Auth::login($user);

            //redirect to tasks page
            return redirect()->route('tasks')->withSuccess('Successfully Signed In');
        }
    }

    /**
     * @return \Illuminate\Http\RedirectResponse
     * @POST logout
     */
    public function logout() {
        Auth::logout();
        return redirect()->route('login.user');
    }
}
