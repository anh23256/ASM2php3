<?php

namespace App\Http\Controllers;

use App\Models\CartItem;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            /**
             * @var \App\Models\User $user
             */
            //Lấy thông tin của người dùng
            $user = Auth::user();

            //Xem user rỗng thì chuyển đến lỗi
            if (!empty($user)) {
                //Lấy dữ liệu cart theo user
                $cart = $user->cart;
                //Lấy dữ liệu cartIteams theo cart
                $cartItems = $cart->cartItems;

                $check = CartItem::query()->where('cart_id',$cart->id)->limit(1)->firstOrFail();

                //KIểm tra xem cart có sản phẩm không. Không có thì trả về lỗi
                if (!empty($cartItems)) {
                    //Lấy dữ liệu products dựa theo cartItem
                    $cartItems = $cartItems->load('product');
                    return view('client.chackout', compact('user', 'cartItems'));
                } else {
                    //Trả về lỗi khi không có dữ liệu cartItems
                    return redirect()->route('cart');
                }
            } else {
                //Trả về lỗi khi không có dữ liệu user
                return redirect()->route('login');
            }
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            return redirect()->route('cart');
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //Kiểm tra validate
        $data = $request->validate([
            'name' => ['string', 'min:2', 'max:20', 'required'],
            'address' => ['required'],
            'phone' => ['required', 'between:9,10'],
            'email' => ['required', 'email']
        ]);

        try {
            //Lấy dữ liệu user
            $user = Auth::user();
            //Lấy dữ liệu cart
            $cart = $user->cart;
            //Lấy dữ liệu cartItems
            $cartItems = $cart->cartItems;
            // dd($cartItems);
            //Lưu user id
            $data['user_id'] = $user->id;
            $data['total_amount'] = 0;

            //Kiểm tra xem cartItems rỗng không nếu có trả về trang cart
            if (!empty($cartItems)) {
                foreach ($cartItems as $cartitem) {
                    //Tính tống tiền
                    $data['total_amount'] += $cartitem->quantity * $cartitem->product->price;
                }

                //Lưu dữ liệu vào order
                DB::transaction(function () use ($data, $cartItems, $cart) {
                    //Thêm dữ liệu vào order
                    $order = Order::create($data);

                    //Thêm dữ liệu vào orderItems
                    foreach ($cartItems as $cartitem) {
                        OrderItem::query()->create([
                            'order_id'   => $order->id,
                            'product_id' => $cartitem->product->id,
                            'quantity'   => $cartitem->quantity,
                            'price'      => $cartitem->product->price,
                        ]);
                    }

                    //Xóa cartItems khi thêm dữ liệu thành công
                    CartItem::query()->where('cart_id', $cart->id)->delete();
                });

                return redirect()->route('/');
            } else {
                return redirect()->route('cart');
            }
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            return redirect()->route('checkout');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Order $order)
    {
        //
    }
}
