<?php include "templates/header.php"; ?>

<?php
if (isset($_POST['submit'])) {
  try {
    require "config.php";
    require "common.php";

    $connection = new PDO($dsn, $username, $password, $options);

    $sql = "SELECT *
    FROM Employee
    WHERE FirstName = :Fname";

    $Fname= $_POST['Fname'];

    $statement = $connection->prepare($sql);
    $statement->bindParam(':Fname', $Fname, PDO::PARAM_STR);
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

  <th>Position</th>
  <th>DaysOff</th>
  <th>EmployeeID</th>
  <th>FirstName</th>
  <th>LastName</th>
</tr>
      </thead>
      <tbody>
  <?php foreach ($result as $row) { ?>
      <tr>
<td><?php echo escape($row["Position"]); ?></td>
<td><?php echo escape($row["DaysOff"]); ?></td>
<td><?php echo escape($row["EmployeeID"]); ?></td>
<td><?php echo escape($row["FirstName"]); ?></td>
<td><?php echo escape($row["LastName"]); ?></td>
      </tr>
    <?php } ?>
      </tbody>
  </table>
  <?php } else { ?>
    > No results found for <?php echo escape($_POST['Fname']); ?>.
  <?php }
} ?>

<h2>Find Employee By First Name</h2>

<form method="post">
  <label for="Fname">First Name</label>
  <input type="text" id="Fname" name="Fname">
  <input type="submit" name="submit" value="View Results">
</form>

<a href="index.php">Back to home</a>


<?php include "templates/footer.php"; ?>