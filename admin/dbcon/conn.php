<?php
$servername = "localhost";
$username = "root"; // Replace with your actual database username
$password = ""; // Replace with your actual database password
$dbname = "dried"; // Replace with your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>