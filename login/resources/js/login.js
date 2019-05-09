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
    var obj = new XMLHttpRequest();
    obj.open("POST", "//xinhua.dev/auth/forgot", true);
    obj.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); // 发送信息至服务器时内容编码类型
    obj.onreadystatechange = function () {
        if (obj.readyState == 4 && (obj.status == 200 || obj.status == 304)) {  // 304未修改
            fn.call(this, obj.responseText);
        }
    };
    obj.send(data);
});
