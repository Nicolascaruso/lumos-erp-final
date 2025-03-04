@extends('layouts.app')
@section('content')
<div class="min-h-screen flex items-center justify-center flex-col">
    <form class="bg-white p-6 rounded shadow-md" method="POST" action="{{ route('login') }}">
        @csrf
        <h2 class="text-xl font-semibold mb-4">Login</h2>
        <input type="email" name="email" placeholder="Email" required class="w-full p-2 border rounded mb-3">
        <input type="password" name="password" placeholder="Senha" required class="w-full p-2 border rounded mb-3">
        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Entrar</button>
    </form>
    <a href="{{ route('register') }}" class="mt-4 text-blue-500">Não tem uma conta? Cadastre-se</a>
</div>
@endsection
