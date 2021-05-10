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



    $sql = "SELECT * FROM Client, Appointment WHERE AppointmentID = (SELECT MAX(AppointmentID) FROM Appointment) AND ClientID = (SELECT MAX(ClientID) FROM Client)";
 

    $Day = $_POST['Day'];

    $statement = $connection->prepare($sql);
    /* $statement->bindParam(':Fname', $Fname, PDO::PARAM_STR); */
    /* $statement->bindParam('Day', $Day, PDO::PARAM_STR); */
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
  <th>DesiredEmployee</th>
  <th>Email</th>
  <th>AppointmentService</th>
  <th>AppointmentServiceType</th>
  <th>PaymentType</th>
  <th>Comments</th>
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
<td><?php echo escape($row["DesiredEmployee"]); ?></td>
<td><?php echo escape($row["Email"]); ?></td>
<td><?php echo escape($row["AppointmentService"]); ?></td>
<td><?php echo escape($row["AppointmentServiceType"]); ?></td>
<td><?php echo escape($row["PaymentType"]); ?></td>
<td><?php echo escape($row["Comments"]); ?></td>
      </tr>
    <?php } ?>
      </tbody>
  </table>
  <?php } else { ?>
    > No results found for <?php echo escape($_POST['Day']); ?>.
  <?php }
} ?>

<h2>Appointment Details</h2>

<form method="post">
  <input type="submit" name="submit" value="View Results">
</form>

<a href="../index.php">Back to home</a>

<?php require "../templates/footer.php"; ?>