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

    /* $sql = "SELECT *
    FROM Employee
    WHERE FirstName = :Fname"; */



    $sql = "SELECT *
    FROM Employee
    WHERE DaysOff = :Day";
 

    $Day = $_POST['Day'];

    $statement = $connection->prepare($sql);
    /* $statement->bindParam(':Fname', $Fname, PDO::PARAM_STR); */
    $statement->bindParam('Day', $Day, PDO::PARAM_STR);
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
    > No results found for <?php echo escape($_POST['Day']); ?>.
  <?php }
} ?>

<h2>Find Which Employees Are Off On A Specific Day</h2>
<form method="post">
  <label for="Day">Day of Week</label>
  <input type="text" id="Fname" name="Day">
  <input type="submit" name="submit" value="View Results">
</form>

<a href="index.php">Back to home</a>

<?php require "templates/footer.php"; ?>