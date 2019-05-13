console.log("%cIt works!", "color: green; font-size: 4em;");

/**
 * TODO: 重新部署时注意域名是否正确
 */

let message = document.querySelector("#login-message");

let textFields = document.querySelectorAll(".mdc-text-field");
for (let textField of textFields) {
  mdc.textField.MDCTextField.attachTo(textField);
}

// 密码隐藏与显示的切换逻辑
let visibility = true;
let passwordField = document.querySelector("#password");
let visibilityToggler = document.querySelector("#password-toggle");

passwordField &&
  visibilityToggler &&
  visibilityToggler.addEventListener("click", function(event) {
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
let submitButton = document.querySelector("#submit-button");

submitButton &&
  submitButton.addEventListener("click", function(event) {
    event.preventDefault();
    let data = {
      mail: document.querySelector("#mail").value,
      captcha: document.querySelector("#captcha").value
    };
    console.log(data);

    let url = "//xinhua.dev/auth/forgot";

    // POST
    let xhr;
    if (window.XMLHttpRequest) {
      // Mozilla, Safari...
      xhr = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
      // IE
      try {
        xhr = new ActiveXObject("Msxml2.XMLHTTP");
      } catch (e) {
        try {
          xhr = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {}
      }
    }
    if (xhr) {
      xhr.onreadystatechange = onReadyStateChange;
      xhr.open("POST", url, true);
      xhr.setRequestHeader("Content-Type", "application/json");
      xhr.withCredentials = true;
      xhr.send(JSON.stringify(data));
    }

    function onReadyStateChange() {
      if (xhr.readyState === 4) {
        if (xhr.status >= 200 && xhr.status < 300) {
          console.log(xhr.responseText);
          message.textContent = "您很快会收到一封含有重置密码链接的邮件。";
          message.classList.add("alert-success");
          document.querySelector("#captcha").value = "";
          reload_captcha.childNodes[0].src =
            "//xinhua.dev/api/captcha?" + Math.random();
        } else {
          console.log("There was a problem with the request.");
          message.textContent = "无效的电子邮箱或验证码。";
          message.classList.add("alert-error");
          document.querySelector("#captcha").value = "";
          reload_captcha.childNodes[0].src =
            "//xinhua.dev/api/captcha?" + Math.random();
        }
      } else {
        console.log("still not ready...");
      }
    }
  });

// 点击刷新验证码
let reload_captcha = document.querySelector("#reload-captcha");

reload_captcha &&
  reload_captcha.addEventListener("click", function(event) {
    reload_captcha.childNodes[0].src =
      "//xinhua.dev/api/captcha?" + Math.random();
  });

// 登录页面错误信息提示
let keycloak_message = document.querySelector(".alert");
if (keycloak_message !== null) {
  message.textContent = keycloak_message.textContent;
  message.classList.add(keycloak_message.className.split(" ")[1]);
}
