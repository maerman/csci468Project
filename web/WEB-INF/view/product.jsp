<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

 <sql:query var="items" dataSource="jdbc/affablebean" maxRows="1">
    SELECT *
    FROM type AS t, color AS c, scent AS s, category AS cat, product AS p
    WHERE ${pageContext.request.queryString} = p.id AND cat.id = s.fk_scent_family AND 
        s.id = p.scent_id AND c.id = p.color_id AND t.id = p.type_id
</sql:query>  

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
        
    <h1>${product.name}</h1>
    <form action="<c:url value='addToCart'/>" method="post">
        <input type="hidden"
               name="productId"
               value="${product.id}">
        <input type="submit"
               name="submit"
               value="add to cart">
    </form>
    <div>
    <div class="productLeftColumn">
                    <div style="float: left;">
                        <img src="${initParam.productImagePath}${product.name}${product.type_id}.jpg"
                            alt="${initParam.productImagePath}${product.name}${product.type_id}.jpg">
                    </div>
                    <br>
                    <div class="productDetails">
                        <p style="padding-bottom: 10px">Price: $${product.price}</p>
                        <c:forEach var="size" items="${size.rows}">
                        <p style="padding-bottom: 10px">Size: ${size.name}</p>
                        </c:forEach>
                        <c:forEach var="color" items="${color.rows}">
                        <p style="padding-bottom: 10px">Color: ${color.name}</p>
                        </c:forEach>
                        <c:forEach var="scent" items="${scent.rows}">
                        <p style="padding-bottom: 10px">Scent: ${scent.name}</p>
                        </c:forEach>
                    </div>
            </div>
            <div class="productRightColumn">
                    <h3>Description</h3>
                    <p style="float: left;">${product.description}<p>
            </div>
            <a style="margin-top: 15px" href>
                        <p>[ see reviews ]</p>
            </a>
    </div>
</c:forEach>