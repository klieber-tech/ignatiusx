<?php
// login.php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Hardcoded credentials for demonstration
    $correctUsername = 'admin';
    $correctPassword = 'password123';

    if ($username === $correctUsername && $password === $correctPassword) {
        echo "Login successful!";
        // Redirect to another page or set session variables here
    } else {
        echo "Invalid username or password.";
    }
}
?>
