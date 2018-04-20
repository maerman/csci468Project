<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/login' scope='session' />

<div>
    <h1><fmt:message key="logintitle"/></h1>
    <div id="signInBox">
        <p>[ sign in ]</p>
        <form>
            <input type="text" size="35" placeholder="Name">
            <p></p>
            <input type="text" size="35" placeholder="Password">
            <p></p>
            <input type="submit" value="Login">
        </form>
    </div>
     <br>
    <div>
        <input class="accountButtons" type="submit" value="Create Account">
        <input class="accountButtons" type="submit" value="Edit">
        <input class="accountButtons" type="submit" value="Log Out">
    </div>
    <br>
    <p>[ <fmt:message key="accountrecover"/> ]</p>
    <input type="submit" value="Recover">
    <br>
    <br>
</div>