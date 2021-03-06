<?php include "templates/header.php"; ?>
<!--
  <ul>
      <li>
        <a href="create.php"><strong>Create</strong></a> - add a user
      </li>
      <li>
        <a href="read.php"><strong>Read</strong></a> - find a user
      </li>
      <li><a href="update.php"><strong>Update</strong></a> - edit a user</li>
    </ul> -->
  <img src="images/logo.png" alt="Logo Here" style="max-height: 80%; margin-left: 1%; margin-top: 1px">
  <div class="topnav">
  <a class="active" href="CreateAppointment.php">Create Appointment</a>
  <a href="read.php">Scheduled Appointments</a>
  <a href="update.php">Update Appointment</a>
  <a href="delete.php">Delete Appointment</a>
  <a href="service/servicesoverview.php">Services</a>
  <a href="employee/employeeoverview.php">Employees</a>
  <a href="client/clientoverview.php">Clients</a>
</div>


<div class="container">
        <div class="alert_fail"> 
            <h1>Welcome!!!</h1>
            <p>Welcome to the barber shop's appointment manage system. Please click "Create Appoinment" to book a new appointment.
            To see scheduled appointments, click "Scheduled Appointments. If you need to update an appoinment's information, change any appointment details, or delete
            an appointment, please click "Update Appointment". For other inquiries, such as to find what days a certain employee is off, click Employees and choose the
            "Check which employees are off on a certain day of the week" option and input the day of the week. 
            </p>
        </div>
        </div>
<?php include "templates/footer.php"; ?>