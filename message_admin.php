<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Car Rental</title>
	<meta charset="utf-8">
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</head>
<body>
<section class="">
	<?php include 'header.php'; ?>
	<section class="caption">
		<h2 class="caption" style="text-align: center">Find Your Dream Cars For Hire</h2>
		<h3 class="properties" style="text-align: center">Range Rovers - Mercedes Benz - Landcruisers</h3>
	</section>
</section>

<section class="listings">
	<div class="wrapper">
		<h2 style="text-decoration:underline">Message Admin Here</h2>
		<ul class="properties_list">
			<form method="post">
				<table>
					<tr>
						<td style="color: #003300; font-weight: bold; font-size: 24px">Enter Your Message Here:</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td>
							<textarea name="message" placeholder="Enter Message Here" class="txt" required></textarea>
						</td>
					</tr>
					<tr>
						<td><input type="submit" name="send" value="Send Message"></td>
					</tr>
				</table>
			</form>

			<?php
			if (isset($_POST['send'])) {
				include 'includes/config.php';

				// Check if client is logged in
				if (!isset($_SESSION['client_id'])) {
					echo "<script>alert('You must be logged in as a client to send a message.'); window.location='account.php';</script>";
					exit();
				}

				$client_id = $_SESSION['client_id'];
				$message = $conn->real_escape_string(trim($_POST['message']));
				$status = 'Unread';

				if ($message == "") {
					echo "<script>alert('Message cannot be empty.');</script>";
				} else {
					$stmt = $conn->prepare("INSERT INTO message (client_id, message, status, time) VALUES (?, ?, ?, NOW())");
					$stmt->bind_param("iss", $client_id, $message, $status);

					if ($stmt->execute()) {
						echo "<script>alert('Message successfully sent.'); window.location='success.php';</script>";
					} else {
						echo "<script>alert('Message not sent. Please try again.'); window.location='message_admin.php';</script>";
					}
					$stmt->close();
				}
			}
			?>
		</ul>
	</div>
</section>

<footer>
	<div class="wrapper footer">
		<ul>
			<li class="links">
				<ul>
					<li>OUR COMPANY</li>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Terms</a></li>
					<li><a href="#">Policy</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</li>

			<li class="links">
				<ul>
					<li>OTHERS</li>
					<li><a href="#">...</a></li>
					<li><a href="#">...</a></li>
					<li><a href="#">...</a></li>
					<li><a href="#">...</a></li>
				</ul>
			</li>

			<li class="links">
				<ul>
					<li>OUR CAR TYPES</li>
					<li><a href="#">Mercedes</a></li>
					<li><a href="#">Range Rover</a></li>
					<li><a href="#">Landcruisers</a></li>
					<li><a href="#">Others.</a></li>
				</ul>
			</li>

			<?php include_once "includes/footer.php"; ?>
		</ul>
	</div>
</footer>
</body>
</html>
