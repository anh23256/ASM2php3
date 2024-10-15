<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckRoleApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        //Phân quyền đọc
        $abilitieRead = ['index', 'show', 'products'];

        //Lấy tên của phương thức hành động
        $action = $request->route()->getActionMethod();

        //Kiểm tra xem user có phải admin không nếu có được next resquest (Được toàn quyền)
        //không thì kiểm tra quyền nó đang có và hành động nó được thực 
        if ($request->user()->role == 'admin') {
            return $next($request);
        } elseif ($request->user()->tokenCan('read') && in_array($action, $abilitieRead)) {
            return $next($request);
        } else {
            return response()->json([
                'message' => 'Không có quyền truy cập'
            ], Response::HTTP_FORBIDDEN);
        }
    }
}
