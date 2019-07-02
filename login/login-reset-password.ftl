<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        <#--  ${msg("emailForgotTitle")}  -->
    <#elseif section = "form">
    <div id="login-card" class="login-card">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="login-headline">
                <h1 class="mdc-typography mdc-typography--headline4">忘记密码</h1>
                <h3 id="login-message" class="mdc-typography mdc-typography--subtitle1">请输入您想要找回帐号的电子邮箱</h3>
            </div>
            
            <div class="${properties.kcFormGroupClass!} mdc-text-field mdc-text-field--outlined login-field">
                <input tabindex="1" type="text" id="mail" name="mail" class="${properties.kcInputClass!} mdc-text-field__input" autocomplete="off"/>

                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                      <label for="username" class="${properties.kcLabelClass!} mdc-floating-label">电子邮箱</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} mdc-text-field mdc-text-field--outlined mdc-text-field--with-trailing-icon login-field">
                <i tabindex="0" id="reload-captcha" class="material-icons mdc-text-field__icon" role="button"><img src="//xinhua.dev/api/captcha"></i>
                <input tabindex="2" type="text" id="captcha" name="captcha" class="${properties.kcInputClass!} mdc-text-field__input" autocomplete="off"/>

                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                      <label for="username" class="${properties.kcLabelClass!} mdc-floating-label">输入验证码</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!} login-action login-field">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input tabindex="3" id="submit-button" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} mdc-button mdc-button--raised" type="submit" value="${msg("doSubmit")}"/>
                </div>

                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a class="mdc-button" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
            </div>
        </form>
        <script src="${url.resourcesPath}/js/login.js?${.now?long}"></script>
    </div>
    <#elseif section = "info" >
        <#--  ${msg("emailInstruction")}  -->
    </#if>
</@layout.registrationLayout>
