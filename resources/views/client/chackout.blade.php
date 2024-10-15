@extends('client.layouts.master')

@section('title')
    Thanh toán
@endsection
@section('content')
    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Checkout</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item active text-white">Checkout</li>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <!-- Checkout Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <h1 class="mb-4">Chi tiết thanh toán</h1>
            <form action="{{ route('store.checkout') }}" method="POST">
                @csrf

                <div class="row g-5">
                    <div class="col-5">
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="form-item w-100">
                                    <label class="form-label my-3">Tên<sup>*</sup></label>
                                    <input name="name" type="text" class="form-control" value="{{ old('name') ?? $user->name }}">
                                    @error ('name')
                                        <span class="text-danger my-2">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3">Địa chỉ <sup>*</sup></label>
                            <input name="address" type="text" class="form-control" value="{{old('address')}}" placeholder="Nhập địa chỉ của bạn">
                            @error ('address')
                                <span class="text-danger my-2">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3">Số điện thoại<sup>*</sup></label>
                            <input name="phone" type="tel" class="form-control" value="{{old('phone')}}"  placeholder="Nhập số điện thoại của bạn">
                            @error ('phone')
                                <span class="text-danger my-2">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3">Địa chỉ email<sup>*</sup></label>
                            <input name="email" value="{{ old('email') ?? $user->email }}" type="email" class="form-control">
                            @error ('email')
                                <span class="text-danger my-2">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Tổng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($cartItems as $cartitem)
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center mt-2">
                                                    <img src="{{ Storage::url($cartitem->product->image) }}"
                                                        class="img-fluid rounded-circle" style="width: 90px; height: 70px;"
                                                        alt="">
                                                </div>
                                            </th>
                                            <td class="py-5">{{ $cartitem->product->name }}</td>
                                            <td class="py-5">{{ number_format($cartitem->product->price) }} VND</td>
                                            <td class="py-5">{{ $cartitem->quantity }}</td>
                                            <td class="py-5">
                                                {{ number_format($cartitem->product->price * $cartitem->quantity) }} VND
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                            <div class="col-12">
                                <div class="form-check text-start my-3">
                                    <input type="checkbox" class="form-check-input bg-primary border-0" id="Transfer-1"
                                        name="Transfer" value="Transfer">
                                    <label class="form-check-label" for="Transfer-1">Chuyển khoản ngân hàng</label>
                                </div>
                                <p class="text-start text-dark">Thanh toán trực tiếp vào tài khoản ngân hàng của chúng tôi.
                                    Vui lòng sử dụng Mã đơn hàng của bạn làm tham chiếu thanh toán. Đơn hàng của bạn sẽ
                                    không được giao cho đến khi tiền được chuyển vào tài khoản của chúng tôi.</p>
                            </div>
                        </div>
                        <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                            <div class="col-12">
                                <div class="form-check text-start my-3">
                                    <input type="checkbox" class="form-check-input bg-primary border-0" id="Delivery-1"
                                        name="Delivery" value="Delivery">
                                    <label class="form-check-label" for="Delivery-1">Thanh toán khi nhân hàng</label>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                            <div class="col-12">
                                <div class="form-check text-start my-3">
                                    <input type="checkbox" class="form-check-input bg-primary border-0" id="Paypal-1"
                                        name="Paypal" value="Paypal">
                                    <label class="form-check-label" for="Paypal-1">Ví VNPay</label>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                            <button type="submit"
                                class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Thanh toán</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Checkout Page End -->
@endsection
