<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

include_once('install_r.php');
use App\Models\Transaction;
use App\Models\Test;


Route::middleware(['authh'])->group(function () {
    Route::get('/', function () {
        return view('welcome');
    });

    Auth::routes();

    Route::get('/business/register', 'BusinessController@getRegister')->name('business.getRegister');
    Route::post('/business/register', 'BusinessController@postRegister')->name('business.postRegister');
    Route::post('/business/register/check-username', 'BusinessController@postCheckUsername')->name('business.postCheckUsername');
    Route::post('/business/register/check-email', 'BusinessController@postCheckEmail')->name('business.postCheckEmail');

    Route::get('/invoice/{token}', 'SellPosController@showInvoice')
    ->name('show_invoice');

});

Route::get('/payment', 'PaymentController@index')->name('payment.index');
Route::post('/paymentPix', 'PaymentController@paymentPix')->name('payment.pix');
Route::post('/paymentBoleto', 'PaymentController@paymentBoleto')->name('payment.boleto');
Route::post('/paymentCartao', 'PaymentController@paymentCartao')->name('payment.cartao');

Route::get('/payment/finish/{transaction_id}', 'PaymentController@finish')->name('payment.finish');


//Routes for authenticated users only
Route::middleware(['authh', 'auth', 'SetSessionData', 'language', 'timezone', 'AdminSidebarMenu', 'CheckUserLogin', 'CheckPayment'])->group(function () {

    Route::resource('naturezas', 'NaturezaController');
    Route::resource('veiculos', 'VeiculoController');
    Route::resource('cities', 'CityController');
    Route::resource('ibpt', 'IbptController');
    Route::get('/ibptlist/{id}', 'IbptController@list')->name('ibpt.list');

    Route::get('/update', 'UpdateController@index');
    Route::post('/sql', 'UpdateController@sql');

    Route::resource('inutilizacao', 'InutilController');
    Route::resource('import-xml', 'ImportXmlController');
    Route::post('/import-xml/preview', 'ImportXmlController@preview');

    Route::get('/inutilizacao/{id}/issue', 'InutilController@issue');
    Route::post('/inutilizacao/issue', 'InutilController@issuePost');


    Route::group(['prefix' => '/ecommerce'], function(){
        Route::get('/config', 'EcommerceController@config');
        Route::post('/save', 'EcommerceController@save');
        
    });


    Route::group(['prefix' => '/carrosselEcommerce'], function(){
        Route::get('/', 'CarrosselController@index');
        Route::get('/new', 'CarrosselController@create');
        Route::get('/edit/{id}', 'CarrosselController@edit');
        Route::post('/store', 'CarrosselController@store');
        Route::put('/update/{id}', 'CarrosselController@update');
        Route::delete('/delete/{id}', 'CarrosselController@delete');
        
    });

    Route::group(['prefix' => '/clienteEcommerce'], function(){
        Route::get('/', 'ClienteEcommerceController@index');
        Route::get('/new', 'ClienteEcommerceController@create');
        Route::get('/edit/{id}', 'ClienteEcommerceController@edit');
        Route::post('/save', 'ClienteEcommerceController@save');
        Route::put('/update/{id}', 'ClienteEcommerceController@update');
        Route::delete('/delete/{id}', 'ClienteEcommerceController@delete');
        
        Route::get('/pedidos/{id}', 'ClienteEcommerceController@pedidos');

    });

    Route::group(['prefix' => 'enderecosEcommerce'],function(){
        Route::get('/{cliente_id}', 'EnderecoEcommerceController@index');
        Route::get('/edit/{id}', 'EnderecoEcommerceController@edit');
        Route::post('/update', 'EnderecoEcommerceController@update'); 
    });

    Route::group(['prefix' => '/pedidosEcommerce'], function(){
        Route::get('/', 'PedidoEcommerceController@index');
        Route::get('/ver/{id}', 'PedidoEcommerceController@ver');
        Route::post('/salvarCodigo', 'PedidoEcommerceController@salvarCodigo');
        Route::get('/gerarNFe/{id}', 'PedidoEcommerceController@gerarNFe');
        Route::post('/salvarVenda', 'PedidoEcommerceController@salvarVenda');
        Route::get('/consultarPagamentos', 'PedidoEcommerceController@consultarPagamentos');
        
    });

    Route::group(['prefix' => '/contatoEcommerce'], function(){
        Route::get('/', 'ContatoController@index');
    });

    Route::group(['prefix' => '/informativoEcommerce'], function(){
        Route::get('/', 'InformativoController@index');
    });
    
    Route::group(['prefix' => '/freteGratis'], function(){
        Route::get('/', 'CidadeFreteGratisController@index');
        Route::get('/new', 'CidadeFreteGratisController@new');
        Route::post('/save', 'CidadeFreteGratisController@save');
        Route::get('/delete/{id}', 'CidadeFreteGratisController@delete');
        Route::get('/edit/{id}', 'CidadeFreteGratisController@edit');
        Route::post('/update', 'CidadeFreteGratisController@update');
    });

    Route::group(['prefix' => '/cupom'], function(){
        Route::get('/', 'CupomController@index');
        Route::get('/new', 'CupomController@new');
        Route::post('/save', 'CupomController@save');
        Route::get('/delete/{id}', 'CupomController@delete');
        Route::get('/edit/{id}', 'CupomController@edit');
        Route::post('/update', 'CupomController@update');
    });

    Route::resource('cte', 'CteController');
    Route::get('/cteXmls', 'CteController@xmls')->name('cte.xmls');
    Route::post('/importXml', 'CteController@importarXml')->name('cte.import-xml');
    Route::get('/cteFiltroXml', 'CteController@filtroXml')->name('cte.filtroXml');
    Route::get('/cteBaixarZipXmlAprovado/{location_id}', 'CteController@baixarZipXmlAprovado')->name('cte.baixarZipXmlAprovado');
    Route::get('/cteBaixarZipXmlReprovado/{location_id}', 'CteController@baixarZipXmlReprovado')->name('cte.baixarZipXmlReprovado');

    Route::group(['prefix' => '/cte'], function(){
        Route::get('/gerar/{id}', 'CteController@gerar')->name('cte.gerar');
        Route::get('/renderizar/{id}', 'CteController@renderizar')->name('cte.renderizar');
        Route::get('/gerarXml/{id}', 'CteController@gerarXml')->name('cte.gerarXml');

        Route::post('/transmitir', 'CteController@transmitir')->name('cte.transmitir');
        Route::get('/imprimirCancelamento/{id}', 'CteController@imprimirCancelamento')->name('cte.imprimirCancelamento');
        Route::get('{id}/imprimir', 'CteController@imprimir')->name('cte.imprimir');
        Route::get('/ver/{id}', 'CteController@ver')->name('cte.ver');
        Route::get('/baixarXml/{id}', 'CteController@baixarXml')->name('cte.baixarXml');
        Route::get('/baixarXmlCancelado/{id}', 'CteController@baixarXmlCancelado')->name('cte.baixarXmlCancelado');
        Route::post('/cancelar', 'CteController@cancelar')->name('cte.cancelar');
        Route::post('/corrigir', 'CteController@corrigir')->name('cte.corrigir');
        Route::post('/consultar', 'CteController@consultar')->name('cte.consultar');
        Route::post('/importarXml', 'CteController@importarXml')->name('cte.importarXml');   
    });

    Route::resource('mdfe', 'MdfeController');
    Route::get('/mdfeXmls', 'MdfeController@xmls')->name('mdfe.xmls');
    Route::get('/mdfeNaoEncerrados', 'MdfeController@naoencerrados')->name('mdfe.nao-encerrados');
    Route::get('/mdfeEncerrar', 'MdfeController@naoencerrados')->name('mdfe.nao-encerrados');
    Route::get('/mdfeFiltroXml', 'MdfeController@filtroXml')->name('mdfe.filtro-xml');

    Route::group(['prefix' => '/mdfe'], function(){
        // Route::get('/', 'MdfeController@index');
        // Route::get('/new', 'MdfeController@new');
        // Route::post('/save', 'MdfeController@save');
        // Route::post('/update', 'MdfeController@update');
        // Route::get('/delete/{id}', 'MdfeController@delete');
        // Route::get('/edit/{id}', 'MdfeController@edit');
        Route::get('/gerar/{id}', 'MdfeController@gerar')->name('mdfe.gerar');
        Route::get('/renderizar/{id}', 'MdfeController@renderizar')->name('mdfe.renderizar');
        Route::get('/gerarXml/{id}', 'MdfeController@gerarXml')->name('mdfe.gerar-xml');

        Route::post('/transmitir', 'MdfeController@transmitir')->name('mdfe.transmitir');
        Route::get('/imprimirCancelamento/{id}', 'MdfeController@imprimirCancelamento')->name('mdfe.imprimir-cancelamento');
        Route::get('/imprimir/{id}', 'MdfeController@imprimir')->name('mdfe.imprimir');
        Route::get('/ver/{id}', 'MdfeController@ver')->name('mdfe.ver');
        Route::get('/baixarXml/{id}', 'MdfeController@baixarXml')->name('mdfe.baixar-xml');
        Route::get('/baixarXmlCancelado/{id}', 'MdfeController@baixarXmlCancelado')->name('mdfe.baixar-xml-cancelado');
        Route::post('/cancelar', 'MdfeController@cancelar')->name('mdfe.cancelar');
        Route::post('/corrigir', 'MdfeController@corrigir')->name('mdfe.corrigir');
        Route::post('/consultar', 'MdfeController@consultar')->name('mdfe.consultar');

        
        Route::get('/baixarZipXmlAprovado', 'MdfeController@baixarZipXmlAprovado')->name('mdfe.baixar-zip-aprovado');
        Route::get('/baixarZipXmlReprovado', 'MdfeController@baixarZipXmlReprovado')->name('mdfe.baixar-zip-reprovado');
        
        Route::get('/encerrar/{chave}/{protocolo}/{location_id}', 'MdfeController@encerrar')->name('mdfe.encerrar');
        
    });

    Route::group(['prefix' => '/manifesto'], function(){
        Route::get('/', 'ManifestoController@index');
        Route::get('/byLocation/{location_id}', 'ManifestoController@getByLocation');
        Route::get('/buscarNovosDocumentos', 'ManifestoController@buscarNovosDocumentos');
        Route::get('/getDocumentosNovos', 'ManifestoController@getDocumentosNovos');
        Route::get('/getDocumentosNovosLocation', 
            'ManifestoController@getDocumentosNovosLocation');

        Route::get('/manifestar', 'ManifestoController@manifestar');
        Route::get('/imprimirDanfe/{id}', 'ManifestoController@imprimirDanfe');
        Route::get('/download/{id}', 'ManifestoController@download');
        Route::get('/baixarXml/{id}', 'ManifestoController@baixarXml');
        Route::get('/cadProd', 'ManifestoController@cadProd');
        Route::get('/atribuirEstoque', 'ManifestoController@atribuirEstoque');
        Route::post('/salvarFornecedor', 'ManifestoController@salvarFornecedor');
        Route::post('/salvarFatura', 'ManifestoController@salvarFatura');
        Route::post('/save', 'ManifestoController@save');

    });

    Route::group(['prefix' => '/transportadoras'], function(){
        Route::get('/', 'TransportadoraController@index');
        Route::get('/new', 'TransportadoraController@new');
        Route::post('/save', 'TransportadoraController@save');
        Route::get('/delete/{id}', 'TransportadoraController@delete');
        Route::get('/edit/{id}', 'TransportadoraController@edit');
        Route::post('/update', 'TransportadoraController@update');
    });

    Route::group(['prefix' => '/nfe'], function(){
        Route::get('/novo/{id}', 'NfeController@novo')->name('nfe.novo');
        Route::get('/renderizar/{id}', 'NfeController@renderizarDanfe')->name('nfe.renderizar');
        Route::get('/gerarXml/{id}', 'NfeController@gerarXml')->name('nfe.gerarXml');
        Route::post('/transmtir', 'NfeController@transmtir')->name('nfe.transmitir');

        Route::get('/ver/{id}', 'NfeController@ver')->name('nfe.ver');
        Route::get('/baixarXml/{id}', 'NfeController@baixarXml')->name('nfe.baixarXml');
        Route::get('/baixarXmlCancelado/{id}', 'NfeController@baixarXmlCancelado')->name('nfe.baixarXmlCancelado');

        Route::get('/imprimir/{id}', 'NfeController@imprimir')->name('nfe.imprimir');
        Route::get('/imprimirCorrecao/{id}', 'NfeController@imprimirCorrecao')->name('nfe.imprimirCorrecao');
        Route::get('/imprimirCancelamento/{id}', 'NfeController@imprimirCancelamento')->name('nfe.imprimirCancelamento');
        Route::post('/cancelar', 'NfeController@cancelar')->name('nfe.cancelar');
        Route::post('/corrigir', 'NfeController@corrigir')->name('nfe.corrigir');
        Route::post('/consultar', 'NfeController@consultar')->name('nfe.consultar');
        Route::get('/filtro', 'NfeController@filtro')->name('nfe.filtro');

        Route::get('/baixarZipXmlAprovado/{local_id}', 'NfeController@baixarZipXmlAprovado')->name('nfe.baixarZipXmlAprovado');
        Route::get('/baixarZipXmlReprovado/{local_id}', 'NfeController@baixarZipXmlReprovado')->name('nfe.baixarZipXmlReprovado');
        Route::get('/consultaCadastro', 'NfeController@consultaCadastro')->name('nfe.consultaCadastro');

        Route::get('/findCidade', 'NfeController@findCidade')->name('nfe.findCidade');
        Route::get('/enviarEmail/{id}', 'NfeController@enviarEmail')->name('nfe.enviarEmail');
    });

    Route::group(['prefix' => '/nfelista'], function(){
        Route::get('/', 'NfeController@lista');
    });

    Route::group(['prefix' => '/nfcelista'], function(){
        Route::get('/', 'NfceController@lista');
    });

    Route::group(['prefix' => '/nfce'], function(){
        Route::post('/transmitir', 'NfceController@transmtir')->name('nfce.transmitir');
        Route::get('/gerar/{id}', 'NfceController@gerar')->name('nfce.gerar');
        Route::get('/gerarXml/{id}', 'NfceController@gerarXml')->name('nfce.gerarXml');
        Route::get('/renderizar/{id}', 'NfceController@renderizarDanfce')->name('nfce.renderizar');
        Route::get('/imprimir/{id}', 'NfceController@imprimir')->name('nfce.imprimir');
        Route::get('/imprimirNaoFiscal/{id}', 'NfceController@imprimirNaoFiscal')->name('nfce.traimprimirNaoFiscalnsmitir');
        
        Route::get('/ver/{id}', 'NfceController@ver')->name('nfce.ver');
        Route::get('/baixarXml/{id}', 'NfceController@baixarXml')->name('nfce.baixarXml');
        Route::get('/baixarXmlCancelado/{id}', 'NfceController@baixarXmlCancelado')->name('nfce.baixarXmlCancelado');
        Route::post('/cancelar', 'NfceController@cancelar')->name('nfce.cancelar');

        Route::get('/filtro', 'NfceController@filtro')->name('nfce.filtro');
        Route::post('/consultar', 'NfceController@consultar')->name('nfce.consultar');

        Route::get('/baixarZipXmlAprovado/{local_id}', 'NfceController@baixarZipXmlAprovado')->name('nfce.baixarZipXmlAprovado');
        Route::get('/baixarZipXmlReprovado/{local_id}', 'NfceController@baixarZipXmlReprovado')->name('nfce.baixarZipXmlReprovado');

    });

    Route::group(['prefix' => '/purchase-xml'], function(){
        Route::get('/', 'PurchaseXmlController@index');
        Route::post('/', 'PurchaseXmlController@verXml');
        Route::post('/save', 'PurchaseXmlController@save');
        Route::get('/baixarXml/{id}', 'PurchaseXmlController@baixarXml');
        Route::get('/baixarXmlEntrada/{id}', 'PurchaseXmlController@baixarXmlEntrada');
    });

    Route::group(['prefix' => '/nfeEntrada'], function(){
        Route::get('/novo/{id}', 'NfeEntradaController@novo');
        Route::get('/gerarXml', 'NfeEntradaController@gerarXml');
        Route::get('/renderizarDanfe', 'NfeEntradaController@renderizarDanfe');
        Route::post('/transmitir', 'NfeEntradaController@transmitir')->name('nfe-entrada.transmitir');
        Route::get('/imprimir/{id}', 'NfeEntradaController@imprimir');
        Route::get('/ver/{id}', 'NfeEntradaController@ver');
        Route::get('/baixarXml/{id}', 'NfeEntradaController@baixarXml');
        Route::post('/cancelar', 'NfeEntradaController@cancelar');
        Route::get('/imprimirCancelamento/{id}', 'NfeEntradaController@imprimirCancelamento');

    });

    Route::group(['prefix' => '/devolucao'], function(){
        Route::get('/', 'DevolucaoController@index')->name('devolucao.index');
        Route::post('/', 'DevolucaoController@verXml')->name('devolucao.ver-xml');
        Route::get('/lista', 'DevolucaoController@lista')->name('devolucao.lista');
        Route::post('/store', 'DevolucaoController@save')->name('devolucao.store');
        Route::put('{id}/update', 'DevolucaoController@update')->name('devolucao.update');
        Route::get('/baixarXml/{id}', 'DevolucaoController@baixarXml')->name('devolucao.baixar-xml');
        Route::get('/baixarXmlCancelamento/{id}', 'DevolucaoController@baixarXmlCancelamento')->name('devolucao.xml-cancelado');
        Route::get('/filtro', 'DevolucaoController@filtro')->name('devolucao.filtro');
        Route::get('/ver/{id}', 'DevolucaoController@ver')->name('devolucao.ver');
        Route::get('/edit/{id}', 'DevolucaoController@edit')->name('devolucao.edit');
        Route::get('/renderizar/{id}', 'DevolucaoController@renderizarDanfe')->name('devolucao.renderizar');
        Route::get('/gerarXml/{id}', 'DevolucaoController@gerarXml')->name('devolucao.gerar-xml');
        Route::get('/imprimir/{id}', 'DevolucaoController@imprimir')->name('devolucao.imprimir');
        Route::get('/imprimirCancelamento/{id}', 'DevolucaoController@imprimirCancelamento')
        ->name('devolucao.imprimir-cancelamento');
        Route::get('/imprimirCorrecao/{id}', 'DevolucaoController@imprimirCorrecao')->name('devolucao.imprimir-correcao');
        
        Route::delete('{id}/destroy', 'DevolucaoController@delete')->name('devolucao.destroy');
        Route::post('/transmitir', 'DevolucaoController@transmitir')->name('devolucao.transmitir');
        Route::post('/cancelar', 'DevolucaoController@cancelar')->name('devolucao.cancelar');

        Route::post('/corrigir', 'DevolucaoController@corrigir')->name('devolucao.corrigir');
        Route::get('/editFiscal/{id}', 'DevolucaoController@editFiscal')->name('devolucao.edit-fiscal');
        Route::put('/updateFiscal/{id}', 'DevolucaoController@updateFiscal')->name('devolucao.update-fiscal');

    });

    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/home/get-totals', 'HomeController@getTotals');
    Route::get('/home/product-stock-alert', 'HomeController@getProductStockAlert');
    Route::get('/home/purchase-payment-dues', 'HomeController@getPurchasePaymentDues');
    Route::get('/home/sales-payment-dues', 'HomeController@getSalesPaymentDues');
    Route::post('/attach-medias-to-model', 'HomeController@attachMediasToGivenModel')->name('attach.medias.to.model');
    Route::get('/calendar', 'HomeController@getCalendar')->name('calendar');
    
    Route::post('/test-email', 'BusinessController@testEmailConfiguration');
    Route::post('/test-sms', 'BusinessController@testSmsConfiguration');
    Route::get('/business/settings', 'BusinessController@getBusinessSettings')->name('business.getBusinessSettings');
    Route::get('/business/downloadCertificado', 'BusinessController@downloadCertificado')->name('business.download-certificado');
    Route::post('/business/update', 'BusinessController@postBusinessSettings')->name('business.postBusinessSettings');

    Route::get('/cache-clear', 'BusinessController@cacheClear');
    
    Route::get('/user/profile', 'UserController@getProfile')->name('user.getProfile');
    Route::post('/user/update', 'UserController@updateProfile')->name('user.updateProfile');
    Route::post('/user/update-password', 'UserController@updatePassword')->name('user.updatePassword');

    Route::resource('brands', 'BrandController');
    Route::resource('bank', 'BankController');
    
    Route::resource('payment-account', 'PaymentAccountController');

    Route::resource('tax-rates', 'TaxRateController');

    Route::resource('units', 'UnitController');

    Route::get('/contacts/map', 'ContactController@contactMap');
    Route::get('/contacts/update-status/{id}', 'ContactController@updateStatus');
    Route::get('/contacts/stock-report/{supplier_id}', 'ContactController@getSupplierStockReport');
    Route::get('/contacts/ledger', 'ContactController@getLedger');
    Route::post('/contacts/send-ledger', 'ContactController@sendLedger');
    Route::get('/contacts/import', 'ContactController@getImportContacts')->name('contacts.import');
    Route::post('/contacts/import', 'ContactController@postImportContacts');
    Route::post('/contacts/check-contact-id', 'ContactController@checkContactId');
    Route::get('/contacts/customers', 'ContactController@getCustomers');
    Route::get('/contacts/validaCnpjCadastrado', 'ContactController@validaCnpjCadastrado')->name('contacts.valida-cnpj');

    Route::resource('contacts', 'ContactController');

    Route::get('taxonomies-ajax-index-page', 'TaxonomyController@getTaxonomyIndexPage');
    Route::resource('taxonomies', 'TaxonomyController');

    Route::resource('variation-templates', 'VariationTemplateController');

    Route::get('/products/stock-history/{id}', 'ProductController@productStockHistory');
    Route::get('/delete-media/{media_id}', 'ProductController@deleteMedia');
    Route::post('/products/mass-deactivate', 'ProductController@massDeactivate');
    Route::get('/products/activate/{id}', 'ProductController@activate');
    Route::get('/products/galery/{id}', 'ProductController@galery');

    Route::post('/products/galerySave', 'ProductController@galerySave');
    Route::get('/products/galeryDelete/{id}', 'ProductController@galeryDelete');

    Route::get('/products/view-product-group-price/{id}', 'ProductController@viewGroupPrice');
    Route::get('/products/add-selling-prices/{id}', 'ProductController@addSellingPrices');
    Route::post('/products/save-selling-prices', 'ProductController@saveSellingPrices');
    Route::post('/products/mass-delete', 'ProductController@massDestroy');
    Route::get('/products/view/{id}', 'ProductController@view');
    Route::get('/products/list', 'ProductController@getProducts');
    Route::get('/products/list-no-variation', 'ProductController@getProductsWithoutVariations');
    Route::post('/products/bulk-edit', 'ProductController@bulkEdit');
    Route::post('/products/bulk-update', 'ProductController@bulkUpdate');
    Route::post('/products/bulk-update-location', 'ProductController@updateProductLocation');
    Route::get('/products/get-product-to-edit/{product_id}', 'ProductController@getProductToEdit');
    
    Route::post('/products/get_sub_categories', 'ProductController@getSubCategories');
    Route::get('/products/get_sub_units', 'ProductController@getSubUnits');
    Route::post('/products/product_form_part', 'ProductController@getProductVariationFormPart');
    Route::post('/products/get_product_variation_row', 'ProductController@getProductVariationRow');
    Route::post('/products/get_variation_template', 'ProductController@getVariationTemplate');
    Route::get('/products/get_variation_value_row', 'ProductController@getVariationValueRow');
    Route::post('/products/check_product_sku', 'ProductController@checkProductSku');
    Route::get('/products/quick_add', 'ProductController@quickAdd');
    Route::post('/products/save_quick_product', 'ProductController@saveQuickProduct');
    Route::get('/products/get-combo-product-entry-row', 'ProductController@getComboProductEntryRow');
    
    Route::resource('products', 'ProductController');


    Route::post('/purchases/update-status', 'PurchaseController@updateStatus');
    Route::get('/purchases/get_products', 'PurchaseController@getProducts');
    Route::get('/purchases/get_suppliers', 'PurchaseController@getSuppliers');
    Route::post('/purchases/get_purchase_entry_row', 'PurchaseController@getPurchaseEntryRow');
    Route::post('/purchases/check_ref_number', 'PurchaseController@checkRefNumber');
    Route::resource('purchases', 'PurchaseController')->except(['show']);

    Route::get('/toggle-subscription/{id}', 'SellPosController@toggleRecurringInvoices');
    Route::post('/sells/pos/get-types-of-service-details', 'SellPosController@getTypesOfServiceDetails');
    Route::get('/sells/subscriptions', 'SellPosController@listSubscriptions');
    Route::get('/sells/duplicate/{id}', 'SellController@duplicateSell');
    Route::get('/sells/drafts', 'SellController@getDrafts');
    Route::get('/sells/quotations', 'SellController@getQuotations');
    Route::get('/sells/draft-dt', 'SellController@getDraftDatables');
    Route::get('/sells/{id}/editFiscal', 'SellController@editFiscal');
    Route::put('/sells/{id}/updateFiscal', 'SellController@updateFiscal')->name('sells.update-fiscal');
    Route::resource('sells', 'SellController')->except(['show']);

    Route::get('/import-sales', 'ImportSalesController@index');
    Route::post('/import-sales/preview', 'ImportSalesController@preview');
    Route::post('/import-sales', 'ImportSalesController@import');
    Route::get('/revert-sale-import/{batch}', 'ImportSalesController@revertSaleImport');

    Route::get('/sells/pos/get_product_row/{variation_id}/{location_id}', 'SellPosController@getProductRow');
    Route::post('/sells/pos/get_payment_row', 'SellPosController@getPaymentRow');
    Route::post('/sells/pos/get-reward-details', 'SellPosController@getRewardDetails');
    Route::get('/sells/pos/get-recent-transactions', 'SellPosController@getRecentTransactions');
    Route::get('/sells/pos/get-product-suggestion', 'SellPosController@getProductSuggestion');
    Route::resource('pos', 'SellPosController');

    Route::resource('roles', 'RoleController');

    Route::resource('users', 'ManageUserController');
    Route::get('/users/delete/{id}', 'ManageUserController@delete');


    Route::resource('group-taxes', 'GroupTaxController');

    Route::get('/barcodes/set_default/{id}', 'BarcodeController@setDefault');
    Route::resource('barcodes', 'BarcodeController');

    //Invoice schemes..
    Route::get('/invoice-schemes/set_default/{id}', 'InvoiceSchemeController@setDefault');
    Route::resource('invoice-schemes', 'InvoiceSchemeController');

    //Print Labels
    Route::get('/labels/show', 'LabelsController@show');
    Route::get('/labels/add-product-row', 'LabelsController@addProductRow');
    Route::get('/labels/preview', 'LabelsController@preview');

    //Reports...
    Route::get('/reports/purchase-report', 'ReportController@purchaseReport');
    Route::get('/reports/sale-report', 'ReportController@saleReport');
    Route::get('/reports/service-staff-report', 'ReportController@getServiceStaffReport');
    Route::get('/reports/service-staff-line-orders', 'ReportController@serviceStaffLineOrders');
    Route::get('/reports/table-report', 'ReportController@getTableReport');
    Route::get('/reports/profit-loss', 'ReportController@getProfitLoss');
    Route::get('/reports/get-opening-stock', 'ReportController@getOpeningStock');
    Route::get('/reports/purchase-sell', 'ReportController@getPurchaseSell');
    Route::get('/reports/customer-supplier', 'ReportController@getCustomerSuppliers');
    Route::get('/reports/stock-report', 'ReportController@getStockReport');
    Route::get('/reports/stock-details', 'ReportController@getStockDetails');
    Route::get('/reports/tax-report', 'ReportController@getTaxReport');
    Route::get('/reports/trending-products', 'ReportController@getTrendingProducts');
    Route::get('/reports/expense-report', 'ReportController@getExpenseReport');
    Route::get('/reports/stock-adjustment-report', 'ReportController@getStockAdjustmentReport');
    Route::get('/reports/register-report', 'ReportController@getRegisterReport');
    Route::get('/reports/sales-representative-report', 'ReportController@getSalesRepresentativeReport');
    Route::get('/reports/sales-representative-total-expense', 'ReportController@getSalesRepresentativeTotalExpense');
    Route::get('/reports/sales-representative-total-sell', 'ReportController@getSalesRepresentativeTotalSell');
    Route::get('/reports/sales-representative-total-commission', 'ReportController@getSalesRepresentativeTotalCommission');
    Route::get('/reports/stock-expiry', 'ReportController@getStockExpiryReport');
    Route::get('/reports/stock-expiry-edit-modal/{purchase_line_id}', 'ReportController@getStockExpiryReportEditModal');
    Route::post('/reports/stock-expiry-update', 'ReportController@updateStockExpiryReport')->name('updateStockExpiryReport');
    Route::get('/reports/customer-group', 'ReportController@getCustomerGroup');
    Route::get('/reports/product-purchase-report', 'ReportController@getproductPurchaseReport');
    Route::get('/reports/product-sell-report', 'ReportController@getproductSellReport');
    Route::get('/reports/product-sell-report-with-purchase', 'ReportController@getproductSellReportWithPurchase');
    Route::get('/reports/product-sell-grouped-report', 'ReportController@getproductSellGroupedReport');
    Route::get('/reports/lot-report', 'ReportController@getLotReport');
    Route::get('/reports/purchase-payment-report', 'ReportController@purchasePaymentReport');
    Route::get('/reports/sell-payment-report', 'ReportController@sellPaymentReport');
    Route::get('/reports/product-stock-details', 'ReportController@productStockDetails');
    Route::get('/reports/adjust-product-stock', 'ReportController@adjustProductStock');
    Route::get('/reports/get-profit/{by?}', 'ReportController@getProfit');
    Route::get('/reports/items-report', 'ReportController@itemsReport');
    Route::get('/reports/get-stock-value', 'ReportController@getStockValue');
    
    Route::get('business-location/activate-deactivate/{location_id}', 'BusinessLocationController@activateDeactivateLocation');

    //Business Location Settings...
    Route::prefix('business-location/{location_id}')->name('location.')->group(function () {
        Route::get('settings', 'LocationSettingsController@index')->name('settings');
        Route::get('settingsAjax', 'LocationSettingsController@settingsAjax');
        Route::post('settings', 'LocationSettingsController@updateSettings')->name('settings_update');
        Route::post('updateSettingsCertificado', 'LocationSettingsController@updateSettingsCertificado')->name('settings_update_certificado');
    });

    //Business Locations...
    Route::post('business-location/check-location-id', 'BusinessLocationController@checkLocationId');
    Route::resource('business-location', 'BusinessLocationController');

    //Invoice layouts..
    Route::resource('invoice-layouts', 'InvoiceLayoutController');

    //Expense Categories...
    Route::resource('expense-categories', 'ExpenseCategoryController');

    //Expenses...
    Route::resource('expenses', 'ExpenseController');
    Route::resource('revenues', 'RevenueController');

    Route::get('/revenues/receive/{id}', 'RevenueController@receive')->name('revenue.receive');
    Route::put('/revenues/{id}/receivePut', 'RevenueController@receivePut')->name('revenue.receivePut');


    Route::get('/boletos/create/{id}', 'BoletoController@create');
    Route::get('/boletos/ver/{id}', 'BoletoController@ver');
    Route::get('/boletos/gerarRemessa/{id}', 'BoletoController@gerarRemessa');
    Route::post('/boletos/store', 'BoletoController@store');
    Route::post('/boletos/storeMulti', 'BoletoController@storeMulti');
    Route::get('/boletos/gerarMultiplos/{ids}', 'BoletoController@gerarMultiplos');


    Route::get('/remessasBoleto', 'RemessaController@index');
    Route::get('/remessasBoleto/download/{id}', 'RemessaController@download');
    Route::delete('/remessasBoleto/{id}/destroy', 'RemessaController@destroy')->name('remessa.destroy');
    Route::get('/remessasBoleto/boletosSemRemessa', 'RemessaController@boletosSemRemessa');
    Route::get('/remessasBoleto/gerarRemessas', 'RemessaController@gerarRemessas');
    Route::get('/remessasBoleto/gerarRemessaMulti/{ids}', 'RemessaController@gerarRemessaMulti');

    //Transaction payments...
    // Route::get('/payments/opening-balance/{contact_id}', 'TransactionPaymentController@getOpeningBalancePayments');
    Route::get('/payments/show-child-payments/{payment_id}', 'TransactionPaymentController@showChildPayments');
    Route::get('/payments/view-payment/{payment_id}', 'TransactionPaymentController@viewPayment');
    Route::get('/payments/add_payment/{transaction_id}', 'TransactionPaymentController@addPayment');
    Route::get('/payments/pay-contact-due/{contact_id}', 'TransactionPaymentController@getPayContactDue');
    Route::post('/payments/pay-contact-due', 'TransactionPaymentController@postPayContactDue');
    Route::resource('payments', 'TransactionPaymentController');

    //Printers...
    Route::resource('printers', 'PrinterController');

    Route::get('/stock-adjustments/remove-expired-stock/{purchase_line_id}', 'StockAdjustmentController@removeExpiredStock');
    Route::post('/stock-adjustments/get_product_row', 'StockAdjustmentController@getProductRow');
    Route::resource('stock-adjustments', 'StockAdjustmentController');

    Route::get('/cash-register/register-details', 'CashRegisterController@getRegisterDetails');
    Route::get('/cash-register/close-register', 'CashRegisterController@getCloseRegister');
    Route::post('/cash-register/close-register', 'CashRegisterController@postCloseRegister');
    Route::get('/cash-register/sangria-suprimento', 'CashRegisterController@getSangriaSuprimento');
    Route::post('/cash-register/store-sangria-suprimento', 'CashRegisterController@storeSangriaSuprimento');
    Route::delete('/cash-register/destroy-sangria-suprimento/{id}', 'CashRegisterController@sangriaSuprimentoDestroy');

    Route::get('/cash-register/print80/{id}', 'CashRegisterController@print80');

    Route::resource('cash-register', 'CashRegisterController');

    //Import products
    Route::get('/import-products', 'ImportProductsController@index');
    Route::post('/import-products/store', 'ImportProductsController@store');

    //Sales Commission Agent
    Route::resource('sales-commission-agents', 'SalesCommissionAgentController');

    //Stock Transfer
    Route::get('stock-transfers/print/{id}', 'StockTransferController@printInvoice');
    Route::resource('stock-transfers', 'StockTransferController');
    
    Route::get('/opening-stock/add/{product_id}', 'OpeningStockController@add');
    Route::post('/opening-stock/save', 'OpeningStockController@save');

    //Customer Groups
    Route::resource('customer-group', 'CustomerGroupController');

    //Import opening stock
    Route::get('/import-opening-stock', 'ImportOpeningStockController@index');
    Route::post('/import-opening-stock/store', 'ImportOpeningStockController@store');

    //Sell return
    Route::resource('sell-return', 'SellReturnController');
    Route::get('sell-return/get-product-row', 'SellReturnController@getProductRow');
    Route::get('/sell-return/print/{id}', 'SellReturnController@printInvoice');
    Route::get('/sell-return/add/{id}', 'SellReturnController@add');
    
    //Backup
    Route::get('backup/download/{file_name}', 'BackUpController@download');
    Route::get('backup/delete/{file_name}', 'BackUpController@delete');
    Route::resource('backup', 'BackUpController', ['only' => [
        'index', 'create', 'store'
    ]]);

    Route::get('selling-price-group/activate-deactivate/{id}', 'SellingPriceGroupController@activateDeactivate');
    Route::get('export-selling-price-group', 'SellingPriceGroupController@export');
    Route::post('import-selling-price-group', 'SellingPriceGroupController@import');

    Route::resource('selling-price-group', 'SellingPriceGroupController');

    Route::resource('notification-templates', 'NotificationTemplateController')->only(['index', 'store']);
    Route::get('notification/get-template/{transaction_id}/{template_for}', 'NotificationController@getTemplate');
    Route::post('notification/send', 'NotificationController@send');

    Route::post('/purchase-return/update', 'CombinedPurchaseReturnController@update');
    Route::get('/purchase-return/edit/{id}', 'CombinedPurchaseReturnController@edit');
    Route::post('/purchase-return/save', 'CombinedPurchaseReturnController@save');
    Route::post('/purchase-return/get_product_row', 'CombinedPurchaseReturnController@getProductRow');
    Route::get('/purchase-return/create', 'CombinedPurchaseReturnController@create');
    Route::get('/purchase-return/add/{id}', 'PurchaseReturnController@add');
    Route::resource('/purchase-return', 'PurchaseReturnController', ['except' => ['create']]);

    Route::get('/discount/activate/{id}', 'DiscountController@activate');
    Route::post('/discount/mass-deactivate', 'DiscountController@massDeactivate');
    Route::resource('discount', 'DiscountController');

    Route::group(['prefix' => 'account'], function () {
        Route::resource('/account', 'AccountController');
        Route::get('/fund-transfer/{id}', 'AccountController@getFundTransfer');
        Route::post('/fund-transfer', 'AccountController@postFundTransfer');
        Route::get('/deposit/{id}', 'AccountController@getDeposit');
        Route::post('/deposit', 'AccountController@postDeposit');
        Route::get('/close/{id}', 'AccountController@close');
        Route::get('/activate/{id}', 'AccountController@activate');
        Route::get('/delete-account-transaction/{id}', 'AccountController@destroyAccountTransaction');
        Route::get('/get-account-balance/{id}', 'AccountController@getAccountBalance');
        Route::get('/balance-sheet', 'AccountReportsController@balanceSheet');
        Route::get('/trial-balance', 'AccountReportsController@trialBalance');
        Route::get('/payment-account-report', 'AccountReportsController@paymentAccountReport');
        Route::get('/link-account/{id}', 'AccountReportsController@getLinkAccount');
        Route::post('/link-account', 'AccountReportsController@postLinkAccount');
        Route::get('/cash-flow', 'AccountController@cashFlow');
    });
    
    Route::resource('account-types', 'AccountTypeController');

    //Restaurant module
    Route::group(['prefix' => 'modules'], function () {
        Route::resource('tables', 'Restaurant\TableController');
        Route::resource('modifiers', 'Restaurant\ModifierSetsController');

        //Map modifier to products
        Route::get('/product-modifiers/{id}/edit', 'Restaurant\ProductModifierSetController@edit');
        Route::post('/product-modifiers/{id}/update', 'Restaurant\ProductModifierSetController@update');
        Route::get('/product-modifiers/product-row/{product_id}', 'Restaurant\ProductModifierSetController@product_row');

        Route::get('/add-selected-modifiers', 'Restaurant\ProductModifierSetController@add_selected_modifiers');

        Route::get('/kitchen', 'Restaurant\KitchenController@index');
        Route::get('/kitchen/mark-as-cooked/{id}', 'Restaurant\KitchenController@markAsCooked');
        Route::post('/refresh-orders-list', 'Restaurant\KitchenController@refreshOrdersList');
        Route::post('/refresh-line-orders-list', 'Restaurant\KitchenController@refreshLineOrdersList');

        Route::get('/orders', 'Restaurant\OrderController@index');
        Route::get('/orders/mark-as-served/{id}', 'Restaurant\OrderController@markAsServed');
        Route::get('/data/get-pos-details', 'Restaurant\DataController@getPosDetails');
        Route::get('/orders/mark-line-order-as-served/{id}', 'Restaurant\OrderController@markLineOrderAsServed');
    });

    Route::get('bookings/get-todays-bookings', 'Restaurant\BookingController@getTodaysBookings');
    Route::resource('bookings', 'Restaurant\BookingController');

    Route::resource('types-of-service', 'TypesOfServiceController');
    Route::get('sells/edit-shipping/{id}', 'SellController@editShipping');
    Route::put('sells/update-shipping/{id}', 'SellController@updateShipping');
    Route::get('shipments', 'SellController@shipments');

    Route::post('upload-module', 'Install\ModulesController@uploadModule');
    Route::get('install-module', 'Install\InstallController@index');
    Route::get('instalSuper', 'Install\ModulesController@instalSuper');
    // Route::resource('manage-modules', 'Install\ModulesController')
    // ->only(['index', 'destroy', 'update']);
    Route::resource('warranties', 'WarrantyController');

    Route::resource('dashboard-configurator', 'DashboardConfiguratorController')
    ->only(['edit', 'update']);

    //common controller for document & note
    Route::get('get-document-note-page', 'DocumentAndNoteController@getDocAndNoteIndexPage');
    Route::post('post-document-upload', 'DocumentAndNoteController@postMedia');
    Route::resource('note-documents', 'DocumentAndNoteController');

});


