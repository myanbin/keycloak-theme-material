console.log('%cIt works!', 'color: green; font-size: 4em;');

const textFields = document.querySelectorAll('.mdc-text-field')
for (let textField of textFields) {
    mdc.textField.MDCTextField.attachTo(textField)
}

let passwordHidden = true;
const passwordInput = document.querySelector('#password');
const passwordToggle = document.querySelector('#toggle');

passwordToggle.addEventListener('click', function (event) {
  if (passwordHidden === true) {
    passwordInput.type ='text';
    passwordToggle.innerHTML = 'visibility'
    passwordHidden = !passwordHidden
  } else {
    passwordInput.type ='password';
    passwordToggle.innerHTML = 'visibility_off'
    passwordHidden = !passwordHidden
  }
  
})