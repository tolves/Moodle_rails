import Rails from "@rails/ujs";
$(document).ready(function () {
    console.log("custom js file loaded")
    $('#role_authority_controller_name').change(function () {
        var data = {select_controller: $(this).val()}
        Rails.ajax({
            type: "POST",
            url: '/admin/roles/' + $('#role_id').val() + '/find_by_controller',
            data: new URLSearchParams(data).toString(),
            dataType: 'json',
            accept: 'json',
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                for (var i in response) {
                    var id = response[i];
                    $("#role_authority_action_names").append(new Option(id));
                }
            }
        })
    })
});
