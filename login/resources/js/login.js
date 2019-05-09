console.log("%cIt works!", "color: green; font-size: 4em;");

var textFields = document.querySelectorAll(".mdc-text-field");
for (let textField of textFields) {
    mdc.textField.MDCTextField.attachTo(textField);
}

// 密码隐藏与显示的切换逻辑
var visibility = true;
var passwordField = document.querySelector("#password");
var visibilityToggler = document.querySelector("#password-toggle");

passwordField && visibilityToggler && visibilityToggler.addEventListener("click", function(event) {
    if (visibility === true) {
        passwordField.type = "text";
        visibilityToggler.innerHTML = "visibility";
        visibility = !visibility;
    } else {
        passwordField.type = "password";
        visibilityToggler.innerHTML = "visibility_off";
        visibility = !visibility;
    }
});


// 重置密码逻辑
var submitButton = document.querySelector("#submit-button");

submitButton && submitButton.addEventListener("click", function(event) {
    event.preventDefault();
    var data = {
        mail: document.querySelector("#captcha").value,
        captcha: document.querySelector("#captcha").value
    };
    console.log(data);
});
