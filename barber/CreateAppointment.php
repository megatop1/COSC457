<?php
if (isset($_POST['submit'])) {
	require "config.php";
  
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


<h3>Create Appointment</h3>
<h4>Please enter the date you wish to have your appointment on in the format of Year-Month-Day Hour:Minute:seconds format. Ex: 2021-04-30 18:25:28.607</h4>
<!-- This is the new users page. It allows users to enter in their information and enter a new user into our database-->
    <form method="post">
    	<label for="Date">Date</label><br> <!-- label for "input" aka Each label has attribute name and id -->
    	<input type="text" name="Date" id="Date"><br> <!-- An input/label (entity) <firstname> is associated to a label by its id (attribute)-->
		<input type="submit" name="submit" value="Submit">
    </form>
	<h3>When you are done entering your information, please click the green "Submit" button, then click "Next"</h3>
	<a href="appointment/barberselection.php">Next</a>
    <a href="index.php">Back to home</a>

    <?php include "templates/footer.php"; ?>