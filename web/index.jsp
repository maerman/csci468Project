<%--
    Document   : index
    Created on : Jun 9, 2010, 3:59:32 PM
    Author     : tgiunipero
--%>


<div id="indexLeftColumn">
    <div id="welcomeText">
        <p style="font-size: larger">Welcome to Ambience Candles, your one-stop shop for quality candles at reasonable prices.</p>

        <p>Allow us to fill your home with our high quality aromas made from all natural ingredients locally sourced by our master artisans.</p>
    </div>
</div>

<div id="indexRightColumn">
    <c:forEach var="category" items="${categories}">
        <div class="categoryBox">
            <a href="<c:url value='category?${category.id}'/>">
                <span class="categoryLabel"></span>
                <span class="categoryLabelText">${category.name}</span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="${category.name}" class="categoryImage">
            </a>
        </div>
    </c:forEach>
</div>