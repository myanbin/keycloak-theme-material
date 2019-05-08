<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        <#--  ${msg("emailForgotTitle")}  -->
    <#elseif section = "form">
    <div id="login-card" class="login-card mdc-card mdc-elevation--z12">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="login-headline">
                <h1 class="mdc-typography mdc-typography--headline4">忘记密码</h1>
                <h3 class="mdc-typography mdc-typography--subtitle1">输入您的用户名和邮箱，我们会发送一封带有设置新密码步骤的邮件到您的邮箱。</h3>
            </div>
            
            <div class="${properties.kcFormGroupClass!} mdc-text-field mdc-text-field--outlined login-field">
                <input type="text" id="username" name="username" class="${properties.kcInputClass!} mdc-text-field__input" autocomplete="off"/>

                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                      <label for="username" class="${properties.kcLabelClass!} mdc-floating-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} mdc-text-field mdc-text-field--outlined mdc-text-field--with-trailing-icon login-field">
                <i id="captcha-toggle" class="material-icons mdc-text-field__icon" tabindex="0" role="button"><img src="https://raw.githubusercontent.com/lemonce/svg-captcha/eb2e1dd4f8f93e902d41c6256382b3dffa171ece/media/example.png"></i>
                <input type="text" id="captcha" name="captcha" class="${properties.kcInputClass!} mdc-text-field__input" autocomplete="off"/>

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
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} mdc-button mdc-button--raised" type="submit" value="${msg("doSubmit")}"/>
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
