<?php

namespace App\Utils;

use \Module;
use App\Models\Account;
use App\Models\BusinessLocation;
use App\Models\Product;
use App\Models\System;
use App\Models\Transaction;
use App\Models\User;
use Composer\Semver\Comparator;

class ModuleUtil extends Util
{
    /**
     * This function check if a module is installed or not.
     *
     * @param string $module_name (Exact module name, with first letter capital)
     * @return boolean
     */
    public function isModuleInstalled($module_name)
    {
        $is_available = Module::has($module_name);

        if ($is_available) {
            try{
            //Check if installed by checking the system table {module_name}_version
                $module_version = System::getProperty(strtolower($module_name) . '_version');
                if (empty($module_version)) {
                    return false;
                } else {
                    return true;
                }
            }catch(\Exception $e){
                return false;
            }
        }

        return false;
    }

    /**
     * This function check if superadmin module is installed or not.
     * @return boolean
     */
    public function isSuperadminInstalled()
    {
        return $this->isModuleInstalled('Superadmin');
    }

    /**
     * This function check if a function provided exist in all modules
     * DataController, merges the data and returned it.
     *
     * @param string $function_name
     *
     * @return array
     */
    public function getModuleData($function_name, $arguments = null)
    {   

        $modules = Module::toCollection()->toArray();

        $installed_modules = [];
        foreach ($modules as $module => $details) {

            if ($this->isModuleInstalled($details['name'])) {
                $installed_modules[] = $details;
            }
        }

        $data = [];
        if (!empty($installed_modules)) {
            $enabled_modules = !empty(session('business.enabled_modules')) ? session('business.enabled_modules') : [];

            foreach ($installed_modules as $module) {

                $class = 'Modules\\' . $module['name'] . '\Http\Controllers\DataController';
                
                if (class_exists($class)) {
                    $class_object = new $class();
                    if (method_exists($class_object, $function_name)) {

                        // dd($enabled_modules);
                        if (!empty($arguments)) {

                            $data[$module['name']] = call_user_func([$class_object, $function_name], $arguments);
                        } else {

                            $modulo = '';


                            if (in_array($modulo, $enabled_modules)){
                                $data[$module['name']] = call_user_func([$class_object, $function_name]);
                            }

                            if($module['name'] == 'Superadmin'){
                                $data[$module['name']] = call_user_func([$class_object, $function_name]);
                            }

                            // if($module['name'] == 'Woocommerce'){
                            //     $data[$module['name']] = call_user_func([$class_object, $function_name]);
                            // }

                            // if($module['name'] == 'Essentials'){
                            //     $data[$module['name']] = call_user_func([$class_object, $function_name]);
                            // }
                        }
                    }
                }

            }

        }
        // print_r($data);
        // die;
        return $data;
    }

    /**
     * Checks if a module is defined
     *
     * @param string $module_name
     * @return bool
     */
    public function isModuleDefined($module_name)
    {
        $is_installed = $this->isModuleInstalled($module_name);
        $check_for_enable = [];

        $output = !empty($is_installed) ? true : false;
        
        if (in_array($module_name, $check_for_enable) && !$this->isModuleEnabled(strtolower($module_name))) {
            $output = false;
        }
        return $output;
    }

    /**
     * This function check if a business has active subscription packages
     *
     * @param int $business_id
     * @return boolean
     */
    public function isSubscribed($business_id)
    {
        if ($this->isSuperadminInstalled()) {

            $package = \Modules\Superadmin\Entities\Subscription::active_subscription($business_id);

            if (empty($package)) {
                return false;
            }
        }

        return true;
    }

    /**
     * This function checks if a business has
     *
     * @param int $business_id
     * @param string $permission
     * @param string $callback_function = null
     *
     * @return boolean
     */
    public function hasThePermissionInSubscription($business_id, $permission, $callback_function = null)
    {
        if ($this->isSuperadminInstalled()) {

            if(auth()->user()->can('superadmin')){
                return true;
            }

            $package = \Modules\Superadmin\Entities\Subscription::active_subscription($business_id);

            if($permission == 'repair_module' || $permission == 'manufacturing_module'){
                return true;
            }

            if($permission == 'crm_module' || $permission == 'woocommerce_module' || $permission == 'productcatalogue_module' || $permission == 'essentials_module'){
                return true;
            }

            if (empty($package)) {
                return false;
            } elseif (isset($package['package_details'][$permission])) {
                if (!is_null($callback_function)) {
                    $obj = new ModuleUtil();
                    $permissions = $obj->getModuleData($callback_function);


                    $permission_formatted = [];
                    foreach ($permissions as $per) {
                        foreach ($per as $details) {
                            $permission_formatted[$details['name']] = $details['label'];
                        }
                    }

                    if (isset($permission_formatted[$permission])) {
                        return $package['package_details'][$permission];
                    } else {
                        return false;
                    }
                } else {
                    return $package['package_details'][$permission];
                }
            } else {
                return false;
            }
        }

        return true;
    }

