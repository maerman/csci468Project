<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/reviw' scope='session' />

<div>
    <h1><fmt:message key="reviewtitle"/></h1>
    <div class="reviewLeftColumn">
        <p>[ <fmt:message key="customerreview"/> ]</p>
    </div>
    <div class="reviewRightColumn">
        <form>
            <textarea id="review" value="review" rows="10" cols="30"><fmt:message key="submitreview"/></textarea>
            <input type="submit">
        </form>
    </div>
</div>