<?php
/**
  * Use an HTML form to edit an entry in the
  * users table.
  *
  */
require "config.php";
require "common.php";
if (isset($_POST['submit'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
    $Appointment =[
      "Date"                    => $_POST['Date'],
      "AppointmentID"           => $_POST['AppointmentID'],
      "DesiredEmployee"         => $_POST['DesiredEmployee'],
      "Email"                   => $_POST['Email'],
      "AppointmentService"      => $_POST['AppointmentService'],
      "AppointmentServiceType"  => $_POST['AppointmentServiceType'],
      "PaymentType"             => $_POST['PaymentType'],
      "Comments"                => $_POST['Comments']
    ];

    $sql = "UPDATE Appointment
            SET AppointmentID = :AppointmentID,
              Date = :Date,
              AppointmentID = :AppointmentID,
              DesiredEmployee = :DesiredEmployee,
              Email = :Email,
              AppointmentService = :AppointmentService,
              AppointmentServiceType = :AppointmentServiceType,
              PaymentType = :PaymentType,
              Comments = :Comments
            WHERE AppointmentID = :AppointmentID";

  $statement = $connection->prepare($sql);
  $statement->execute($Appointment);
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  }
}

/* if (isset($_GET['id'])) { /* This line is breaking everything */
 /* try { */
    $connection = new PDO($dsn, $username, $password, $options);
    $AppointmentID = $_GET['AppointmentID'];
    $sql = "SELECT * FROM Appointment";
    $statement = $connection->prepare($sql);
    $statement->bindValue(':AppointmentID', $AppointmentID);
    $statement->execute();

    $Appointment = $statement->fetch(PDO::FETCH_ASSOC);
 /* } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  } 
} else {
    echo "Something went wrong!";
    exit;
}*/
?>

<?php require "templates/header.php"; ?>

<?php if (isset($_POST['submit']) && $statement) : ?>
  <?php echo escape($_POST['firstname']); ?> successfully updated.
<?php endif; ?>

<h2>Edit a user</h2>

<form method="post">
    <?php foreach ($Appointment as $key => $value) : ?>
      <label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>
      <input type="text" name="<?php echo $key; ?>" id="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ($key === 'id' ? 'readonly' : null); ?>>
    <?php endforeach; ?>
    <input type="submit" name="submit" value="Submit">
</form>

<a href="index.php">Back to home</a>

<?php require "templates/footer.php"; ?>