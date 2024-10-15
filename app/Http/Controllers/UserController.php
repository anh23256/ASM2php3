<?php

namespace App\Http\Controllers;

use App\Models\CartItem;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    const PATH = 'admin.users.';
    public function index()
    {
        try {
            //Lấy tất cả categories
            $users = User::query()->latest('id')->paginate(10);

            return view(self::PATH . __FUNCTION__, compact('users'));
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Lỗi hệ thống
            abort(500);
        }
    }

    public function show(User $user)
    {
        try {
            return view(self::PATH . __FUNCTION__, compact('user'));
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Chuyển về trang chủ với thông báo khi có lỗi
            return redirect()->route('categories.index')->with('success', 'Lỗi hệ thống');
        }
    }

    public function destroy(User $user)
    {
        try {
            //Xóa cart items
            CartItem::query()->where('cart_id', $user->cart->id)->deleteOrFail();

            //Xóa cart
            $user->cart()->deleteOrFail();

            //Xóa user
            $user->deleteOrFail();
            return redirect()->route('users.index')->with('success', true);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Chuyển về trang chủ với thông báo khi có lỗi
            return redirect()->route('users.index')->with('success', 'Xóa không thành công');
        }
    }

    public function create()
    {
        return view(self::PATH . __FUNCTION__);
    }

    public function store(Request $request)
    {
        //Kiểm tra validate
        $data = $request->validate([
            'name'     => ['required', 'max:255'],
            'email'    => ['required', 'email', 'max:255', Rule::unique('users')],
            'password' => ['required', 'max:255'],
        ]);

        try {
            //Thêm mới user
            User::query()->create($data);

            //Chuyển về trang chủ nếu thành công
            return redirect()->route('users.index')->with('success', true);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Chuyển về trang chủ với thông báo khi có lỗi
            return back()->with('success', false);
        }
    }

    public function edit(User $user)
    {
        return view(self::PATH . __FUNCTION__, compact('user'));
    }

    public function update(User $user, Request $request)
    {
        //Kiểm tra validate
        $data = $request->validate([
            'name'     => ['required', 'max:255'],
            'email'    => ['required', 'email', 'max:255', Rule::unique('users')->ignore($user->id)],
        ]);

        try {
            //cập nhật sản phẩm
            $user->update($data);;

            //Chuyển về trang chủ nếu thành công
            return redirect()->route('users.edit', $user)->with('success', true);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Chuyển về trang chủ với thông báo khi có lỗi
            return back()->with('success', 'Lỗi hệ thống');
        }
    }
}
