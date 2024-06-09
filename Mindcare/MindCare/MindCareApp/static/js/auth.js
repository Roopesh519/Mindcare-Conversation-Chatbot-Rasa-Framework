let nameField = $('#name');
let contactField = $('#contact');
let emailField = $('#email');
let passwordField = $('#password');
let conf_password = $('#conf_password');
let imageField = $('#image');
let addressField = $('#address');



$(document).ready(function () {
    //registration
    $('#register_form').submit(function (event) {
        event.preventDefault();
        if (validateRegister()) {
            var formData = new FormData(this);
            UserRegistration(formData);
        }
    });

    //login
    $('#login_form').submit(function (event) {
        event.preventDefault();
        if (validateLogin) {
            var formData = new FormData(this);
            UserLogin(formData);
        }
    });
    //forgot password
    $('#forgot_password_form').submit(function (event) {
        event.preventDefault();
        var formData = new FormData(this);
        forgotPassword(formData);
    });

});


const UserRegistration = (formData) => {
    // let formObj = Object.fromEntries(formData);
    PostRequest(registerApiUrl, formData,
        (response) => {
            if (response.status) {
                showSuccess(response.message);
                setTimeout(() => {
                    window.location.href = loginUrl;
                }, 2000);
            } else {
                showError(response.message);
            }
        }, true
    );
}

const UserLogin = (formData) => {
    let formObj = Object.fromEntries(formData);
    PostRequest(loginApiUrl, formObj,
        (response) => {
            if (response.status) {
                showSuccess(response.message);
                let redirect;
                if (response.is_admin) {
                    redirect = adminHomeUrl;
                } else {
                    redirect = homeUrl;
                }
                setTimeout(() => {
                    window.location.href = redirect;
                }, 2000);
            } else {
                showError(response.message);
            }
        },
    );
}

const validateRegister = () => {
    const namePattern = /^[a-zA-Z]+(?:\s+[a-zA-Z]+)*$/;
    const contactPattern = /^\d{10}$/;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (nameField.val() === '') {
        showError('Name Field is required');
        return false;
    }
    if (!namePattern.test(nameField.val())) {
        showError('Please enter valid name');
        return false;
    }
    if (contactField.val() === '') {
        showError('Phone Number is required');
        return false;
    }
    if (!contactPattern.test(contactField.val())) {
        contactError.textContent = 'Please enter a valid 10-digit contact number.';
        return false;
    }
    if (emailField.val() === '') {
        showError('Email ID is required');
        return false;
    }
    if (!emailPattern.test(emailField.val())) {
        emailError.textContent = 'Please enter a valid email address.';
        return false;
    }
  
    if (addressField.val() === '') {
        showError('Address is required');
        return false;
    }
    if (passwordField.val() === '') {
        showError('password is required');
        return false;
    }
    if (conf_password.val() === passwordField.val()) {
        showError('password not matches to the confirm password');
        return false;
    }
    const file = imageField[0].files[0];

    if (!file) {
        showError('Profile picture is required');
        return false;
    }
    return true;
}

const validateLogin = () => {
    return true;
}


const forgotPassword = (formData) => {
    PostRequest(forgotPasswordApiUrl, formData,
        (response) => {
            if (response.status) {
                showSuccess(response.message);
                setTimeout(() => {
                    window.location.href = loginUrl;
                }, 2000);
            } else {
                showError(response.message);
            }
        },
        true
    );
}