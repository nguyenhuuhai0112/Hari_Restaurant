<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Models\user\Cart;
use Illuminate\Support\Facades\Auth;

class ViewServiceProvider extends ServiceProvider
{
    public const HOME = '/'; // Trang chủ sau khi đăng nhập
    public static function redirectTo()
    {
        return route('dang-nhap');
    }
    public function boot()
    {
        // Chia sẻ số lượng giỏ hàng với tất cả các view
        View::composer('*', function ($view) {
            $cartCount = 0;

            if (Auth::check()) {
                $cartCount = Cart::where('user_id', Auth::id())->sum('quantity');
            }

            $view->with('cartCount', $cartCount);
        });
    }
}
