@extends('client.layouts.master')

@section('title')
    Giỏ hàng
@endsection
@section('content')
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Cart</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item active text-white">Cart</li>
        </ol>
    </div>
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Handle</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($cartItems as $cartItem)
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="{{ Storage::url($cartItem->product->image) }}"
                                            class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;"
                                            alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4">{{ $cartItem->product->name }}</p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">{{ number_format($cartItem->product->price) }} VND</p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <a href="{{ route('cart.decrease', $cartItem) }}"
                                                class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                <i class="fa fa-minus"></i>
                                            </a>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0"
                                            value="{{ $cartItem->quantity }}">
                                        <div class="input-group-btn">
                                            <a href="{{ route('cart.increase', $cartItem) }}"
                                                class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">
                                        {{ number_format($cartItem->product->price * $cartItem->quantity) }} VND</p>
                                </td>
                                <td>
                                    <form action="{{ route('cart.destroy', $cartItem) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-md rounded-circle bg-light border mt-4">
                                            <i class="fa fa-times text-danger"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="row g-4 justify-content-end">
                <div class="col-8"></div>
                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                    <div class="bg-light rounded">
                        <div class="p-4">
                            <h1 class="display-6 mb-4">Thanh Toán</h1>
                            <div class="d-flex justify-content-between mb-4">
                                <h5 class="mb-0 me-4">Tổng:</h5>
                                <p class="mb-0">{{ number_format($total) }} VND</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h5 class="mb-0 me-4">Shipping</h5>
                                <div class="">
                                    <p class="mb-0">
                                        @if ($total != 0)
                                            21,000 VND
                                        @else
                                            0 VND
                                        @endif
                                    </p>
                                </div>
                            </div>
                            <p class="mb-0 text-end">Gửi từ Việt Nam.</p>
                        </div>
                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                            <h5 class="mb-0 ps-4 me-4">Thành tiền</h5>
                            <p class="mb-0 pe-4">
                                @if ($total != 0)
                                    {{ number_format($total + 21000) }}
                                @else
                                    {{ number_format($total) }}
                                @endif
                                VND
                            </p>
                        </div>
                        <a href="{{route('checkout')}}" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">Proceed Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
