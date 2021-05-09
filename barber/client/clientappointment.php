<?php

/**
  * Function to query information based on
  * a parameter: in this case, location.
  *
  */

if (isset($_POST['submit'])) {
  try {
    require "../config.php";
    require "../common.php";

    $connection = new PDO($dsn, $username, $password, $options);

    /* $sql = "SELECT *
    FROM Employee
    WHERE FirstName = :Fname"; */


    $sql = "SELECT *
    FROM Client, Appointment
    WHERE Client.ClientID = AppointmentID AND FirstName = :Fname";
 

    $Fname = $_POST['Fname'];
    $Lname = $_POST['Lname']; 

    $statement = $connection->prepare($sql);
    /* $statement->bindParam(':Fname', $Fname, PDO::PARAM_STR); */
    $statement->bindParam('Fname', $Fname, PDO::PARAM_STR);
    $statement->execute();

    $result = $statement->fetchAll();
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}
?>
<?php require "../templates/header.php"; ?>

<?php
if (isset($_POST['submit'])) {
  if ($result && $statement->rowCount() > 0) { ?>
    <h2>Results</h2>

    <table>
      <thead>
<tr>
  <th>PhoneNumber</th>
  <th>ClientID</th>
  <th>FirstName</th>
  <th>LastName</th>
  <th>Date</th>
  <th>AppointmentID</th>
</tr>
      </thead>
      <tbody>
  <?php foreach ($result as $row) { ?>
      <tr>
<td><?php echo escape($row["PhoneNumber"]); ?></td>
<td><?php echo escape($row["ClientID"]); ?></td>
<td><?php echo escape($row["FirstName"]); ?></td>
<td><?php echo escape($row["LastName"]); ?></td>
<td><?php echo escape($row["Date"]); ?></td>
<td><?php echo escape($row["AppointmentID"]); ?></td>
      </tr>
    <?php } ?>
      </tbody>
  </table>
  <?php } else { ?>
    > No results found for <?php echo escape($_POST['Fname']); ?>.
  <?php }
} ?>

<h2>Find Employee Data by entering their first name and last name</h2>

<form method="post">
  <label for="Fname">First Name</label>
  <input type="text" id="Fname" name="Fname">
  <input type="submit" name="submit" value="View Results">
</form>

<a href="../index.php">Back to home</a>

<?php require "../templates/footer.php"; ?>