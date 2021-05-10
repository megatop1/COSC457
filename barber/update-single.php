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

    $sql = "UPDATE users
            SET id = :id,
              firstname = :firstname,
              lastname = :lastname,
              email = :email,
              age = :age,
              location = :location,
              date = :date
            WHERE id = :id";

  $statement = $connection->prepare($sql);
  $statement->execute($user);
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  }
}

if (isset($_GET['id'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
    $AppointmentID = $_GET['AppointmentID'];
    $sql = "SELECT * FROM Appointment WHERE AppointmentID = :AppointmentID";
    $statement = $connection->prepare($sql);
    $statement->bindValue(':AppointmentID', $AppointmentID);
    $statement->execute();

    $user = $statement->fetch(PDO::FETCH_ASSOC);
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  }
} else {
    echo "Something went wrong!";
    exit;
}
?>

<?php require "templates/header.php"; ?>

<?php if (isset($_POST['submit']) && $statement) : ?>
  <?php echo escape($_POST['firstname']); ?> successfully updated.
<?php endif; ?>

<h2>Edit a user</h2>

<form method="post">
    <?php foreach ($user as $key => $value) : ?>
      <label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>
      <input type="text" name="<?php echo $key; ?>" id="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ($key === 'id' ? 'readonly' : null); ?>>
    <?php endforeach; ?>
    <input type="submit" name="submit" value="Submit">
</form>

<a href="index.php">Back to home</a>

<?php require "templates/footer.php"; ?>