<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class CartController extends Controller
{
    public function cart()
    {
        try {
            //lấy dữ liệu user đã được lưu;
            $user = Auth::user();

            if (!empty($user)) {

                //Kiểm tra user có cart chưa chưa có thì tạo
                if ($user->cart) {
                    $cart_id = $user->cart->id;
                } else {
                    $cart = Cart::query()->create([
                        'user_id' => $user->id,
                    ]);
                    $cart_id = $cart->id;
                }

                //Lưu cart_id
                session(['cart_id' => $cart_id]);

                //Lấy dữ liệu cart items của user
                $cartItems = CartItem::query()
                    ->with(['product' => function ($query) {
                        $query->select('id', 'name', 'image', 'price');
                    }])
                    ->where('cart_id', $cart_id)->get();

                $total = 0;
                //kiểm tra xem có items không nếu không rỗng thì tính tiền
                if (!empty($cartItems)) {
                    foreach ($cartItems as $cartitem) {
                        //Tính tống tiền
                        $total += $cartitem->quantity * $cartitem->product->price;
                    }
                }
                return view('client.cart', compact('cartItems', 'total'));
            } else {
                //Trả về lỗi khi không có dữ liệu user
                return throw new \Exception('Không có dữ liệu user');
            }
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            return redirect()->route('/');
        }
    }

    public function addCart(Product $product, Request $request)
    {
        try {
            //lấy dữ liệu user đã được lưu;
            $user = Auth::user();

            //Kiểm tra xem có tồn tại user hay không và nó có rỗng hay không
            if (!empty($user)) {

                //Kiểm tra user có cart chưa chưa có thì tạo
                if ($user->cart) {
                    $cart_id = $user->cart->id;
                } else {
                    $cart = Cart::query()->create([
                        'user_id' => $user->id,
                    ]);
                    $cart_id = $cart->id;
                }

                //Lưu id của cart
                session(['cart_id' => $cart_id]);

                //Tìm xem đã có sản phẩm này trong cart chưa
                $findCartItem = CartItem::query()->where('cart_id', $cart_id)
                    ->where('product_id', $product->id)
                    ->first();

                //Kiểm tra xem nếu không có thì tạo mới cart item nếu có thì quantity + 1
                if (!empty($findCartItem->product)) {
                    //Cập nhật số lượng thêm 1
                    $findCartItem->increment('quantity', $request->input('quantity') ?? 1);
                } else {
                    //dữ liệu của cart item
                    $data = [
                        'cart_id'    =>  $cart_id,
                        'product_id' =>  $product->id,
                        'quantity'   =>  $request->input('quantity') ?? 1,
                    ];

                    CartItem::query()->create($data);
                }

                return redirect()->route('cart');
            } else {
                abort(401);
            }
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            abort(500);
        }
    }

    public function destroy(CartItem $cartItem)
    {
        try {
            //Xóa cart item
            $cartItem->delete();

            return redirect()->route('cart');
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            abort(500);
        }
    }

    public function increaseQuantity(CartItem $cartItem)
    {
        try {
            //lấy số lượng của sản phẩm
            $productQuantity = $cartItem->product->quantity;

            //Kiểm tra xem số lượng sản phẩm trong cart có vượt số lượng của sản phẩm không
            if ($cartItem->quantity < $productQuantity) {
                //Tăng số lượng của cart item
                $cartItem->increment('quantity', 1);
            }

            return redirect()->route('cart');
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            return redirect()->route('cart');
        }
    }

    public function decreaseQuantity(CartItem $cartItem)
    {
        try {
            // Kiểu tra xem quantity của cart item có lớn hơn 1 không nếu có mới trừ
            if ($cartItem->quantity > 1) {
                $cartItem->decrement('quantity', 1);
            }

            return redirect()->route('cart');
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            return redirect()->route('cart');
        }
    }
}
