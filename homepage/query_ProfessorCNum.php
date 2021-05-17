<html>
<head>
<title>Professor Database</title>
</head>
<body>
<h1>Professor Database</h1>
<form action="query_ProfessorCNum.php" method="POST">
Enter the section number: <input type="text" name="Sec_Num" />
<input type="submit" />
</form>
<!-- <form action="query_ProfessorCNum.php" method="POST">
Enter course number: <input type="text" name="Course_Num" />
<input type="submit" />
</form> -->

<li><a href="http://ecs.fullerton.edu/~cs332c21/index.html" class="button">Back to home!</a></li>

<?php
$link = mysqli_connect('mariadb', 'cs332c21', 'To2ozohz','cs332c21');
if(!$link){
    die('Could not connect:' .mysql_error());
}
echo 'Connected successfully<p>';

$query = "SELECT * FROM Enrollments WHERE Sec_Num=" .$_POST["Sec_Num"];
$result = $link->query($query);
$row=$result->fetch_assoc();
printf("Section Num: %s<br>\n", $row["Sec_Num"]);
printf("Grade: %s<br>\n", $row["Grade"]);

$result->free_result();
$link->close();
?>

</body>
</html>
