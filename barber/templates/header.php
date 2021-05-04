<!DOCTYPE html>
<html lang="en"> <!-- Declare document page as using the english language -->
  <head>
    <meta charset="utf-8" /> <!-- declare characterset UTF-8 which is how your typed characters are converted into machine-readable code --> 
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Barbershop</title>

    <link rel="stylesheet" href="style.css" /> 

    <style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}

* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
html {
	height: 100%;
	/*Image only BG fallback*/
	
	/*background = gradient + image pattern combo*/
	/*background: linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));*/
}

.alert_fail {
    color: #721c24;
    /*
    background-color: #f8d7da;
    border-color: #f5c6cb; */
    position: relative;
    padding: .75rem 1.25rem;
    margin-bottom: 1rem;
    border: 1px solid transparent;
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    border-left-color: transparent;
    border-radius: .25rem;
}

.container {
    display: flex;
    justify-content: center;
  }

  table {
  border-collapse: collapse;
  border-spacing: 0;
}

td,
th {
  padding: 5px;
  border-bottom: 1px solid #aaa;
}
</style>
  </head>

  <body>
   <!-- <h1>Barbershop</h1> -->
  </body>
</html>