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
    FROM Service";
 

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
  <th>ServiceName</th>
  <th>ServiceID</th>
  <th>ServiceType</th>
  <th>Cost</th>
</tr>
      </thead>
      <tbody>
  <?php foreach ($result as $row) { ?>
      <tr>
<td><?php echo escape($row["ServiceName"]); ?></td>
<td><?php echo escape($row["ServiceID"]); ?></td>
<td><?php echo escape($row["ServiceType"]); ?></td>
<td><?php echo escape($row["Cost"]); ?></td>
      </tr>
    <?php } ?>
      </tbody>
  </table>
  <?php } else { ?>
    > No results found for <?php echo escape($_POST['Day']); ?>.
  <?php }
} ?>

<h2>List All Services</h2>

<form method="post">
  <input type="submit" name="submit" value="View Results">
</form>

<a href="../index.php">Back to home</a>

<?php require "../templates/footer.php"; ?>