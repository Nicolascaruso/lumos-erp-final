<script type="text/javascript">
    $(document).ready( function() {

        function getTaxonomiesIndexPage () {

            var data = {category_type : $('#category_type').val()};
            $.ajax({
                method: "GET",
                dataType: "html",
                url: '/taxonomies-ajax-index-page',
                data: data,
                async: false,
                success: function(result){
                    console.clear()
                    console.log(result)
                    $('.taxonomy_body').html(result);

                    setTimeout(() => {
                        // $('.taxonomy_body table ').find("tbody tr, thead tr")
                        // .children(":first-child")
                        // .hide()

                        $('.taxonomy_body table ').find("tbody tr, thead tr")
                        .children(":nth-child(5)")
                        .hide()

                        $('.taxonomy_body table ').find("tbody tr, thead tr")
                        .children(":nth-child(4)")
                        .hide()
                    }, 400)
                }
            });
        }

        function initializeTaxonomyDataTable() {
            //Category table
            if ($('#category_table').length) {
                var category_type = $('#category_type').val();
                category_table = $('#category_table').DataTable({
                    processing: true,
                    serverSide: true,
                    ajax: '/taxonomies?type=' + category_type,
                    columns: [
                    { data: 'image', name: 'image' },
                    { data: 'name', name: 'name' },
                    @if($cat_code_enabled)
                    { data: 'short_code', name: 'short_code' },
                    @endif
                    { data: 'description', name: 'description' },
                    { data: 'destaque', name: 'destaque' },
                    { data: 'ecommerce', name: 'ecommerce' },
                    { data: 'action', name: 'action', orderable: false, searchable: false},
                    ],
                });
            }
        }

        @if(empty(request()->get('type')))
        getTaxonomiesIndexPage();
        @endif

        initializeTaxonomyDataTable();
    });
    // $(document).on('submit', 'form#category_add_form', function(e) {
    //     e.preventDefault();
    //     $(this)
    //     .find('button[type="submit"]')
    //     .attr('disabled', true);
    //     var data = $(this).serialize();

    //     $.ajax({
    //         method: 'POST',
    //         url: $(this).attr('action'),
    //         dataType: 'json',
    //         data: data,
    //         success: function(result) {
    //             if (result.success === true) {
    //                 $('div.category_modal').modal('hide');
    //                 toastr.success(result.msg);
    //                 category_table.ajax.reload();
    //             } else {
    //                 toastr.error(result.msg);
    //             }
    //         },
    //     });
    // });
    $(document).on('click', 'button.edit_category_button', function() {
        $('div.category_modal').load($(this).data('href'), function() {
            $(this).modal('show');

            // $('form#category_edit_form').submit(function(e) {
            //     e.preventDefault();
            //     $(this)
            //     .find('button[type="submit"]')
            //     .attr('disabled', true);
            //     var data = $(this).serialize();

            //     $.ajax({
            //         method: 'POST',
            //         url: $(this).attr('action'),
            //         dataType: 'json',
            //         data: data,
            //         success: function(result) {
            //             if (result.success === true) {
            //                 $('div.category_modal').modal('hide');
            //                 toastr.success(result.msg);
            //                 category_table.ajax.reload();
            //             } else {
            //                 toastr.error(result.msg);
            //             }
            //         },
            //     });
            // });
        });
    });

    $(document).on('click', 'button.delete_category_button', function() {
        swal({
            title: LANG.sure,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function(result) {
                        if (result.success === true) {
                            toastr.success(result.msg);
                            category_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    function md(img){
        setTimeout(() => {
            var img_fileinput_setting = {
                showUpload: false,
                showPreview: true,
                browseLabel: LANG.file_browse_label,
                removeLabel: LANG.remove,
                initialPreview: '/uploads/img/categorias/'+img,
                initialPreviewAsData: true,
                previewSettings: {
                    image: { width: '150px', height: '150px', 'max-width': '100%', 'max-height': '100%' },
                },
            };
            $('#upload_image').fileinput(img_fileinput_setting);

        }, 1500)
    }

    $('.btn-modal').click(() => {

        setTimeout(() => {
            var img_fileinput_setting = {
                showUpload: false,
                showPreview: true,
                browseLabel: LANG.file_browse_label,
                removeLabel: LANG.remove,
                previewSettings: {
                    image: { width: '150px', height: '150px', 'max-width': '100%', 'max-height': '100%' },
                },
            };
            $('#upload_image').fileinput(img_fileinput_setting);

        }, 1500)
    })

</script>