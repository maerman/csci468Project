<%--
    Document   : checkout
    Created on : May 21, 2010, 12:20:23 AM
    Author     : tgiunipero
--%>


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

    <h2>checkout</h2>

    <p>In order to purchase the items in your shopping cart, please provide us with the following information:</p>

    <c:if test="${!empty orderFailureFlag}">
        <p class="error">We were unable to process your order. Please try again!</p>
    </c:if>

    <form id="checkoutForm" action="<c:url value='purchase'/>" method="post">
        <table id="checkoutTable">
          <c:if test="${!empty validationErrorFlag}">
            <tr>
                <td colspan="2" style="text-align:left">
                    <span class="error smallText">Please provide valid entries for the following field(s):

                      <c:if test="${!empty nameError}">
                        <br><span class="indent"><strong>name</strong> (e.g., Bilbo Baggins)</span>
                      </c:if>
                      <c:if test="${!empty emailError}">
                        <br><span class="indent"><strong>email</strong> (e.g., b.baggins@hobbit.com)</span>
                      </c:if>
                      <c:if test="${!empty phoneError}">
                        <br><span class="indent"><strong>phone</strong> (e.g., 7168546654)</span>
                      </c:if>
                      <c:if test="${!empty addressError}">
                        <br><span class="indent"><strong>address</strong> (e.g., 140 Goethe St.)</span>
                      </c:if>
                      <c:if test="${!empty cityError}">
                        <br><span class="indent"><strong>city</strong> (e.g., Buffalo)</span>
                      </c:if>
                      <c:if test="${!empty stateError}">
                        <br><span class="indent"><strong>state</strong> (e.g., NY)</span>
                      </c:if>
                      <c:if test="${!empty zipcodeError}">
                        <br><span class="indent"><strong>zipcode</strong> (e.g., 14215)</span>
                      </c:if>
                      <c:if test="${!empty ccNumberError}">
                        <br><span class="indent"><strong>credit card</strong> (e.g., 1111222233334444)</span>
                      </c:if>

                    </span>
                </td>
            </tr>
          </c:if>
            <tr>
                <td><label for="name">name:</label></td>
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
                <td><label for="email">email:</label></td>
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
                <td><label for="phone">phone:</label></td>
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
                <td><label for="address">address:</label></td>
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
                <td><label for="city">city:</label></td>
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
                <td><label for="state">state:</label></td>
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
                <td><label for="zipcode">zip:</label></td>
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
                <td><label for="creditcard">credit card number:</label></td>
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
                    <input type="submit" value="submit purchase">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li>USPS 3-5 day standard delivery time</li>

                <li>A &#036; ${initParam.deliverySurcharge}
                flat rate shipping fee is applied to all orders under $50</li>

        </ul>

        <table id="priceBox">
            <tr>
                <td>subtotal:</td>
                <td class="checkoutPriceColumn">
                    &#036; ${cart.subtotal}</td>
            </tr>
            <tr>
                <td>shipping:</td>
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
                <td class="total">total:</td>
                <td class="total checkoutPriceColumn">
                    &#036; ${cart.total}</td>
            </tr>
        </table>
    </div>
</div>