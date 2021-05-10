<?php
if (isset($_POST['submit'])) {
	require "config.php";
  
	try {
	  $connection = new PDO($dsn, $username, $password, $options);
  
	  $client= array(
		"PhoneNumber" => $_POST['PhoneNumber'],
		"ClientID" => $_POST['ClientID'],
		"FirstName" => $_POST['FirstName'],
		"LastName" => $_POST['LastName'],
	  );
  
	  $sql = sprintf(
		"INSERT INTO %s (%s) values (%s)",
		"Client",
		implode(", ", array_keys($client)),
		":" . implode(", :", array_keys($client))
	);
  
	  $statement = $connection->prepare($sql);
	  $statement->execute($client);
	} catch(PDOException $error) {
	  echo $sql . "<br>" . $error->getMessage();
	}
  
  }
?>

<?php require "templates/header.php"; ?>

<?php if (isset($_POST['submit']) && $statement) { ?>
  > <?php echo $_POST['Date']; ?> successfully added.
<?php } ?>


<h3>Create Appointment</h3>
<h4>Please enter the date you wish to have your appointment on in the format of Year-Month-Day Hour:Minute:seconds format. Ex: 2021-04-30 18:25:28.607</h4>
<!-- This is the new users page. It allows users to enter in their information and enter a new user into our database-->
    <form method="post">
    	<label for="PhoneNumber">Phone Number</label><br> <!-- label for "input" aka Each label has attribute name and id -->
    	<input type="text" name="PhoneNumber" id="PhoneNumber"><br> <!-- An input/label (entity) <firstname> is associated to a label by its id (attribute)-->
		<label for="FirstName">First Name</label><br>
		<input type="text" name="FirstName" id="FirstName"><br>
		<label for="LastName">Last Name</label><br>
		<input type="text" name="LastName" id="LastName"><br>
		<input type="submit" name="submit" value="Submit">
    </form>
	<h3>When you are done entering your information, please click the green "Submit" button, then click "Next"</h3>
	
	<!-- Change Later -->
	<a href="appointment/appointmentdetails.php">Next</a>
	
	<a href="index.php">Back to home</a>

    <?php include "templates/footer.php"; ?>