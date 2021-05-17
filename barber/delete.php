<?php

/**
  * Delete a user
  */

require "config.php";
require "common.php";

if (isset($_GET["AppointmentID"])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);

    $id = $_GET["AppointmentID"];

    $sql = "DELETE FROM Appointment WHERE AppointmentID = :AppointmentID";

    $statement = $connection->prepare($sql);
    $statement->bindValue(':AppointmentID', $id);
    $statement->execute();

    $success = "Appointment successfully deleted";
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}

try {
  $connection = new PDO($dsn, $username, $password, $options);

  $sql = "DELETE FROM Appointment WHERE AppointmentID = :id";

  $statement = $connection->prepare($sql);
  $statement->execute();

  $result = $statement->fetchAll();
} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php require "templates/header.php"; ?>

<h2>Delete users</h2>

<?php if ($success) echo $success; ?>

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
    </tr>
  </thead>
    <tbody>
    <?php foreach ($result as $row) : ?>
      <tr>
        <td><?php echo escape($row["Date"]); ?></td>
        <td><?php echo escape($row["AppointmentID"]); ?></td>
        <td><?php echo escape($row["DesiredEmployee"]); ?></td>
        <td><?php echo escape($row["Email"]); ?></td>
        <td><?php echo escape($row["AppointmentService"]); ?></td>
        <td><?php echo escape($row["AppointmentServiceType"]); ?></td>
        <td><?php echo escape($row["PaymentType"]); ?> </td>
        <td><?php echo escape($row["Comments"]); ?> </td>
        <td><a href="delete.php?id=<?php echo escape($row["AppointmentID"]); ?>">Delete</a></td>
      </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<a href="index.php">Back to home</a>

<?php require "templates/footer.php"; ?>