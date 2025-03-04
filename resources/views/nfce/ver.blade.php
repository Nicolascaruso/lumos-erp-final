@extends('layouts.app')

@section('title', 'Manter NFCe')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>Manter NFCe</h1>
</section>

<!-- Main content -->
<section class="content">

  <div class="row">
    <div class="col-md-12">
      @component('components.widget')
      
      <input type="hidden" id="id" value="{{$transaction->id}}" name="">
      <div class="col-md-12">
        <h4>Número NFCe: <strong>{{$transaction->numero_nfce}}</strong></h4>
        <h4>Estado: <strong>{{$transaction->estado}}</strong></h4>
        <h4>Chave: <strong>{{$transaction->chave}}</strong></h4>
      </div>

      <input type="hidden" id="numero_nfce" value="{{$transaction->numero_nfce}}" name="">
      
      <div class="clearfix"></div>


      <div class="col-md-12">
        <a class="btn btn-lg btn-primary" target="_blank" href="/nfce/imprimir/{{$transaction->id}}" id="submit_user_button">Imprimir</a>
        <a class="btn btn-lg btn-info" target="_blank" href="/nfce/baixarXml/{{$transaction->id}}" id="submit_user_button">Baixar XML</a>
        @if($transaction->estado != 'CANCELADO')
        <a class="btn btn-lg btn-danger" id="cancelar">Cancelar NFCe</a>
        @endif

        <a class="btn btn-lg btn-question" style="background: #673ab7; color: #fff" id="consultar">
        Consultar</a>
      </div>
      
      @endcomponent
    </div>

  </div>

  

  <input type="hidden" id="token" value="{{csrf_token()}}" name="">
  <input type="hidden" id="id" value="{{$transaction->id}}" name="">

  <br>
  <div class="row" id="action" style="display: none">
    <div class="col-md-12">
      @component('components.widget')
      <div class="info-box-content">
        <div class="col-md-4 col-md-offset-4">

          <span class="info-box-number total_purchase">
            <strong id="acao"></strong>
            <i class="fas fa-spinner fa-pulse fa-spin fa-fw margin-bottom"></i></span>
          </div>
        </div>
        @endcomponent

      </div>
    </div>

    @stop



    @section('javascript')
    <script type="text/javascript">
      // swal("Good job!", "You clicked the button!", "success");
      var path = window.location.protocol + '//' + window.location.host

      $('#cancelar').click(() => {
        let numero_nfce = $('#numero_nfce').val();
        swal({
          title: 'Cancelamento de NFCe '+numero_nfce+'.',
          text: 'Menimo de 15 caracteres!',
          content: "input",
          button: {
            text: "Cancelar!",
            closeModal: false,
            type: 'error'
          },
          confirmButtonColor: "#DD6B55",
        })
        .then(v => {
          if (!v) swal("Erro!", "Informe um motivo para Cancelamento!", "error");
          else if(v.length < 15){
            swal("Erro!", "Informe no minimo 15 caracteres", "error");
          }
          else{
            let token = $('#token').val();
            let id = $('#id').val();
            $.ajax
            ({
              type: 'POST',
              data: {
                id: id,
                _token: token,
                justificativa: v
              },
              url: path + '/nfce/cancelar',
              dataType: 'json',
              success: function(e){
                console.log(e)

                swal("sucesso", e.retEvento.infEvento.xMotivo, "success")
                .then(() => {
                  location.reload()
                });

              }, error: function(e){
                console.log(e.responseJSON.data.retEvento.infEvento.xMotivo)

                swal("Erro ao cancelar", e.responseJSON.data.retEvento.infEvento.xMotivo, "error");

              }

            })
          }         


        })
        
        .catch(err => {
          if (err) {
            swal("Erro", "Algo não ocorreu bem!", "error");
          } else {
            swal.stopLoading();
            swal.close();
          }
        });
      })

      $('#consultar').click(() => {
        let numero_nfce = $('#numero_nfce').val();
        
        let token = $('#token').val();
        let id = $('#id').val();

        $.ajax
        ({
          type: 'POST',
          data: {
            id: id,
            _token: token
          },
          url: path + '/nfce/consultar',
          dataType: 'json',
          success: function(e){
            console.log(e)

            swal("sucesso", "Resultado: " + e.xMotivo + " - Chave: " + e.protNFe.infProt.chNFe, "success")
            .then(() => {
            });


          }, error: function(e){
            console.log(e)
            try{
              swal("Erro ao consultar", e.responseJSON, "error");
            }catch{
              swal("Erro ao consultar", e.responseText, "error");

            }
          }

        })
      })


    </script>
    @endsection
