<?php include "templates/header.php"; ?>


<?php
if (isset($_POST['submit'])) {
	require "config.php";
  
	try {
	  $connection = new PDO($dsn, $username, $password, $options);
  
	  $new_user = array(
		"firstname" => $_POST['firstname'],
		"lastname"  => $_POST['lastname'],
		"email"     => $_POST['email'],
		"age"       => $_POST['age'],
		"location"  => $_POST['location']
	  );
  
	  $sql = sprintf(
  "INSERT INTO %s (%s) values (%s)",
  "users",
  implode(", ", array_keys($new_user)),
  ":" . implode(", :", array_keys($new_user))
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

<h2>Add a user</h2>
<!-- This is the new users page. It allows users to enter in their information and enter a new user into our database-->
    <form method="post">
    	<label for="firstname">First Name</label><br> <!-- label for "input" aka Each label has attribute name and id -->
    	<input type="text" name="firstname" id="firstname"><br> <!-- An input/label (entity) <firstname> is associated to a label by its id (attribute)-->
        <label for="lastname">Last Name</label><br>
    	<input type="text" name="lastname" id="lastname"><br>
    	<label for="email">Email Address</label><br>
    	<input type="text" name="email" id="email"><br>
    	<label for="age">Age</label><br>
    	<input type="text" name="age" id="age"><br>
    	<label for="location">Location</label> <br>
    	<input type="text" name="location" id="location"><br>
    	<input type="submit" name="submit" value="Submit">
    </form>

    <a href="index.php">Back to home</a>

    <?php include "templates/footer.php"; ?>