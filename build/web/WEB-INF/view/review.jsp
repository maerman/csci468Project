<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/reviw' scope='session' />

<div>
    <h1>[Page title]</h1>
    <div class="reviewLeftColumn">
        <p>[ customer reviews ]</p>
    </div>
    <div class="reviewRightColumn">
        <form>
            <textarea id="review" value="review" rows="10" cols="30">Submit Review</textarea>
            <input type="submit">
        </form>
    </div>
</div>