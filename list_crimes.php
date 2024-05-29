<?php
/**
 * Created by fbi
 */
require_once 'config.inc.php';

// Mapping of state names to their two-letter codes
$state_codes = array(
    'ALABAMA' => 'AL',
    'ALASKA' => 'AK',
    'ARIZONA' => 'AZ',
    'ARKANSAS' => 'AR',
    'CALIFORNIA' => 'CA',
    'COLORADO' => 'CO',
    'CONNECTICUT' => 'CT',
    'DELAWARE' => 'DE',
    'FLORIDA' => 'FL',
    'GEORGIA' => 'GA',
    'HAWAII' => 'HI',
    'IDAHO' => 'ID',
    'ILLINOIS' => 'IL',
    'INDIANA' => 'IN',
    'IOWA' => 'IA',
    'KANSAS' => 'KS',
    'KENTUCKY' => 'KY',
    'LOUISIANA' => 'LA',
    'MAINE' => 'ME',
    'MARYLAND' => 'MD',
    'MASSACHUSETTS' => 'MA',
    'MICHIGAN' => 'MI',
    'MINNESOTA' => 'MN',
    'MISSISSIPPI' => 'MS',
    'MISSOURI' => 'MO',
    'MONTANA' => 'MT',
    'NEBRASKA' => 'NE',
    'NEVADA' => 'NV',
    'NEW HAMPSHIRE' => 'NH',
    'NEW JERSEY' => 'NJ',
    'NEW MEXICO' => 'NM',
    'NEW YORK' => 'NY',
    'NORTH CAROLINA' => 'NC',
    'NORTH DAKOTA' => 'ND',
    'OHIO' => 'OH',
    'OKLAHOMA' => 'OK',
    'OREGON' => 'OR',
    'PENNSYLVANIA' => 'PA',
    'RHODE ISLAND' => 'RI',
    'SOUTH CAROLINA' => 'SC',
    'SOUTH DAKOTA' => 'SD',
    'TENNESSEE' => 'TN',
    'TEXAS' => 'TX',
    'UTAH' => 'UT',
    'VERMONT' => 'VT',
    'VIRGINIA' => 'VA',
    'WASHINGTON' => 'WA',
    'WEST VIRGINIA' => 'WV',
    'WISCONSIN' => 'WI',
    'WYOMING' => 'WY'
);

// Function to normalize state input to two-letter code
function normalize_state($input, $state_codes) {
    $input = strtoupper(trim($input));
    if (array_key_exists($input, $state_codes)) {
        return $state_codes[$input];
    }
    return $input;
}

$city = '';
$state = '';
$from_date = '';
$to_date = '';
$status = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $city = $_POST['city'];
    $state = normalize_state($_POST['state'], $state_codes);
    $from_date = $_POST['from_date'];
    $to_date = $_POST['to_date'];
    $status = $_POST['status'];

    $sql = "SELECT crimeNo,description,date,location,status,name,witnessCount,criminalID FROM crimes WHERE 1=1";
    if (!empty($city)) {
        $sql .= " AND location LIKE '%$city%'";
    }
    if (!empty($state)) {
        $sql .= " AND location LIKE '%$state%'";
    }
    if (!empty($from_date) && !empty($to_date)) {
        $sql .= " AND date BETWEEN '$from_date' AND '$to_date'";
    } elseif (!empty($from_date)) {
        $sql .= " AND date >= '$from_date'";
    } elseif (!empty($to_date)) {
        $sql .= " AND date <= '$to_date'";
    }
    if (!empty($status)) {
        $sql .= " AND status = '$status'";
    }
} else {
    $sql = "SELECT crimeNo,description,date,location,status,name,witnessCount,criminalID FROM crimes";
}
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
    <form method="post">
        <label for="city">City:</label>
        <input type="text" name="city" id="city" value="<?php echo $city; ?>">
        <br><br>
        <label for="state">State:</label>
        <input type="text" name="state" id="state" value="<?php echo $state; ?>">
        <br><br>
        <label for="from_date">From Date:</label>
        <input type="date" name="from_date" id="from_date" value="<?php echo $from_date; ?>">
        <br><br>
        <label for="to_date">To Date:</label>
        <input type="date" name="to_date" id="to_date" value="<?php echo $to_date; ?>">
        <br><br>
        <label for="status">Status:</label>
        <select name="status" id="status">
            <option value="" <?php echo ($status == '') ? 'selected' : ''; ?>>All</option>
            <option value="Unsolved" <?php echo ($status == 'Unsolved') ? 'selected' : ''; ?>>Unsolved</option>
            <option value="Solved" <?php echo ($status == 'Solved') ? 'selected' : ''; ?>>Solved</option>
        </select>
        <br><br>
        <button type="submit">Filter</button>
    </form>
    <?php

    $conn = new mysqli($servername, $username, $password, $database, $port);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $stmt = $conn->stmt_init();
    if (!$stmt->prepare($sql)) {
        echo "Failed to prepare";
    } else {
        $stmt->execute();
        $stmt->bind_result($crimeNo, $description, $date, $location, $status, $name, $witnessCount, $criminalID);
        while ($stmt->fetch()) {
            echo "<p>" . $description . ", " . $crimeNo . ", " . $date . ", " . $location
                . ", " . $status . ", " . $name . ", " . $witnessCount . ", " . $criminalID . "</p>";
        }
    }

    $conn->close();
    ?>
</div>
</body>
</html>
