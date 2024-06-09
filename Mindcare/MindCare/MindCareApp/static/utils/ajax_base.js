$(document).ready(function () {
    $.ajaxSetup({
        beforeSend: function (xhr, settings) {
            if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
                xhr.setRequestHeader("X-CSRFToken", $("[name=csrfmiddlewaretoken]").val());
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus);
        }
    });
});

const GetRequest = (url, successCallback, has_params = false, data = null) => {
    var ajaxOptions = {
        type: 'GET',
        url: url,
        success: successCallback,
    }
    if (has_params) {
        ajaxOptions.data = data
    }

    $.ajax(ajaxOptions);

}

const PostRequest = (url, data, successCallback, has_file = false) => {
    var ajaxOptions = {
        type: 'POST',
        url: url,
        data: data,
        success: successCallback
    };

    if (has_file) {
        ajaxOptions.contentType = false;
        ajaxOptions.processData = false;
    }

    $.ajax(ajaxOptions);
}


