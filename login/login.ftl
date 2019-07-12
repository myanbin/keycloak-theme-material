<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
    <#elseif section = "form">
    <div id="kc-form" class="login-card" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <!-- headline -->
                <div class="login-headline">
					<h1 class="mdc-typography mdc-typography--headline4">
                        <ruby>新华开发<rt>XINHUA.DEV</rt>平台</ruby>
                    </h1>
                    <h2 id="subline" class="mdc-typography mdc-typography--headline6">（技术局代码管理平台）</h2>
                    <h3 id="login-message" class="mdc-typography mdc-typography--subtitle1">您还没有平台帐号？请 <a id="guides-link" href="//help.xinhua.dev/firststep/">查看这里</a> 了解如何开通</h3>
                </div>
                
                <div class="${properties.kcFormGroupClass!} mdc-text-field mdc-text-field--outlined login-field">
                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!} mdc-text-field__input" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!} mdc-text-field__input" name="username" value="${(login.username!'')}"  type="text" autocomplete="off" />
                    </#if>

                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="username" class="${properties.kcLabelClass!} mdc-floating-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!} mdc-text-field mdc-text-field--outlined mdc-text-field--with-trailing-icon login-field">
                    <i tabindex="0" id="password-toggle" class="material-icons mdc-text-field__icon" role="button">visibility_off</i>
                    <input tabindex="2" id="password" class="${properties.kcInputClass!} mdc-text-field__input" name="password" type="password" autocomplete="off" />
                    
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="password" class="${properties.kcLabelClass!} mdc-floating-label">${msg("password")}</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <#if login.rememberMe??>
                                <div class="mdc-checkbox">
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="mdc-checkbox__native-control" checked>
                                    <div class="mdc-checkbox__background">
                                        <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                                            <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                                        </svg>
                                        <div class="mdc-checkbox__mixedmark"></div>
                                    </div>
                                </div>
                                <label for="rememberMe">${msg("rememberMe")}</label>
                                <#else>
                                <div class="mdc-checkbox">
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="mdc-checkbox__native-control">
                                    <div class="mdc-checkbox__background">
                                        <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                                            <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                                        </svg>
                                        <div class="mdc-checkbox__mixedmark"></div>
                                    </div>
                                </div>
                                <label for="rememberMe">${msg("rememberMe")}</label>
                                </#if>
                            </div>
                        </#if>
                        </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!} login-action login-field">
                    <span class="${properties.kcFormOptionsWrapperClass!}"><a class="mdc-button" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} mdc-button mdc-button--raised" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </div>
            </form>
            <script src="${url.resourcesPath}/js/login.js?${.now?long}"></script>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
