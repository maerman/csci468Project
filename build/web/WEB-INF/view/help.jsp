<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/help' scope='session' />

<div>
    <h1><fmt:message key="helptitle"/></h1>
    <div class="miscInfoBox">
        <p class="infoText">[ <fmt:message key="information"/> ]</p>
    </div>
</div>