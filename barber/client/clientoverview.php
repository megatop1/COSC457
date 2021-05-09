<?php include "../templates/header.php"; ?>

<!-- Navbar -->
<img src="../images/logo.png" alt="Logo Here" style="max-height: 80%; margin-left: 1%; margin-top: 1px">
  <div class="topnav">
  <a class="active" href="CreateAppointment.php">Create Appointment</a>
  <a href="../read.php">Scheduled Appointments</a>
  <a href="../update.php">Update Appointment</a>
  <a href="../service/servicelist.php">Services</a>
  <a href="../employee/employeeoverview.php">Employees</a>
  <a href="../client/clientoverview.php">Clients</a>
</div>

<!-- Links -->
<ul>
    <li><a href="clientname.php">Find Client by name</a></li>
    <li><a href="clientphone.php">Find Client by phone number</a></li>
    <li><a href="clientappointment.php">Find Client's Appointment</a></li>
</ul>
<?php include "templates/footer.php"; ?>