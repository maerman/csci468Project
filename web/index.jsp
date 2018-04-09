<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="categories" dataSource="jdbc/affablebean">
    SELECT * FROM category
</sql:query>

<div id="indexRightColumn">
    <c:forEach var="category" items="${categories.rows}">
        <div class="categoryBox">
            <a href="category?${category.id}">
<<<<<<< HEAD
                <span class="categoryLabel"></span>
                <span class="categoryLabelText">${category.name}</span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="${initParam.categoryImagePath}${category.name}.jpg" class="categoryImage">
=======

                <span class="categoryLabelText">${category.name}</span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="${initParam.categoryImagePath}${category.name}.jpg">
>>>>>>> fc2e7ff335b87235e803110e58fcd8d831d79f97
            </a>
        </div>
    </c:forEach>
</div>