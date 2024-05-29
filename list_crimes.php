<?php
/**
 * Created by fbi
 */
require_once 'config.inc.php';

?>
<html>
<head>
    <title>Fake FBI Database</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Recorded Crimes</h2>
    <?php
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

	// Prepare SQL
    $sql = "SELECT crimeNo,description,date,location,status,name,witnessCount,criminalID FROM crimes";
    $stmt = $conn->stmt_init();
    if (!$stmt->prepare($sql)) {
        echo "failed to prepare";
    }
    else {
		
		// Execute Statement
        $stmt->execute();
		
		// Process Results using Cursor
        $stmt->bind_result($crimeNo, $description, $date, $location, $status, $name, $witnessCount, $criminalID);
        while ($stmt->fetch()) {
            // display the crime info
            echo "<p>" . $description . ", " . $crimeNo . ", " . $description . ", " . $date . ", " . $location 
            . ", " . $status . ", " . $name . ", " . $witnessCount . ", " . $criminalID ."</p>";
        }
    }

    $conn->close();

    ?>
</div>
</body>
</html>
