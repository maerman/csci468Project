            <div id="centerColumn">
                <h2>checkout</h2>
                <p>[ text ]</p>
                <form action="purchase" method="post">
                    <table id="checkoutTable">
                        <tr>
                            <td><p class="fieldBoxTitle">First Name:</td>
                            <td><input class="fieldBox" type="text" name="fname">
                            </td>
                        </tr>
                        <tr>
                            <td><p class="fieldBoxTitle">Last Name: </td>
                            <td><input class="fieldBox" type="text" name="lname">
                            </td>
                        </tr>
                        <tr>
                            <td><p class="fieldBoxTitle">Credit Card #: </td>
                            <td><input class="fieldBox" type="text" name="creditcard">
                            </td>
                        </tr>
                        <tr>
                            <td><p class="fieldBoxTitle">Address: </td>
                            <td><input class="fieldBox" type="text" name="address">
                            </td>
                        </tr>
                        <tr>
                            <td><p class="fieldBoxTitle">E-mail: </td>
                            <td><input class="fieldBox" type="text" name="email">
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Purchase"></td>
                        </tr>
                    </table>
                </form>
                <div id="infoBox">
                    <div id="infoBoxDiv">
                        [ purchase conditions ]
                    </div>
                    <div id="priceBox">
                        [ purchase calculations:<br>subtotal + delivery charge ]
                    </div>
                </div>
            </div>