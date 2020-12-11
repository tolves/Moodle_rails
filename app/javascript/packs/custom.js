// ujs could let you dont need to add: protect_from_forgery except: [:find_by_controller]
// which means ujs could provide csrf
// import Rails from "@rails/ujs";

$(document).ready(function () {
    $('select#role_authority_controller_name').change(function () {
        var data = {select_controller: $(this).val()}
        Rails.ajax({
            type: "POST",
            url: '/admin/roles/' + $('#role_id').val() + '/actions',
            data: new URLSearchParams(data).toString(),
            dataType: 'json',
            accept: 'json',
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                $("#action_names").empty();
                for (var i in response) {
                    $('#action_names').append("<input type='checkbox' name=role_authority[action_names][" + response[i] + "] id=role_authority_action_names value=" + response[i] + "> " + response[i] + " </input><br/>");
                    // $("#role_authority_action_names").append(new Option(response[i],response[i]));
                    // $("#role_authority_action_names").append(new Option(response[i], response[i]));
                    // $("#role_authority_action_names").find('[value=' + response[i].join('], [value=') + ']').prop("checked", true);
                }
            }
        })
    });

    // I dont understand why funtion showFrom isn't defined in js.
    // but window.showFrom worked, but it worked
    window.showForm = function (id, width, title) {
        var el = $('#' + id).first();
        if (el.length === 0 || el.is(':visible')) {
            return;
        }
        if (!title) title = el.find('h3.title').text();
        // moves existing modals behind the transparent background
        $(".modal").css('zIndex', 99);
        el.dialog({
            width: width,
            modal: true,
            resizable: false,
            dialogClass: 'modal',
            title: title
        }).on('dialogclose', function () {
            $(".modal").css('zIndex', 101);
        });
        el.find("input[type=text], input[type=submit]").first().focus();
    }

    console.log("custom js file loaded");
});