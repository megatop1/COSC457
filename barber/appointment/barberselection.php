<?php
if (isset($_POST['submit'])) {
	require "../config.php";
  
	try {
	  $connection = new PDO($dsn, $username, $password, $options);
  
	  $date = array(
		"Date" => $_POST['Date']
	  );
  
	  $sql = "INSERT INTO
	  Appointment (Date)
	  Values (:Date)";
  
	  $statement = $connection->prepare($sql);
	  $statement->execute($date);
	} catch(PDOException $error) {
	  echo $sql . "<br>" . $error->getMessage();
	}
  
  }
?>

<?php require "templates/header.php"; ?>

<?php if (isset($_POST['submit']) && $statement) { ?>
  > <?php echo $_POST['Date']; ?> successfully added.
<?php } ?>

<h2>Get list of employees available for your appointment who can perform your service</h2>

<form method="post">
  <label for="dayoff">Enter the day of your appointment. Ex: "Friday"</label>
  <input type="text" id="dayoff" name="dayoff">

  <h2>If you need the full list of services offered, please click below</h2>
  <a href="../service/servicelist.php">List of Offered Services</a>

  <input type="submit" name="submit" value="View Results">
</form>

<h3>When you are done entering your information, please click the green "Submit" button, then click "Next"</h3>
	<a href="selectbarber.php">Next</a>

<a href="../index.php">Back to home</a>

<?php require "../templates/footer.php"; ?>