<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Env;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{

    public function request(Request $request)
    {
        return $request;
    }
    public function register()
    {
        try {

            //validate user
            $data = request()->validate([
                'name'     => ['max:255', 'required'],
                'email'    => ['required', 'email', Rule::unique('users')],
                'password' => ['required', 'min:8', 'max:20'],
            ]);

            //tạo user
            $user = User::create($data);

            // Gửi email xác thực
            $user->sendEmailVerificationNotification();

            return response()->json([
                'message' => 'Đăng ký thành công. Vui lòng kiểm tra email của bạn để xác thực.'
            ], Response::HTTP_CREATED);
        } catch (\Throwable $th) {
            //ghi log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Bắt lỗi validate thông qua instanceof để kiểm tra lớp
            if ($th instanceof ValidationException) {
                return response()->json([
                    'errors' => $th->errors(),
                ], Response::HTTP_BAD_REQUEST);
            }

            return response()->json([
                'status'  => false,
                'messega' => 'Lỗi hệ thống',
                'errors'  => $th->getMessage(),
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function login()
    {
        try {
            $login = request()->validate([
                'email'    => ['required', 'email'],
                'password' => ['required', 'max:20']
            ]);

            if (Auth::attempt($login)) {
                /**
                 * @var \App\Models\User $user
                 */
                $user = request()->user();

                //Kiểm tra xem email người dùng được xác minh chưa
                if ($user->hasVerifiedEmail() == false) {
                    //Nếu chưa gửi email yêu cầu xác minh
                    $user->sendEmailVerificationNotification();

                    //Xóa session
                    Auth::logout();

                    return response()->json([
                        'status' => false,
                        'message' => 'Bạn chưa xác thực email! Vui lòng xác thực email để đăng nhập',
                    ], Response::HTTP_UNAUTHORIZED);
                }

                if ($user->role == 'admin') {
                    //Lưu token phân tất cả các quyền cho admin
                    $token = $user->createToken(Env('APP_NAME'))->plainTextToken;
                } else {
                    //Lưu token phân quyền chỉ cho đọc với role khác admin
                    $token = $user->createToken(Env('APP_NAME'), ['read'])->plainTextToken;
                }

                return response()->json([
                    'status' => true,
                    'message' => 'Đăng nhập thành công',
                    'token'  => $token,
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Thông tin nhập chưa đúng! Vui lòng thử lại',
                ], Response::HTTP_UNAUTHORIZED);
            }
        } catch (\Throwable $th) {
            //ghi log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Check validate
            if ($th instanceof ValidationException) {
                return response()->json([
                    'status' => false,
                    'errors' => $th->errors(),
                ], Response::HTTP_BAD_REQUEST);
            }

            return response()->json([
                'status' => false,
                'message' => 'Lỗi hệ thống',
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function logout()
    {
        try {
            /**
             * @var \App\Models\User $user
             */

            //Kiểm tra xem tài khoản đã đăng nhập chưa
            if (Auth::check()) {
                $user = request()->user();

                $user->tokens()->delete();

                return response()->json([
                    'status' => true,
                    'message' => 'Đăng xuất thành công',
                ]);
            }
        } catch (\Throwable $th) {
            //ghi log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Lỗi hệ thống',
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
