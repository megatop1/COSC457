<?php include "templates/header.php"; ?>

<!-- Navbar -->
<img src="images/logo.png" alt="Logo Here" style="max-height: 80%; margin-left: 1%; margin-top: 1px">
  <div class="topnav">
  <a class="active" href="CreateAppointment.php">Create Appointment</a>
  <a href="read.php">Scheduled Appointments</a>
  <a href="update.php">Update Appointment</a>
  <a href="servicesoverview.php">Services</a>
  <a href="employeeoverview.php">Employees</a>
  <a href="clientoverview.php">Clients</a>
</div>

<!-- Links -->
<ul>
    <li><a href="servicelist.php">List All Services</a></li>
    <li><a href="employeejob.php">Filter employee per job title</a></li>
    <li><a href="employeedayoff.php">Check which employees are off on a certain day of the week</a></li>
</ul>

<?php include "templates/footer.php"; ?>