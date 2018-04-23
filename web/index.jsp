<%--
    Document   : index
    Created on : Jun 9, 2010, 3:59:32 PM
    Author     : tgiunipero
--%>

<c:set var='view' value='/index' scope='session' />

<div id="indexLeftColumn">
    <div id="welcomeText">
        <p style="font-size: larger"><fmt:message key='greeting'/></p>

        <p><fmt:message key='introText'/></p>
    </div>
</div>

<div id="indexRightColumn">
    <c:forEach var="category" items="${categories}">
        <div class="categoryBox">
            <a href="<c:url value='category?${category.id}'/>">
                <span class="categoryLabel"></span>
                <span class="categoryLabelText"><fmt:message key='${category.name}'/></span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="<fmt:message key='${category.name}'/>" class="categoryImage">
            </a>
        </div>
    </c:forEach>
</div>