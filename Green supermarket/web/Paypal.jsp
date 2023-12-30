<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PayPal Sandbox Integration</title>
</head>
<body>

  <h1>PayPal Sandbox Integration</h1>

  <a href="#" id="paypal-link" onclick="submitPayPalForm()">Pay with PayPal</a>

  <script src="https://www.paypal.com/sdk/js?client-id=YOUR_SANDBOX_CLIENT_ID"></script>

  <script>
    function submitPayPalForm() {
      // Replace 'YOUR_SANDBOX_CLIENT_ID' with your actual PayPal Sandbox Client ID
      var clientId = 'YOUR_SANDBOX_CLIENT_ID';

      var form = document.createElement('form');
      form.style.display = 'none';
      form.method = 'post';
      form.action = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
      form.target = '_blank';

      var cmdInput = document.createElement('input');
      cmdInput.type = 'hidden';
      cmdInput.name = 'cmd';
      cmdInput.value = '_xclick';

      var businessInput = document.createElement('input');
      businessInput.type = 'hidden';
      businessInput.name = 'business';
      businessInput.value = clientId;

      var item_nameInput = document.createElement('input');
      item_nameInput.type = 'hidden';
      item_nameInput.name = 'item_name';
      item_nameInput.value = 'Test Product';

      var amountInput = document.createElement('input');
      amountInput.type = 'hidden';
      amountInput.name = 'amount';
      amountInput.value = '10.00'; // Replace with the actual amount

      form.appendChild(cmdInput);
      form.appendChild(businessInput);
      form.appendChild(item_nameInput);
      form.appendChild(amountInput);

      document.body.appendChild(form);

      form.submit();
    }
    
    
  <div class="row">
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="AboutUs.jsp">About us</a></li>
<li><a href="promotions.jsp">Promotions</a></li>
<li><a href="BillPayments.jsp">Bill payments</a></li>
<li><a href="ContactUs.jsp">Contact us</a></li>
</ul>
</div>
  </script>

</body>
</html>
