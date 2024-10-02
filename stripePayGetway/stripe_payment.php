
<!-- 
<!DOCTYPE html>
<html>
	<head>
        <title> Stripe Payment Gateway Integration in PHP </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/stripe.css">
		
			<div class="container">
				<h2 style="text-align: center; color: blue;">Stripe Payment Gateway Integration in PHP </h2>
				<h4 style="text-align: center;">This is - Stripe Payment Success URL </h4>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<div class="status">
							<h1 class="<?php echo $ordStatus; ?>"><?php echo $statusMsg; ?></h1>
						
							<h4 class="heading">Payment Information - </h4>
							<br>
							<p><b>Reference ID:</b> <strong><?php echo $id; ?></strong></p>
							<p><b>Transaction ID:</b> <?php echo $transactionID; ?></p>
							<p><b>Paid Amount:</b> <?php echo $paidAmount.' '.$paidCurrency; ?> ($<?php echo $price;?>.00)</p>
							<p><b>Payment Status:</b> <?php echo $payment_status; ?></p>
							<h4 class="heading">Product Information - </h4>
							<br>
							<p><b>Name:</b> <?php echo $itemName; ?></p>
							<p><b>Price:</b> <?php echo $itemPrice.' '.$currency; ?> ($<?php echo $price;?>.00)</p>
						</div>
						<a href="index.php" class="btn-continue">Back to Home</a>
					</div>
				</div>
			</div>
		</html> 
    </head> -->

	<?php 
	session_start();
	include "./config.php";

	$payment_id = $statusMsg = ''; 
	$ordStatus = 'error';
	$id = '';
	if(isset($_SESSION['order_no'])){
		echo "ord ".$_SESSION['order_no'];
	}

	// Check whether stripe token is not empty
	if (!empty($_POST["stripeToken"])) {

		// Get Token, Card and User Info from Form
		$token = $_POST['stripeToken'];
		$name = $_POST['holdername'];
		$email = $_POST['email'];
		$card_no = $_POST['card_number'];
		$card_cvc = $_POST['card_cvc'];
		$card_exp_month = $_POST['card_exp_month'];
		$card_exp_year = $_POST['card_exp_year'];

		// Include STRIPE PHP Library
		require_once('stripe-php/init.php');

		// Set API Key
		$stripe = array(
			"SecretKey" => "sk_test_51PFsG3084C52CQDjAgzViiFnqZKjkeoDOY2v7maaC0s5YeSfeYhGmaF89lWBs4yMROamlfULE3x5IBOc81TrYYCQ00HUuaD8bk",
			"PublishableKey" => "pk_test_51PFsG3084C52CQDjPrNU04f1TRyuOEwrjXPbwhmiKsLnfOobB5pJi50BKmNPrZIYmOGsBl2HwUxib8YGstaitOtX00uohZmjvU"
		);

		\Stripe\Stripe::setApiKey($stripe['SecretKey']);

		try {
			// Add customer to Stripe 
			$customer = \Stripe\Customer::create(array( 
				'email' => $email, 
				'source'  => $token,
				'name' => $name
			));

			// Generate Unique order ID 
			$orderID = strtoupper(str_replace('.', '', uniqid('', true)));

			// Convert price to cents 
			$price = 82.00;
			$itemPrice = ($price * 100);
			$currency = "INR";

			// Charge a credit or a debit card 
			$charge = \Stripe\Charge::create(array( 
				'customer' => $customer->id, 
				'amount'   => $itemPrice, 
				'currency' => $currency, 
				'metadata' => array( 
					'order_id' => $orderID 
				) 
			));

			// Retrieve charge details 
			$chargeJson = $charge->jsonSerialize();

			// Check whether the charge is successful 
			if ($chargeJson['amount_refunded'] == 0 && empty($chargeJson['failure_code']) && $chargeJson['paid'] == 1 && $chargeJson['captured'] == 1) { 
				// Order details 
				$transactionID = $chargeJson['balance_transaction']; 
				$paidAmount = $chargeJson['amount']; 
				$paidCurrency = $chargeJson['currency']; 
				$payment_status = $chargeJson['status'];
				$payment_date = date("Y-m-d H:i:s");
				$dt_tm = date('Y-m-d H:i:s');

				// Update transaction data into the database
				$roderno = $_SESSION['order_no'];

				// Construct SQL query for mysqli_query
				$sql = "UPDATE `orders` SET 
							`txn_id`='$transactionID', 
							`card_number`='$card_no',
							`card_exp_month`='$card_exp_month',
							`card_exp_year`='$card_exp_year',
							`paid_amount`='$paidAmount',
							`paid_amount_currency`='$paidCurrency',
							`payment_status`='$payment_status',
							`created`='$dt_tm',
							`payment_date`='$payment_date' 
						WHERE `OrderNumber`='$roderno'";

				// Execute the query
				if (mysqli_query($con, $sql)) {
					$ordStatus = 'success'; 
					$statusMsg = 'Your Payment has been Successful!';
				} else {
					$statusMsg = "Failed to update order details. Please contact support.";
				}
			} else { 
				$statusMsg = "Transaction has been failed!";
			} 
		} catch (Exception $e) {
			$statusMsg = "Error: " . $e->getMessage();
		}
	} else { 
		$statusMsg = "Error on form submission."; 
	} 
?>
<!DOCTYPE html>
<html>
<head>
    <title>Stripe Payment Gateway Integration in PHP</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/stripe.css">
</head>
<body>
    <div class="container">
        <h2 style="text-align: center; color: blue;">Stripe Payment Gateway Integration in PHP</h2>
        <h4 style="text-align: center;">This is - Stripe Payment Success URL</h4>
        <br>
        <div class="row">
	        <div class="col-lg-12">
				<div class="status">
					<h1 class="<?php echo $ordStatus; ?>"><?php echo $statusMsg; ?></h1>
				
					<h4 class="heading">Payment Information - </h4>
					<br>
					<p><b>Reference ID:</b> <strong><?php echo $id; ?></strong></p>
					<p><b>Transaction ID:</b> <?php echo $transactionID; ?></p>
					<p><b>Paid Amount:</b> <?php echo $paidAmount . ' ' . $paidCurrency; ?> ($<?php echo $price; ?>.00)</p>
					<p><b>Payment Status:</b> <?php echo $payment_status; ?></p>
					<h4 class="heading">Product Information - </h4>
					<br>
					<p><b>Name:</b> <?php echo $itemName; ?></p>
					<p><b>Price:</b> <?php echo $itemPrice . ' ' . $currency; ?> ($<?php echo $price; ?>.00)</p>
				</div>
				<a href="index.php" class="btn-continue">Back to Home</a>
			</div>
		</div>
	</div>
</body>
</html>



