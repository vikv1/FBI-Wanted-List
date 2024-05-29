<?php
/**
 * Created by fbi
 */
require_once 'config.inc.php';
// Get criminal Number
$id = $_GET['criminalID'];
if ($id === "") {
    header('location: list_criminals.php');
    exit();
}
if ($id === false) {
    header('location: list_criminals.php');
    exit();
}
if ($id === null) {
    header('location: list_criminals.php');
    exit();
}
?>
<html>
<head>
    <title>Sample FBI Wanted List</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Show Criminal</h2>
    <?php

    // Create connection
    $conn = new mysqli($servername, $username, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

	// Prepare SQL using Parameterized Form (Safe from SQL Injections)
    $sql = "SELECT criminalID,flyerID,DOB,gender,name,bounty,status,authorityID FROM criminal WHERE criminalID = ?";
    $stmt = $conn->stmt_init();
    if (!$stmt->prepare($sql)) {
        echo "failed to prepare";
    }
    else {
		
		// Bind Parameters from User Input
         $stmt->bind_param('s',$id);
		// Execute the Statement
        $stmt->execute();
		
		// Process Results Using Cursor
        $stmt->bind_result($criminalID,$flyerID,$DOB,$gender,$name,$bounty,$status,$authorityID);
        echo "<div>";
        while ($stmt->fetch()) {
            echo '<a href="show_criminal.php?id='  . $criminalID . '">' . $name . '</a><br>' .
             $flyerID . ', ' . $DOB . ', ' . $gender . ', ' . $bounty . ', ' . $status . ', ' . $authorityID;
        }
        echo "</div>";
    ?>
        <div>
            <a href="update_criminal.php?id=<?= $criminalID ?>">Update Criminal</a>
        </div>
    <?php
    }

    $conn->close();

    ?>
</>
</body>
</html>
