<!doctype html>
<html lang="{{ config('app.locale') }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>@yield('title')</title>

        <!-- Fonts -->
        <!-- <link href="https://fonts.googleapis.com/css?family=Raleway:100,300,600" rel="stylesheet" type="text/css"> -->

        <link rel="stylesheet" href="{{ asset('css/vendor.css') }}">

        <!-- Styles -->
        <style>
            body {
                min-height: 100vh;
                background-color: #231a6e;
                color: #fff;
                background-image: url("public/images/hero-bg.png");

            }
            .navbar-default {
                background-color: transparent;
                border: none;
            }
            .navbar-static-top {
                margin-bottom: 19px;
            }
            .navbar-default .navbar-nav>li>a {
                color: #fff;
                font-weight: 600;
                font-size: 26px
            }
            .navbar-default .navbar-nav>li>a:hover{
                color: #ccc;
            }
            .navbar-default .navbar-brand {
                color: #ccc;
            }

        </style>
    </head>

    <body>
    @include('layouts.partials.home_header')
    <div class="container">
        <div class="content">
            @yield('content')
        </div>
    </div>
    <div class="logo-container" style="display: flex; flex-direction: column; margin-top: -180px; align-items: center; justify-content: center; height: 100vh;">
    <a href="https://lumos-erp.com.br" target="_blank">
        <img src="public/images/logo.png" alt="Logo" style="margin-top: 5px;">
    </a>
    <h4 style="text-align: center; color: white; margin-top: 10px;">Clique na imagem acima e conheça mais sobre Lumos-ERP</h4>
</div>


    </div>
    @include('layouts.partials.javascripts')

    <!-- Scripts -->
    <script src="{{ asset('js/login.js?v=' . $asset_v) }}"></script>
    @yield('javascript')
</body>

