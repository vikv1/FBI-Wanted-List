<?php
/**
 * Created by fbi
 */
require_once 'config.inc.php';

// Get criminalID Number
$id = $_GET['criminalID'];
if (empty($id)) {
    header('location: list_criminals.php');
    exit();
}

// Create connection
$conn = new mysqli($servername, $username, $password, $database, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
<!DOCTYPE html>
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
    // Prepare SQL using Parameterized Form (Safe from SQL Injections)
    $sql = "SELECT criminalID, flyerID, DOB, gender, name, bounty, status, authorityID FROM criminal WHERE criminalID = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        echo "Failed to prepare statement: " . $conn->error;
    } else {
        // Bind Parameters from User Input
        $stmt->bind_param('s', $id);
        // Execute the Statement
        if (!$stmt->execute()) {
            echo "Failed to execute statement: " . $stmt->error;
        } else {
            // Process Results Using Cursor
            $stmt->bind_result($criminalID, $flyerID, $DOB, $gender, $name, $bounty, $status, $authorityID);
            echo "<div>";
            while ($stmt->fetch()) {
                echo '<a href="show_criminal.php?id=' . $criminalID . '">' . htmlspecialchars($name) . '</a>' . ', ' . htmlspecialchars($status) . ', ' .
                    htmlspecialchars($DOB) . ', ' . htmlspecialchars($gender) . ', ' .
                    htmlspecialchars($bounty) . ', ' . htmlspecialchars($flyerID);
                    echo "<div>";
                    echo '<a href="update_criminal.php?criminalID=' . htmlspecialchars($criminalID) . '">Update Criminal</a>';
                    echo "</div>";
            }
            echo "</div>";
        }
        $stmt->close();
    }
    ?>
</div>
<?php
$conn->close();
?>
</body>
</html>
