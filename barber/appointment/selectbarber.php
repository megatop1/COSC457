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
    FROM Employee
    WHERE DaysOff<> :dayoff";

    $dayoff = $_POST['dayoff'];

    $statement = $connection->prepare($sql);
    /* $statement->bindParam(':Fname', $Fname, PDO::PARAM_STR); */
    $statement->bindParam('dayoff', $dayoff, PDO::PARAM_STR);
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
    > No results found for <?php echo escape($_POST['dayoff']); ?>.
  <?php }
} ?>

<h2>Enter the name of your desired employee based on the results from the previous page</h2>

<form method="post">
  <label for="dayoff">Name of desired barber: Ex. Bob</label>
  <input type="text" id="dayoff" name="dayoff">
  <input type="submit" name="submit" value="View Results">
</form>

<h3>When you are done entering your information, please click the green "Submit" button, then click "Next"</h3>
	<a href="serviceselection.php">Next</a>

<a href="../index.php">Back to home</a>

<?php require "../templates/footer.php"; ?>