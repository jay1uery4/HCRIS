<?php
// Database connection
$host = "localhost";
$dbname = "ths_healthcare";
$username = "root";  // Use your database username
$password = "";  // Use your database password

$response = ["success" => false, "message" => "", "fullname" => "", "loggedIn" => false];

// Set the content type to JSON for AJAX response
header('Content-Type: application/json');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Get data from POST request
        $username = $_POST['username'];
        $password = $_POST['password'];  // Plain password from the login form
        
        // Prepare SQL query to select user data based on username
        $sql = "SELECT `patient_id`, `fullname`, `username`, `password` FROM `patients` WHERE `username` = :username";
        
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();

        // Check if user exists
        if ($stmt->rowCount() > 0) {
            // Fetch user data
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            // Verify the password using password_hash
            if (password_verify($password, $user['password'])) {
                // Password is correct
                session_start();
                
                // Regenerate session ID to prevent session fixation attacks
                session_regenerate_id(true);
                
                $_SESSION['patient_id'] = $user['patient_id'];
                $_SESSION['fullname'] = $user['fullname'];

                // Return success response
                $response['success'] = true;
                $response['message'] = "Login successful!";
                $response['fullname'] = $user['fullname']; // Include fullname in response
                $response['loggedIn'] = true; // Indicate the user is logged in
            } else {
                // Invalid password
                $response['message'] = "Incorrect password!";
            }
        } else {
            // User not found
            $response['message'] = "Username not found!";
        }
    }
} catch (PDOException $e) {
    $response['message'] = "Error: " . $e->getMessage();
}

// Return the response as JSON
echo json_encode($response);
?>
