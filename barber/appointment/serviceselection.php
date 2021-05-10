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
  <th>ServiceName</th>
  <th>ServiceID</th>
  <th>ServiceType/th>
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
    > No results found for <?php echo escape($_POST['dayoff']); ?>.
  <?php }
} ?>

<h2>Enter the name of the service and type of service you wish to recieve: For ex: "Wax - eyebrows" to get your eyebrows waxed</h2>
<h4>If you need a list of our services, please click below</h4>
<a href="../service/servicelist.php">List of Services</a>

<form method="post">
  <label for="dayoff">Service Name</label>
  <input type="text" id="dayoff" name="dayoff">
  <label for="dayoff">Service Type</label>
  <input type="text" id="dayoff" name="dayoff">
  <input type="submit" name="submit" value="View Results">
</form>

<h3>When you are done entering your information, please click the green "Submit" button, then click "Next"</h3>
	<a href="appointment/barberselection.php">Next</a>

<a href="../index.php">Back to home</a>

<?php require "../templates/footer.php"; ?>