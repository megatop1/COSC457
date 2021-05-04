<?php
if (isset($_POST['submit'])) {
	require "config.php";
  
	try {
	  $connection = new PDO($dsn, $username, $password, $options);
  
	  $client = array(
		"FirstName" => $_POST['FirstName'],
		"LastName"  => $_POST['LastName'],
		"PhoneNumber"       => $_POST['PhoneNumber']
	  );
  
	  $sql = sprintf(
  "INSERT INTO %s (%s) values (%s)",
  "Client",
  implode(", ", array_keys($client)),
  ":" . implode(", :", array_keys($client))
	  );
  
	  $statement = $connection->prepare($sql);
	  $statement->execute($new_user);
	} catch(PDOException $error) {
	  echo $sql . "<br>" . $error->getMessage();
	}
  
  }
?>

<?php require "templates/header.php"; ?>

<?php if (isset($_POST['submit']) && $statement) { ?>
  > <?php echo $_POST['firstname']; ?> successfully added.
<?php } ?>


<h2>Create Appointment</h2>
<!-- This is the new users page. It allows users to enter in their information and enter a new user into our database-->
    <form method="post">
    	<label for="FirstName">First Name</label><br> <!-- label for "input" aka Each label has attribute name and id -->
    	<input type="text" name="firstname" id="FirstName"><br> <!-- An input/label (entity) <firstname> is associated to a label by its id (attribute)-->
        <label for="LastName">Last Name</label><br>
    	<input type="text" name="lastname" id="LastName"><br>
    	<label for="PhoneNumber">Phone Number</label><br>
		<input type="text" name="PhoneNumber" id="PhoneNumber"><br>
		<input type="submit" name="submit" value="Submit">
    </form>

    <a href="index.php">Back to home</a>

    <?php include "templates/footer.php"; ?>