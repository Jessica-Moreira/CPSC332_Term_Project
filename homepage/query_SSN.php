<html>
<head>
<title>Professor Database</title>
</head>
<body>
<h1>Professor Database</h1>

<form action="query_SSN.php" method="POST">
Enter Your SSN: <input type="text" name="SSN"/>
<input type="submit"/>
</form>

<li><a href="http://ecs.fullerton.edu/~cs332c21/index.html" class="button">Back to home!</a></li>

<?php
$link = mysqli_connect('mariadb', 'cs332c21', 'To2ozohz','cs332c21');
if(!$link){
    die('Could not connect:' .mysql_error());
}
echo 'Connected successfully<p>';

$query = "SELECT * FROM Professors WHERE SSN=" .$_POST["SSN"];
$result = $link->query($query);
$row=$result->fetch_assoc();
echo "Name: ",$row["PName"], "<br>";
// printf("Name: %s<br>\n", $row["PName"]);
// printf("Title: %s<br>\n", $row["Title"]);
//printf("Classrooms:%s<br>\n", $row["Last_Name"]);
//printf("Meeting Days:%s<br>\n", $row["First_Name"]);
//printf("Times:%s<br>\n", $row["Begin_Time"], $row["End_Time"]);
$result->free_result();
$link->close();
?>

</body>
</html>
