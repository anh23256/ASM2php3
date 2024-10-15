<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>@yield('title')</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    @include('client/layouts/partials/css')
    @yield('css')

</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
        @include('client.layouts.partials.spinner')
    </div>
    <!-- Spinner End -->


    <!-- Navbar start -->
    <div class="container-fluid fixed-top">
        <div class="container topbar bg-primary d-none d-lg-block">
            @include('client.layouts.partials.topbar')
        </div>
        <div class="container px-0">
            <nav class="navbar navbar-light bg-white navbar-expand-xl">
                @include('client.layouts.partials.navbar')
            </nav>
        </div>
    </div>
    <!-- Navbar End -->
    @yield('content')

    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
        @include('client.layouts.partials.footer')
    </div>
    <!-- Footer End -->

    <!-- Copyright Start -->
    <div class="container-fluid copyright bg-dark py-4">
        @include('client.layouts.partials.copyright')
    </div>
    <!-- Copyright End -->



    <!-- Back to Top -->
    @include('client.layouts.partials.backtop')

    @include('client.layouts.partials.script')
</body>


</html>
