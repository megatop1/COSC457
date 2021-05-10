<?php

/**
  * Function to query information based on
  * a parameter: in this case, location.
  *
  */

if (isset($_POST['submit'])) {
  try {
    require "config.php";
    require "common.php";

    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "SELECT *
    FROM Appointment
    WHERE Date LIKE :Date";

    $Date = $_POST['Date'];

    $statement = $connection->prepare($sql);
    $statement->bindParam(':Date', $Date, PDO::PARAM_STR);
    $statement->execute();

    $result = $statement->fetchAll();
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}
?>
<?php require "templates/header.php"; ?>

<?php
if (isset($_POST['submit'])) {
  if ($result && $statement->rowCount() > 0) { ?>
    <h2>Results</h2>

    <table>
      <thead>
<tr>

  <th>Date</th>
  <th>AppointmentID</th>
  <th>DesiredEmployee</th>
  <th>Email</th>
  <th>AppointmentService</th>
  <th>AppointmentServiceType</th>
  <th>PaymentType</th>
  <th>Comments</th>
  <th></th>
</tr>
      </thead>
      <tbody>
  <?php foreach ($result as $row) { ?>
      <tr>
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
    > No results found for <?php echo escape($_POST['Client']); ?>.
  <?php }
} ?>

<h2>List All Appointments</h2>

<h4>Please enter the the date in the following format: %2021-05-10%. The % are required since we are using the substring function</h4>

<form method="post">
  <label for="Date">Date</label>
  <input type="text" id="Date" name="Date">
  <input type="submit" name="submit" value="View Results">
</form>

<a href="index.php">Back to home</a>

<?php require "templates/footer.php"; ?>