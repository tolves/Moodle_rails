$(document).ready(function () {
    console.log("custom js file loaded")
    $('#role_authority_controller_name').change(function () {
        $.ajax({
            url: "/admin/roles/1/find_by_controller/2",
            method: "post",
            dataType: "json",
            data: {controller: $(this).val()},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
            }
        })
    })
});
