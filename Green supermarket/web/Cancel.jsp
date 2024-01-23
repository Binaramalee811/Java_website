<%@ page import="myPackage.EmailUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    
    String userEmail = (String) session.getAttribute("userEmail");
    String userName = (String) session.getAttribute("userName");
    
    String cartEmpty = request.getParameter("cartEmpty");
        boolean isCartEmpty = "true".equals(cartEmpty);

        // You can use isCartEmpty to show different messages or take different actions
        if(isCartEmpty) {
           
        } else {
            if (userEmail != null && !userEmail.isEmpty()) {
        //System.out.println("Sending email to: " + userEmail); // More debugging
        EmailUtil.sendEmail(userEmail, "Green Supermarket - Order Cancellation",
            "Hi, "+ userName+ "!, Your order has been cancelled.\n\nThank you for shopping with us!");
    } else {
        //System.out.println("No email provided"); // Check for absence of email
    }
        }
%>

<html>
<head>
    <title>Order Success - Green Supermarket</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }

        h2 {
            color: red;
        }

        p {
            font-size: 18px;
            color: red;
        }

        .button {
            background-color: red; /* Green */
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 18px;
            display: inline-block;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h2>Order Cancelled!</h2>
    <p>Your purchase has been unsuccessful, and your order is now cancelled.</p>

    <a href="LoggedIn.jsp" class="button">Go to Home Page</a>

</body>
</html>
