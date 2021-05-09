<?php include "../templates/header.php"; ?>

<!-- Navbar -->
<img src="../images/logo.png" alt="Logo Here" style="max-height: 80%; margin-left: 1%; margin-top: 1px">
  <div class="topnav">
  <a class="active" href="CreateAppointment.php">Create Appointment</a>
  <a href="../read.php">Scheduled Appointments</a>
  <a href="../update.php">Update Appointment</a>
  <a href="../service/serviceoverview.php">Services</a>
  <a href="../employee/employeeoverview.php">Employees</a>
  <a href="../client/clientoverview.php">Clients</a>
</div>

<!-- Links -->
<ul>
    <li><a href="employeename.php">Find Employee Information by Entering First and Last name</a></li>
    <li><a href="employeejob.php">Filter employee per job title</a></li>
    <li><a href="employeedayoff.php">Check which employees are off on a certain day of the week</a></li>
</ul>
<?php include "../templates/footer.php"; ?>