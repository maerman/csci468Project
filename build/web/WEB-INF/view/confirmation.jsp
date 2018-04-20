<%--
    Document   : confirmation
    Created on : Sep 9, 2009, 12:20:30 AM
    Author     : tgiunipero
--%>

<div id="singleColumn">

    <p id="confirmationText">
        <strong><fmt:message key="successMessage"/></strong>
        <br><br>
        <fmt:message key="confirmationNumberMessage"/>
        <strong>${orderRecord.confirmationNumber}</strong>
        <br>
        <fmt:message key="contactMessage"/>
        <br><br>
        <fmt:message key="thankYouMessage"/>
    </p>

    <div class="summaryColumn" >
        <table id="orderSummaryTable" class="detailsTable">
            <tr class="header">
                <th colspan="3"><fmt:message key="orderSummary"/></th>
            </tr>
            <tr class="tableHeading">
                <td><fmt:message key="product"/></td>
                <td><fmt:message key="quantity"/></td>
                <td><fmt:message key="price"/></td>
            </tr>

            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <fmt:message key="${products[iter.index].name}"/>
                    <td class="quantityColumn">
                        ${orderedProduct.quantity}
                    </td>
                    <td class="confirmationPriceColumn">
                        &#036; ${products[iter.index].price * orderedProduct.quantity}
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="2" id="deliverySurchargeCellLeft"><strong><fmt:message key="surcharge"/>:</strong></td>
                <td id="deliverySurchargeCellRight">&#036; ${initParam.deliverySurcharge}</td>
            </tr>

            <tr class="lightBlue">
                <td colspan="2" id="totalCellLeft"><strong><fmt:message key="total"/>:</strong></td>
                <td id="totalCellRight">&#036; ${orderRecord.amount}</td>
            </tr>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>d
            <tr class="lightBlue">
                <td colspan="3" id="dateProcessedRow"><strong><fmt:message key="dateProcessed"/>:</strong>
                    ${orderRecord.dateCreated}
                </td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr class="header">
                <th colspan="3"><fmt:message key="deliveryAddress"/></th>
            </tr>

            <tr>
                <td colspan="3" class="lightBlue">
                    ${customer.name}
                    <br>
                    ${customer.address}
                    <br>
                    ${customer.city}, ${customer.state} ${customer.zipcode}
                    <br>
                    <hr>
                    <strong><fmt:message key="email"/>:</strong> ${customer.email}
                    <br>
                    <strong><fmt:message key="phone"/>:</strong> ${customer.phone}
                </td>
            </tr>
        </table>

    </div>
</div>