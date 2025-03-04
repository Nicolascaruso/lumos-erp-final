<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\ConfigEcommerce;
// header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type,      Accept");
// header("Content-Type: application/json");
class authEcommerce
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = $request->header('Authorization');

        $config = ConfigEcommerce::
        where('token', $token)
        ->first();

        if($config == null){
            return response()->json("", 404);
        }

        $request->merge(['business_id' => $config->business_id]);
        return $next($request);
    }
}
