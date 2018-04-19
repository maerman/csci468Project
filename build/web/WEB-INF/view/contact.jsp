<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/contact' scope='session' />

<div>
    <h1>[Page title]</h1>
    <div class="miscInfoBox">
        <p class="infoText">[ information ]</p>
    </div>
</div>