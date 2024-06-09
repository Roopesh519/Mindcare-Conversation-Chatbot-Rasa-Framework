const TIME_OUT = 2000;

const sweetAlert = Swal.mixin({
    // customClass: {
    //     confirmButton: 'btn btn-success',
    //     cancelButton: 'btn btn-danger'
    //   },
    //   buttonsStyling: false
    buttonsStyling: true
});

const showSuccess = (message) => {
    sweetAlert.fire({
        title: 'Success',
        text: message,
        icon: 'success',
        confirmButtonText: 'OK'
    });
}

const showError = (message) => {
    sweetAlert.fire({
        title: 'Error',
        text: message,
        icon: 'error',
        confirmButtonText: 'OK'
    });
}

const showConfirmation = (message,callback) => {
    sweetAlert.fire({
        title: 'Confirmation',
        text: message,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            // Execute callback function if user clicks Yes
            callback();
        }
    });
}