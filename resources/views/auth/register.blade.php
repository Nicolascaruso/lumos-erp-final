<?php
// resources/views/auth/register.blade.php
?>
@extends('layouts.app')
@section('content')
<div class="min-h-screen flex items-center justify-center">
    <form class="bg-white p-6 rounded shadow-md" method="POST" action="{{ route('register') }}">
        @csrf
        <h2 class="text-xl font-semibold mb-4">Cadastro</h2>
        <input type="text" name="name" placeholder="Nome" required class="w-full p-2 border rounded mb-3">
        <input type="email" name="email" placeholder="Email" required class="w-full p-2 border rounded mb-3">
        <input type="password" name="password" placeholder="Senha" required class="w-full p-2 border rounded mb-3">
        <input type="password" name="password_confirmation" placeholder="Confirme a senha" required class="w-full p-2 border rounded mb-3">
        <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded">Registrar</button>
    </form>
</div>
@endsection
