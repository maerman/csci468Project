<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/create' scope='session' />

<div>
    <h1><fmt:message key="createtitle"/></h1>
    <div class="accountSetting">
        <form>
            <input type="text" size="35" placeholder="Username">
            <p></p>
            <input type="text" size="35" placeholder="Password">
            <p></p>
            <input type="text" size="35" placeholder="First Name">
            <p></p>
            <input type="text" size="35" placeholder="Last Name">
            <p></p>
            <input type="text" size="35" placeholder="Email">
            <p></p>
            <input type="text" size="35" placeholder="Address">
            <p></p>
            <input type="submit" value="Create">
        </form>
    </div>
    <br>
    <br>
</div>