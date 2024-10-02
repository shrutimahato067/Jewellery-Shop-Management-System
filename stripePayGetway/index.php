<?php
include_once("./config.php");
session_start();
$_SESSION['order_no'] = $_GET['orderno'];
$_SESSION['amount'] = $_GET["amount"];

echo "order no. = " . $_GET['orderno'];
echo "amount = " . $_GET['amount'];
?>

<html>

<head>
    <title>Payment with stripe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="css/design.css">
</head>

<body>

    <div class="container">
        <h2 style="text-align: center; color: blue;">Stripe Payment Supports</h2>
        <br>
        <div class="row justify-content-center align-items-center">
            <div class="col-12 col-md-6">

                <div class="panel panel-default credit-card-box">
                    <div class="panel-heading display-table">
                        <div class="row display-tr position-relative">
                            <h3 class="panel-title display-td"> &nbsp;Payment Details</h3>
                            <div class="display-td position-absolute">
                                <img class="img-responsive pull-right" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhCD2Zl_HHUlu7uFU5wijbTgcNZMMmunQXFg&s" alt="logo" width="120" height="40" />
                            </div>
                        </div>
                    </div>

                    <div class="panel-body">

                        <!-- Display errors returned by createToken -->
                        <div class="payment-status" style="color: red;"></div>

                        <!-- Payment form -->
                        <form role="form" action="stripe_payment.php" method="POST" name="cardpayment" id="payment-form">

                            <input type="hidden" name="productId" value="<?php echo $productId; ?>" />

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="couponCode">CARD HOLDER NAME</label>
                                        <input type="text" class="form-control" name="holdername" placeholder="Enter Card Holder Name" autofocus required id="name" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="couponCode">EMAIL</label>
                                        <input type="email" class="form-control" name="email" placeholder="Email" id="email" required />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="cardNumber">CARD NUMBER</label>
                                        <div class="input-group">

                                            <input type="text" class="form-control" name="card_number" placeholder="Valid Card Number" autocomplete="cc-number" id="card_number" maxlength="16" data-stripe="number" required />
                                            <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-xs-4 col-md-4">
                                    <div class="form-group">
                                        <label for="cardExpiry"><span class="visible-xs-inline">MON</span></label>
                                        <select name="card_exp_month" id="card_exp_month" class="form-control" data-stripe="exp_month" required>
                                            <option>MON</option>
                                            <option value="01">01 ( JAN )</option>
                                            <option value="02">02 ( FEB )</option>
                                            <option value="03">03 ( MAR )</option>
                                            <option value="04">04 ( APR )</option>
                                            <option value="05">05 ( MAY )</option>
                                            <option value="06">06 ( JUN )</option>
                                            <option value="07">07 ( JUL )</option>
                                            <option value="08">08 ( AUG )</option>
                                            <option value="09">09 ( SEP )</option>
                                            <option value="10">10 ( OCT )</option>
                                            <option value="11">11 ( NOV )</option>
                                            <option value="12">12 ( DEC )</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-4 col-md-4">
                                    <div class="form-group">
                                        <label for="cardExpiry"><span class="visible-xs-inline">YEAR</span></label>
                                        <select name="card_exp_year" id="card_exp_year" class="form-control" data-stripe="exp_year">
                                            <option>Year</option>
                                            <option value="20">2020</option>
                                            <option value="21">2021</option>
                                            <option value="22">2022</option>
                                            <option value="23">2023</option>
                                            <option value="24">2024</option>
                                            <option value="25">2025</option>
                                            <option value="26">2026</option>
                                            <option value="27">2027</option>
                                            <option value="28">2028</option>
                                            <option value="29">2029</option>
                                            <option value="30">2030</option>
                                            <option value="31">2031</option>
                                            <option value="32">2032</option>
                                            <option value="33">2033</option>
                                            <option value="34">2034</option>
                                            <option value="35">2035</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-md-4 pull-right">
                                    <div class="form-group">
                                        <label for="cardCVC">CV CODE</label>
                                        <input type="password" class="form-control" name="card_cvc" placeholder="CVC" autocomplete="cc-csc" id="card_cvc" required />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <button class="subscribe btn btn-success btn-lg btn-block submit" type="submit" id="payBtn">PAY NOW</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- CREDIT CARD FORM ENDS HERE -->

            </div>



        </div>
    </div>

</body>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<!-- Stripe JavaScript library -->
<script src="https://js.stripe.com/v2/"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    // Set your publishable key
    Stripe.setPublishableKey('pk_test_51PFsG3084C52CQDjPrNU04f1TRyuOEwrjXPbwhmiKsLnfOobB5pJi50BKmNPrZIYmOGsBl2HwUxib8YGstaitOtX00uohZmjvU');

    // Callback to handle the response from stripe
    function stripeResponseHandler(status, response) {
        if (response.error) {
            // Enable the submit button
            $('#payBtn').removeAttr("disabled");
            // Display the errors on the form
            $(".payment-status").html('<p>' + response.error.message + '</p>');
        } else {
            var form$ = $("#payment-form");
            // Get token id
            var token = response.id;
            // Insert the token into the form
            form$.append("<input type='hidden' name='stripeToken' value='" + token + "' />");
            // Submit form to the server
            form$.get(0).submit();
        }
    }

    $(document).ready(function() {
        // On form submit
        $("#payment-form").submit(function() {
            // Disable the submit button to prevent repeated clicks
            $('#payBtn').attr("disabled", "disabled");

            // Create single-use token to charge the user
            Stripe.createToken({
                number: $('#card_number').val(),
                exp_month: $('#card_exp_month').val(),
                exp_year: $('#card_exp_year').val(),
                cvc: $('#card_cvc').val()
            }, stripeResponseHandler);

            // Submit from callback
            return false;
        });
    });
</script>

</html>