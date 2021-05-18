<html>
<head>
<title>Student Database</title>
</head>
<body>
<h1>Student Database</h1>

<form action="query_StudentCNum.php" method="POST">
Enter the Course Number: <input type="text" name="CNum" />
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
$query = "SELECT * FROM Sections WHERE Course_Num=" .$_POST["CNum"];
$result = $link->query($query);
$row = $result->fetch_assoc();
//Doesn't Print??
printf("Section Number: %s<br>", $row[Sec_Num]);

$result->free_result();
$link->close();
?>

</body>
</html>