Route::middleware(['EcomApi'])->prefix('api/ecom')->group(function () {
    Route::get('products/{id?}', 'ProductController@getProductsApi');
    Route::get('categories', 'CategoryController@getCategoriesApi');
    Route::get('brands', 'BrandController@getBrandsApi');
    Route::post('customers', 'ContactController@postCustomersApi');
    Route::get('settings', 'BusinessController@getEcomSettings');
    Route::get('variations', 'ProductController@getVariationsApi');
    Route::post('orders', 'SellPosController@placeOrdersApi');
});

//common route
Route::middleware(['auth'])->group(function () {
    Route::get('/logout', 'Auth\LoginController@logout')->name('logout');
});

Route::middleware(['authh', 'auth', 'SetSessionData', 'language', 'timezone'])->group(function () {
    Route::get('/load-more-notifications', 'HomeController@loadMoreNotifications');
    Route::get('/get-total-unread', 'HomeController@getTotalUnreadNotifications');
    Route::get('/purchases/print/{id}', 'PurchaseController@printInvoice');
    Route::get('/purchases/{id}', 'PurchaseController@show');
    Route::get('/sells/{id}', 'SellController@show');
    Route::get('/sells/{transaction_id}/print', 'SellPosController@printInvoice')->name('sell.printInvoice');
    Route::get('/sells/invoice-url/{id}', 'SellPosController@showInvoiceUrl');
});

Route::get('/cidades', 'CidadeController@lista');


Route::get('/source', function () {
    return view('source');
});




