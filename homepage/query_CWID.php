<html>
<head>
<title>Student Database</title>
</head>
<body>
<h1>Student Database</h1>

<form action="query_CWID.php" method="POST">
Enter the CWID: <input type="text" name="CWID" />
<input type="submit" />
</form>


<li><a href="http://ecs.fullerton.edu/~cs332c21/index.html" class="button">Back to home!</a></li>

<?php
$link = mysqli_connect('mariadb', 'cs332c21', 'To2ozohz', 'cs332c21');
if(!$link){
    die('Could not connect:' .mysql_error());
}
echo 'Connected successfully<p>';

//----Displays the name of the Student----
/*
$query = "SELECT * FROM Students WHERE CWID=" .$_POST["CWID"];
$result = $link->query($query);
$row = $result->fetch_assoc();
printf("Name: %s %s<br>", $row[First_Name], $row[Last_Name]);
*/

//----Displays one Course (NEEDS TO DISPLAY ALL COURSE)----
$query = "SELECT * FROM Enrollments WHERE Student_ID=" .$_POST["CWID"];
$result = $link->query($query);
$row = $result->fetch_assoc();
printf("Course Number: %s<br>", $row[Course_Num]);
printf("Grade: %s<br>", $row[Grade]);

//Doesn't work atm
/*
$result = $link->query("SELECT * FROM Enrollments",$link);
$nor=$result->num_rows;
printf("Result set has %d rows.\n",$nor);

for($i = 0; $i < $num_rows; $i++) {
    printf("WORKING");
    $row = $result->fetch_assoc();
    printf("Course Number: %s<br>", $row[Course_Num]);
    printf("Grade: %s<br>", $row[Grade]);
}
*/
$result->free_result();
$link->close();
?>

</body>
</html>