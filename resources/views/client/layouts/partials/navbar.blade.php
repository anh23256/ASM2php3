<a href="{{ route('/') }}" class="navbar-brand">
    <h1 class="text-primary display-6">Fruitables</h1>
</a>
<button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
    <span class="fa fa-bars text-primary"></span>
</button>
<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
    <div class="navbar-nav mx-auto">
        <a href="{{ route('/') }}" class="nav-item nav-link active">Trang chủ</a>
        <a href="{{ route('shop') }}" class="nav-item nav-link">Sản phẩm</a>
        <div class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Trang</a>
            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                <a href="{{ route('cart') }}" class="dropdown-item">Giỏ hàng</a>
                <a href="/chackout" class="dropdown-item">Thanh toán</a>
                {{-- <a href="{{ route('/testimonial') }}testimonial.html" class="dropdown-item">Testimonial</a> --}}
                {{-- <a href="{{ route('/404') }}404.html" class="dropdown-item">404 Page</a> --}}
            </div>
        </div>
        <a href="contact" class="nav-item nav-link">Liên hệ</a>
    </div>
    <div class="d-flex m-3 me-0">
        <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
            data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
        <a href="{{ route('cart') }}" class="position-relative me-4 my-auto">
            <i class="fa fa-shopping-bag fa-2x"></i>
            <span
                class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
        </a>
        <div class="nav-item dropdown">
            <a class="nav-link" data-bs-toggle="dropdown"><i class="fas fa-user fa-2x"></i></a>
            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                @if (Route::has('login'))
                    <div class="sm:fixed sm:top-0 sm:right-0 p-6 text-right z-10">
                        @auth
                            <form class="dropdown-item" action="{{ route('logout') }}" method="POST">
                                @csrf

                                <button style="all: unset;width: 100%;back" type="submit">Đăng xuất</button>
                            </form>
                            @if (Auth::user()->role == 'admin')
                                <a href="{{ route('admin') }}"
                                    class="dropdown-item font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500">Vào
                                    trang quản trị</a>
                            @endif
                        @else
                            <a href="{{ route('login') }}"
                                class="dropdown-item font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500">Log
                                in</a>

                            @if (Route::has('register'))
                                <a href="{{ route('register') }}"
                                    class="dropdown-item ml-4 font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500">Register</a>
                            @endif
                        @endauth
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
