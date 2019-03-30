console.log('%cIt works!', 'color: green; font-size: 4em;');

const textFields = document.querySelectorAll('.mdc-text-field')
for (let textField of textFields) {
    mdc.textField.MDCTextField.attachTo(textField)
}