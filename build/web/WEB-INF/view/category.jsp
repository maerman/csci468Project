<%--
    Document   : category
    Created on : May 21, 2010, 12:20:23 AM
    Author     : tgiunipero
--%>

<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/category' scope='session' />

<div id="categoryLeftColumn">

    <c:forEach var="category" items="${categories}">

        <c:choose>
            <c:when test="${category.name == selectedCategory.name}">
                <div class="categoryButton" id="selectedCategory">
                    <span class="categoryText">
                        ${category.name}
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='category?${category.id}'/>" class="categoryButton">
                    <span class="categoryText">
                        ${category.name}
                    </span>
                </a>
            </c:otherwise>
        </c:choose>

    </c:forEach>

</div>

<div id="categoryRightColumn">

    <p id="categoryTitle"><fmt:message key="${selectedCategory.name}" /></p>

    <table id="productTable">

        <c:forEach var="product" items="${categoryProducts}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                <td>
                    <img src="${initParam.productImagePath}${product.name}.jpg"
                         alt="${product.name}" style="height:70%">
                </td>

                <td>
                    ${product.name}
                    <br>
                    <span class="smallText">${product.description}</span>
                </td>

                <td>&#036; ${product.price}</td>

                <td>
                    <form action="<c:url value='addToCart'/>" method="post">
                        <input type="hidden"
                               name="productId"
                               value="${product.id}">
                        <input type="submit"
                               name="submit"
                               value="add to cart">
                    </form>
                </td>
            </tr>

        </c:forEach>

    </table>
</div>