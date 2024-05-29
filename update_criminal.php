<?php
/**
 * Created by fbi
 */
require_once 'config.inc.php';

// Get CriminalID Number
$id = $_GET['criminalID'];
if ($id === "" || $id === false || $id === null) {
    header('location: show_criminals.php');
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

// Create connection
$conn = new mysqli($servername, $username, $password, $database, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $status = $_POST['status'];
    if ($status === null || $status === false || trim($status) === "") {
        echo "<div><i>Specify a new status</i></div>";
    } else {
        // Perform update using safe parameterized SQL
        $sql = "UPDATE criminal SET status = ? WHERE criminalID = ?";
        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            echo "Failed to prepare statement: " . $conn->error;
        } else {
            // Bind user input to statement
            $stmt->bind_param('si', $status, $id);
            // Execute statement
            if (!$stmt->execute()) {
                echo "Failed to execute statement: " . $stmt->error;
            } else {
                echo "Criminal status updated successfully.";
            }
            $stmt->close();
        }
    }
}

// Refresh the Data
$sql = "SELECT criminalID, flyerID, DOB, gender, name, bounty, status, authorityID FROM criminal WHERE criminalID = ?";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo "Failed to prepare statement: " . $conn->error;
} else {
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $stmt->bind_result($criminalID, $flyerID, $DOB, $gender, $name, $bounty, $status, $authorityID);
    ?>
    <div>
        <h2>Update Criminal Status</h2>
        <form method="post">
            <input type="hidden" name="id" value="<?= $id ?>">
            <?php
            while ($stmt->fetch()) {
                echo '<a href="show_criminal.php?id='  . $criminalID . '">' . htmlspecialchars($name) . '</a><br>' .
                htmlspecialchars($flyerID) . ', ' . htmlspecialchars($DOB) . ', ' . htmlspecialchars($gender) . ', ' .
                htmlspecialchars($bounty) . ', ' . htmlspecialchars($status) . ', ' . htmlspecialchars($authorityID);
            }
            ?><br><br>
            New Status: <input type="text" name="status">
            <button type="submit">Update</button>
        </form>
    </div>
    <?php
    $stmt->close();
}

$conn->close();
?>
</body>
</html>