    /**
     * Returns the name of view used to display for subscription expired.
     *
     * @return string
     */
    public static function expiredResponse($redirect_url = null)
    {
        $response_array = [
            'success' => 0,
            'msg' => "Nenhuma assinatura ativa encontrada para o seu negócio"
        ];

        if (request()->ajax()) {
            if (request()->wantsJson()) {
                return $response_array;
            } else {
                return view('superadmin::subscription.subscription_expired_modal');
            }
        } else {
            if (is_null($redirect_url)) {
                return back()
                ->with('status', $response_array);
            } else {
                return redirect($redirect_url)
                ->with('status', $response_array);
            }
        }
    }

    /**
     * This function check if a business has available quota for various types.
     *
     * @param string $type
     * @param int $business_id
     * @param int $total_rows default 0
     *
     * @return boolean
     */
    public function isQuotaAvailable($type, $business_id, $total_rows = 0)
    {
        $is_available = $this->isSuperadminInstalled();
        
        if ($is_available) {
            $package = \Modules\Superadmin\Entities\Subscription::active_subscription($business_id);

            if (empty($package)) {
                return false;
            }

            //Start
            $start_dt = $package->start_date->toDateTimeString();
            $end_dt = $package->end_date->endOfDay()->toDateTimeString();

            if ($type == 'locations') {
                //Check for available location and max number allowed.
                $max_allowed = isset($package->package_details['location_count']) ? $package->package_details['location_count'] : 0;
                if ($max_allowed == 0) {
                    return true;
                } else {
                    $count = BusinessLocation::where('business_id', $business_id)
                    ->count();
                    if ($count >= $max_allowed) {
                        return false;
                    }
                }
            } elseif ($type == 'users') {
                //Check for available location and max number allowed.
                $max_allowed = isset($package->package_details['user_count']) ? $package->package_details['user_count'] : 0;
                if ($max_allowed == 0) {
                    return true;
                } else {
                    $count = User::where('business_id', $business_id)
                    ->where('allow_login', 1)
                    ->count();
                    if ($count >= $max_allowed) {
                        return false;
                    }
                }
            } elseif ($type == 'products') {
                $max_allowed = isset($package->package_details['product_count']) ? $package->package_details['product_count'] : 0;
                if ($max_allowed == 0) {
                    return true;
                } else {
                    $count = Product::where('business_id', $business_id)
                    ->whereBetween('created_at', [$start_dt, $end_dt])
                    ->count();

                    $total_products = $count + $total_rows;
                    if ($total_products >= $max_allowed) {
                        return false;
                    }
                }
            } elseif ($type == 'invoices') {
                $max_allowed = isset($package->package_details['invoice_count']) ? $package->package_details['invoice_count'] : 0;
                
                if ($max_allowed == 0) {
                    return true;
                } else {
                    $count = Transaction::where('business_id', $business_id)
                    ->where('type', 'purchase')
                    ->whereBetween('created_at', [$start_dt, $end_dt])
                    ->count();
                    if ($count >= $max_allowed) {
                        return false;
                    }
                }
            }
        }

        return true;
    }

    /**
     * This function returns the response for expired quota
     *
     * @param string $type
     * @param int $business_id
     * @param string $redirect_url = null
     *
     * @return \Illuminate\Http\Response
     */
    public function quotaExpiredResponse($type, $business_id, $redirect_url = null)
    {
        if ($type == 'locations') {
            if (request()->ajax()) {
                $count = BusinessLocation::where('business_id', $business_id)
                ->count();

                if (request()->wantsJson()) {
                    $response_array = ['success' => 0,
                    'msg' => __("superadmin::lang.max_locations", ['count' => $count])
                ];
                return $response_array;
            } else {
                return view('superadmin::subscription.max_location_modal')
                ->with('count', $count);
            }
        }
    } elseif ($type == 'users') {
        $count = User::where('business_id', $business_id)
        ->count();

        $response_array = ['success' => 0,
        'msg' => __("superadmin::lang.max_users", ['count' => $count])
    ];
    return redirect($redirect_url)
    ->with('status', $response_array);
} elseif ($type == 'products') {
    $count = Product::where('business_id', $business_id)
    ->count();

    $response_array = ['success' => 0,
    'msg' => __("superadmin::lang.max_products", ['count' => $count])
];

return redirect($redirect_url)
->with('status', $response_array);
} elseif ($type == 'invoices') {
    $count = Transaction::where('business_id', $business_id)
    ->where('type', 'purchase')
    ->count();

    $response_array = ['success' => 0,
    'msg' => __("superadmin::lang.max_invoices", ['count' => $count])
];

if (request()->wantsJson()) {
    return $response_array;
} else {
    return redirect($redirect_url)
    ->with('status', $response_array);
}
}
}

public function accountsDropdown($business_id, $prepend_none = false, $closed = false, $show_balance = false)
{
    $dropdown = [];

    if ($this->isModuleEnabled('account')) {
        $dropdown = Account::forDropdown($business_id, $prepend_none, $closed, $show_balance);
    }

    return $dropdown;
}

