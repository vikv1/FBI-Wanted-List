<?php
/**
 * Created by fbi
 */
require_once 'config.inc.php';

?>
<!DOCTYPE html>
<html>
<head>
    <title>List of Criminals</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Criminal List</h2>
    <?php
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

	// Prepare SQL Statement
    $sql = "SELECT criminalID, name FROM criminal ORDER BY criminalID";
    $stmt = $conn->stmt_init();
    if (!$stmt->prepare($sql)) {
        echo "Failed to prepare statement: " . $stmt->error;
    }
    else {
        // Execute the Statement
        if (!$stmt->execute()) {
            echo "Failed to execute statement: " . $stmt->error;
        } else {
            // Bind result variables
            if (!$stmt->bind_result($criminalID, $name)) {
                echo "Failed to bind result: " . $stmt->error;
            } else {
                // Loop Through Result
                echo "<ul>";
                while ($stmt->fetch()) {
                    echo '<li><a href="show_criminal.php?criminalID=' . $criminalID . '">' . htmlspecialchars($name) . '</a></li>';
                }
                echo "</ul>";
            }
        }
    }

	// Close Connection
    $stmt->close();
    $conn->close();

    ?>
</div>
</body>
</html>
