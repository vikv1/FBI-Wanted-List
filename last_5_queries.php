<!DOCTYPE html>
<html>
<body>
   <?php
      require_once 'config.inc.php';

      // Create connection
      $conn = new mysqli($servername, $username, $password, $database, $port);
      
      // Check connection
      if ($conn->connect_error) {
         die("Connection failed: " . $conn->connect_error);
      }
   ?>

   <html>
<head>
    <title>Testing last 5 queries</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>

   <?php
      // put the tabs at the top of the page
      require_once 'header.inc.php';
   ?>

   <h1> Q6:  </h1>
   <?php
      // fetch data
      $sql = "SELECT COUNT(*) AS crimes_committed FROM crimes WHERE location like'New York%' AND date >= '2024-01-01';";
      $result = $conn->query($sql);

      if ($result->num_rows > 0) {
         // Output data of each row
         while($row = $result->fetch_assoc()) {
            echo "Number of crimes: " . $row["crimes_committed"]. " starting from 2024-01-01 <br>" /*. $row["date"]. "<br>"*/ ;
         }
      } else {
         echo "0 results";
      }
   ?>
   
   <h1> Q7:  </h1>
   <?php
      // fetch data
      $sql = "SELECT COUNT(*) AS criminals FROM criminal JOIN crimes ON criminal.criminalID = crimes.criminalID WHERE location LIKE 'New York%' AND criminal.status LIKE '%Captured'; ";
      $result = $conn->query($sql);

      if ($result->num_rows > 0) {
         // Output data of each row
         while($row = $result->fetch_assoc()) {
            echo "Number of criminals: " . $row["criminals"]. " starting from 2024-01-01 <br>" /*. $row["date"]. "<br>"*/ ;
         }
      } else {
         echo "0 results";
      }
   ?>

   <h1> Q8:  </h1>
   <?php
      // fetch data
      $sql = "SELECT COUNT(*) AS num_victims FROM victim JOIN crimes on victim.criminalID = crimes.criminalID JOIN PSA_Locations on crimes.location = PSA_Locations.Location WHERE PSA_Locations.Location LIKE '%NY';";
      $result = $conn->query($sql);

      if ($result->num_rows > 0) {
         // Output data of each row
         while($row = $result->fetch_assoc()) {
            echo "Number of victims: " . $row["num_victims"]. " in New York state <br>" /*. $row["date"]. "<br>"*/ ;
         }
      } else {
         echo "0 results";
      }
   ?>

   <h1> Q9:  </h1>
   <?php
      // fetch data
      $sql = "SELECT ROUND(AVG(witnessCount), 0) AS avgWitnesses FROM crimes WHERE crimes.description LIKE 'Armed Robbery';";
      $result = $conn->query($sql);

      if ($result->num_rows > 0) {
         // Output data of each row
         while($row = $result->fetch_assoc()) {
            echo "Average number of witnesses for armed robbery crimes: " . $row["avgWitnesses"]. "<br>";
         }
      } else {
         echo "0 results";
      }
   ?>

<h1> Q10:  </h1>
   <?php
      // fetch data
      $sql = "SELECT flyerID FROM criminal JOIN crimes on criminal.criminalID = crimes.criminalID WHERE crimes.description LIKE '%Child%' AND crimes.location LIKE '%OH';";
      $result = $conn->query($sql);

      if ($result->num_rows > 0) {
         // Output data of each row
         while($row = $result->fetch_assoc()) {
            echo "Flyer for NY state: " . $row["flyerID"]. "<br>";
         }
      } else {
         echo "0 results";
      }
   ?>

   <?php
      // close after all queries done
      $conn->close();
   ?>

</body>
</html>