    /**
     * This function returns the extra form fields in array format
     * required by any module which will be included during adding
     * or updating a resource
     *
     * @param string $function_name function name to be called to get data from
     *
     * @return array
     */
    public function getModuleFormField($function_name)
    {
        $form_fields = [];
        $module_form_fields = $this->getModuleData($function_name);
        if (!empty($module_form_fields)) {
            foreach ($module_form_fields as $key => $value) {
                if (!empty($value) && is_array($value)) {
                    $form_fields = array_merge($form_fields, $value);
                }
            }
        }

        return $form_fields;
    }

    public function getApiSettings($api_token)
    {
        $settings = \Modules\Ecommerce\Entities\EcomApiSetting::where('api_token', $api_token)
        ->first();

        return $settings;
    }

    /**
     * This function returns the installed version, available version
     * and uses comparator to check if update is available or not.
     *
     * @param string $module_name (Exact module name, with first letter capital)
     * @return array
     */
    public function getModuleVersionInfo($module_name)
    {
        $output = ['installed_version' => null,
        'available_version' => null,
        'is_update_available' => null
    ];

    $is_available = Module::has($module_name);

    if ($is_available) {
            //Check if installed by checking the system table {module_name}_version
        $module_version = System::getProperty(strtolower($module_name) . '_version');

        $output['installed_version'] = $module_version;
        $output['available_version'] = config(strtolower($module_name) . '.module_version');

        $output['is_update_available'] = Comparator::greaterThan($output['available_version'], $output['installed_version']);
    }

    return $output;
}

public function availableModules()
{
    return [
        'purchases' => ['name' => __('purchase.purchases')],
        'add_sale' => ['name' => __('sale.add_sale')],
        'pos_sale' => ['name' => 'PDV'],
        'stock_transfers' => ['name' => __('lang_v1.stock_transfers')],
        'stock_adjustment' => ['name' => __('stock_adjustment.stock_adjustment')],
        'expenses' => ['name' => 'Contas a pagar'],
        'ecommerce' => ['name' => 'Ecommerce'],
        'account' => ['name' => __('lang_v1.account')],
        'tables' => [ 
            'name' => __('restaurant.tables'),
            'tooltip' => 'Utilizado em restaurantes e bares etc...'
        ] ,
        'modifiers' => [ 
            'name' => __('restaurant.modifiers'),
            'tooltip' => 'Elementos adicionais agregados com o produto principal, ex: ingredientes'
        ],
        'service_staff' => [
            'name' => 'Equipe de serviço'
        ],
        'booking' => ['name' => __('lang_v1.enable_booking')],
        'kitchen' => [
            'name' => 'Cozinha'
        ],
        'subscription' => [
            'name' => __('lang_v1.enable_subscription')],
            'types_of_service' => ['name' => 'Tipos de serviço',
            'tooltip' => __('lang_v1.types_of_service_help_long')
        ],
    ];
}

    /**
     * Validate module category types and
     * return module category data if validates
     *
     * @param  string  $category_type
     * @return array
     */
    public function getTaxonomyData($category_type)
    {
        $category_types = ['product'];

        $modules_data = $this->getModuleData('addTaxonomies');
        $module_data = [];
        foreach ($modules_data as $module => $data) {
            foreach ($data  as $key => $value) {
                //key is category type
                //check if category type is duplicate
                if (!in_array($key, $category_types)) {
                    $category_types[] = $key;
                } else {
                    echo __('lang_v1.duplicate_taxonomy_type_found');
                    exit;
                }

                if ($category_type == $key) {
                    $module_data = $value;
                }
            }
        }

        if (!in_array($category_type, $category_types)) {
            echo __('lang_v1.taxonomy_type_not_found');
            exit;
        }
        return $module_data;
    }
}
