<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="categories" dataSource="jdbc/affablebean">
    SELECT * FROM category
</sql:query>

<div id="indexLeftColumn">
    <c:forEach var="category" items="${categories.rows}">
        <div class="categoryBox">
            <a href="category?${category.id}">

                <span class="categoryLabelText">${category.name}</span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="${initParam.categoryImagePath}${category.name}.jpg">
            </a>
        </div>
    </c:forEach>
</div>
    
 <sql:query var="items" dataSource="jdbc/affablebean">
    SELECT *
    FROM type AS t, color AS c, scent AS s, category AS cat, product AS p
    WHERE ${pageContext.request.queryString} = cat.id AND cat.id = s.fk_scent_family AND 
        s.id = p.scent_id AND c.id = p.color_id AND t.id = p.type_id
</sql:query>   
    
<div id="categoryRightColumn">
<p style="background-color: #f5eabe; padding: 7px;">${selectedCategory.name}</p>
    <table id="productTable">
        <c:forEach var="product" items="${items.rows}">
            <sql:query var="size" dataSource="jdbc/affablebean" maxRows="1">
                SELECT * FROM type WHERE id = ${product.type_id}
            </sql:query>  
            <sql:query var="color" dataSource="jdbc/affablebean" maxRows="1">
                SELECT * FROM color WHERE id = ${product.color_id}
            </sql:query>  
            <sql:query var="scent" dataSource="jdbc/affablebean" maxRows="1">
                SELECT * FROM scent WHERE id = ${product.scent_id}
            </sql:query> 
        
            <tr class="lightBlue">
                <td>
                    <a href="product?${product.id}">
                        <img src="${initParam.productImagePath}${product.name}${product.type_id}.jpg"
                            alt="${initParam.productImagePath}${product.name}${product.type_id}.jpg">
                    </a>
                </td>
                <td>${product.name}</td>
                <td>Price: $${product.price}</td>
                <c:forEach var="size" items="${size.rows}">
                <td>Size: ${size.name}</td>
                </c:forEach>
                <c:forEach var="color" items="${color.rows}">
                <td>Color: ${color.name}</td>
                </c:forEach>
                <c:forEach var="scent" items="${scent.rows}">
                <td>Scent: ${scent.name}</td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</div>