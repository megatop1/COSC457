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
    FROM Client
    WHERE FirstName = :Client";

    $Client = $_POST['Client'];

    $statement = $connection->prepare($sql);
    $statement->bindParam(':Client', $Client, PDO::PARAM_STR);
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

  <th>Phone Number</th>
  <th>Client ID</th>
  <th>First Name</th>
  <th>Last Name</th>
</tr>
      </thead>
      <tbody>
  <?php foreach ($result as $row) { ?>
      <tr>
<td><?php echo escape($row["PhoneNumber"]); ?></td>
<td><?php echo escape($row["ClientID"]); ?></td>
<td><?php echo escape($row["FirstName"]); ?></td>
<td><?php echo escape($row["LastName"]); ?></td>
      </tr>
    <?php } ?>
      </tbody>
  </table>
  <?php } else { ?>
    > No results found for <?php echo escape($_POST['Client']); ?>.
  <?php }
} ?>

<h2>Find Specific Client By Name</h2>

<form method="post">
  <label for="Client">Client</label>
  <input type="text" id="Client" name="Client">
  <input type="submit" name="submit" value="View Results">
</form>

<a href="index.php">Back to home</a>

<?php require "templates/footer.php"; ?>