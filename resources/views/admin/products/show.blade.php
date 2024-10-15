@extends('admin.layouts.master')
@section('title')
    Chi tiết sản phẩm
@endsection
@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Chi tiết sản phẩm: {{ $product->name }}</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="{{ Storage::url($product->image) }}" class="img-fluid rounded-start" alt="Card title" />
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold text-danger">{{ $product->name }}</h5>
                            <p class="card-text">
                                <span class="d-block text-capitalize">description:</span>
                                {{ $product->description }}
                            </p>
                            <p class="card-text">
                                <span class="d-block text-capitalize">category_name:</span>
                                {{ $product->category->name }}
                            </p>
                            <p class="card-text">
                                <span class="d-block text-capitalize">price:</span>
                                {{ number_format($product->price) }} VND
                            </p>
                            <p class="card-text">
                                <span class="d-block text-capitalize">quantity:</span>
                                {{ number_format($product->quantity) }} Sản phẩm
                            </p>
                            <p class="card-text">
                                <span class="d-block text-capitalize">views:</span>
                                {{ number_format($product->views) }} đã xem
                            </p>
                            <p class="card-text">
                                <span class="d-block text-capitalize">created_at:</span>
                                {{ date('d/m/Y', strtotime($product->created_at)) }}
                            </p>
                            <p class="card-text">
                                <span class="d-block text-capitalize">updated_at:</span>
                                {{ date('d/m/y', strtotime($product->updated_at)) }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <a href="{{ route('products.index') }}" class="badge btn btn-danger p-3">Quay lại</a>
        </div>
    </div>
@endsection
