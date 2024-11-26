<?php

require 'db_conn.php';

// Get data from POST request
$patient_id = $_POST['patient_id'];
$patient_name = $_POST['patient_name'];
$age = $_POST['age'];
$gender = $_POST['gender'];
$birthdate = $_POST['birthdate'];
$address = $_POST['address'];

// Check if the patient_id already exists
$checkIdQuery = "SELECT patient_id FROM adminpatient_record WHERE patient_id = ?";
$stmtCheck = $conn->prepare($checkIdQuery);
$stmtCheck->bind_param("s", $patient_id);
$stmtCheck->execute();
$resultCheck = $stmtCheck->get_result();

if ($resultCheck && $resultCheck->num_rows > 0) {
    // Patient ID already exists
    echo '
    <script type="text/javascript">
        alert("Error: The patient ID is already in use. Please provide a unique ID.");
        window.location = "adminpatientrec.php"; 
    </script>
    ';
    exit();
}

// Insert data into adminpatient_record table if the ID is unique
$sql = "INSERT INTO adminpatient_record (patient_id, patient_name, age, gender, birthdate, address) 
        VALUES (?, ?, ?, ?, ?, ?)";
$stmtInsert = $conn->prepare($sql);
$stmtInsert->bind_param("ssisss", $patient_id, $patient_name, $age, $gender, $birthdate, $address);

if ($stmtInsert->execute()) {
    echo '
        <script type="text/javascript">
            alert("Record saved successfully.");
            window.location = "adminpatientrec.php";
        </script>
    ';
} else {
    echo "Error: Could not save the record. " . $conn->error;
}

// Close the database connection
$conn->close();
?>
