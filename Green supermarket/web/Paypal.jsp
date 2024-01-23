<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PayPal Payment</title>
        <!<!-- called the paypal sanbox link, with id and currency -->
        <script src="https://www.paypal.com/sdk/js?client-id=AXf4sLd0S1Qyc-9VUUet6eA5iTlMwLmwBNqEInRDUWH52j1XDrgGPsoex0R-Zp6WAgu8Iu50c3-9LabQ&currency=USD"></script>
    </head>
    <body>
        <div id="paypal-button-container"></div>

        <script>
            paypal.Buttons({
                //in here handle both of bill payments and order payments in paypal
                createOrder: function (data, actions) {
                    // Retrieve the total from localStorage or use a default value
                    // get cart details from local storage
                    let cart = JSON.parse(localStorage.getItem('cart')) || [];
                    let total = cart.reduce((sum, item) => sum + item.productPrice * item.quantity, 0);
                    
                    //if cart is empty, set default value as 10, else convert cart total to usd by dividing 320
                    total = total > 0 ? (total / 320).toFixed(2) : '10.00';

                    return actions.order.create({
                        purchase_units: [{
                                amount: {
                                    //set total value
                                    value: total 
                                }
                            }]
                    });
                },
                //function when success the payment
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        //clear the cart items
                        localStorage.setItem('cart', JSON.stringify([]));
                         window.location.href = 'Success.jsp';
                    });
                },
                //function when cancelled the payment
                onCancel: function (data) {
                   window.location.href = 'Cancel.jsp';
                },
            }).render('#paypal-button-container');
        </script>

    </body>
</html>
