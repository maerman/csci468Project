<%--
    Document   : checkout
    Created on : May 21, 2010, 12:20:23 AM
    Author     : tgiunipero
--%>

<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Spanish. --%>
<c:set var='view' value='/checkout' scope='session' />

<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                address: {
                    required: true
                },
                city: {
                    required: true
                },
                state: {
                    required: true,
                    minlength: 2

                },
                zipcode: {
                    required: true,
                    minlength: 5

                },
                creditcard: {
                    required: true

                }
            }
        });
    });
</script>

<div id="singleColumn">

    <h2><fmt:message key="checkout"/></h2>

    <p><fmt:message key="checkoutText"/></p>

    <c:if test="${!empty orderFailureFlag}">
        <p class="error"><fmt:message key="orderFailureError"/></p>
    </c:if>

    <form id="checkoutForm" action="<c:url value='purchase'/>" method="post">
        <table id="checkoutTable">
          <c:if test="${!empty validationErrorFlag}">
            <tr>
                <td colspan="2" style="text-align:left">
                    <span class="error smallText"><fmt:message key="validationErrorMessage"/>

                      <c:if test="${!empty nameError}">
                        <br><span class="indent"><fmt:message key="nameError"/></span>
                      </c:if>
                      <c:if test="${!empty emailError}">
                        <br><span class="indent"><fmt:message key="emailError"/></span>
                      </c:if>
                      <c:if test="${!empty phoneError}">
                        <br><span class="indent"><fmt:message key="phoneError"/></span>
                      </c:if>
                      <c:if test="${!empty addressError}">
                        <br><span class="indent"><fmt:message key="addressError"/></span>
                      </c:if>
                      <c:if test="${!empty cityError}">
                        <br><span class="indent"><fmt:message key="cityc"/></span>
                      </c:if>
                      <c:if test="${!empty stateError}">
                        <br><span class="indent"><fmt:message key="statec"/></span>
                      </c:if>
                      <c:if test="${!empty zipcodeError}">
                        <br><span class="indent"><fmt:message key="zipc"/></span>
                      </c:if>
                      <c:if test="${!empty ccNumberError}">
                        <br><span class="indent"><fmt:message key="ccNumberError"/></span>
                      </c:if>

                    </span>
                </td>
            </tr>
          </c:if>
            <tr>
                <td><label for="name"><fmt:message key="customerName"/></label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="name"
                           name="name"
                           value="${param.name}">
                </td>
            </tr>
            <tr>
                <td><label for="email"><fmt:message key="email"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>
            <tr>
                <td><label for="phone"><fmt:message key="phone"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="phone"
                           name="phone"
                           value="${param.phone}">
                </td>
            </tr>
            <tr>
                <td><label for="address"><fmt:message key="address"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           name="address"
                           value="${param.address}">
                </td>
            </tr>
            <tr>
                <td><label for="city"><fmt:message key="city"/>:</label></td>
                <td class="inputField" style="text-align:left;">
                    <input type="text"
                           size="15"
                           maxlength="15"
                           style="text-align:left;"
                           id="city"
                           name="city"
                           value="${param.city}">
                </td>
            </tr>
            <tr>
                <td><label for="state"><fmt:message key="state"/>:</label></td>
                <td class="inputField" style="text-align:left;">
                    <input type="text"
                           size="2"
                           style="text-align:left;"
                           maxlength="2"
                           id="state"
                           name="state"
                           value="${param.state}">
                </td>
            </tr>
            <tr>
                <td><label for="zipcode"><fmt:message key="zip"/>:</label></td>
                <td class="inputField" style="text-align:left;">
                    <input type="text"
                           size="5"
                           maxlength="5"
                           style="text-align:left;"
                           id="zipcode"
                           name="zipcode"
                           value="${param.zipcode}">
                </td>
            </tr>
            <tr>
                <td><label for="creditcard"><fmt:message key="creditCard"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="creditcard"
                           name="creditcard"
                           value="${param.creditcard}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<fmt:message key='submit'/>">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li><fmt:message key='standard'/></li>

                <li><fmt:message key="nextDayGuarantee"/></li>
                <li><fmt:message key="deliveryFee1"/>
                <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${initParam.deliverySurcharge}"/>
                <fmt:message key="deliveryFee2"/></li>

        </ul>

        <table id="priceBox">
            <tr>
                <td><fmt:message key="subtotal"/></td>
                <td class="checkoutPriceColumn">
                    &#036; ${cart.subtotal}</td>
            </tr>
            <tr>
                <td><fmt:message key="surcharge"/>:</td>
                <c:if test="${cart.subtotal < 50}">
                <td class="checkoutPriceColumn">
                    &#036; ${initParam.deliverySurcharge}</td>
                </c:if>
                <c:if test="${cart.subtotal >= 50}">
                <td class="checkoutPriceColumn">
                    &#036; 0.00</td>
                </c:if>
            </tr>
            <tr>
                <td class="total"><fmt:message key="total"/>:</td>
                <td class="total checkoutPriceColumn">
                    &#036; ${cart.total}</td>
            </tr>
        </table>
    </div>
</div>