# How to write a Keycloak theme

Coding with following code:

1. Put css, js, img to `resources` directory
2. Change html struction in `login.ftl`
3. Custom configurations in `theme.properties`

> **ATTENTION**
>
> When add or remove files, need restart the app


Change `../base/login/template.ftl` as follow to disable theme cache:

```html
<#if properties.styles?has_content>
    <#list properties.styles?split(' ') as style>
        <link href="${url.resourcesPath}/${style}?${.now?long}" rel="stylesheet" />
    </#list>
</#if>
<#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
        <script src="${url.resourcesPath}/${script}?${.now?long}" type="text/javascript"></script>
    </#list>
</#if>
```
