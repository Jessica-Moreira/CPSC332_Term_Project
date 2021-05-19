<html>
<head>
<title>Professor Database</title>
</head>
<body>
<h1>Professor Database</h1>

<form action="query_ProfessorCNum.php" method="POST">
Enter course number: <input type="text" name="Course_Num" />
Enter the section number: <input type="text" name="Sec_Num" />
<input type="submit" />
</form>

<li><a href="http://ecs.fullerton.edu/~cs332c21/index.html" class="button">Back to home!</a></li>

<?php
$link = mysqli_connect('mariadb', 'cs332c21', 'To2ozohz','cs332c21');
if(!$link){
    die('Could not connect:' .mysql_error());
}
echo 'Connected successfully<p>';

$query = "SELECT Grade, COUNT(*) as Grade_Count FROM Enrollments 
    WHERE Sec_Num='{$_POST["Sec_Num"]}' 
    AND Course_Num='{$_POST["Course_Num"]}' GROUP BY Grade";
    //echo $query, "<br>";

$result = $link->query($query);
$nor = $result->num_rows;

for($i = 0; $i < $nor; $i++){
    $row=$result->fetch_assoc();
    echo "Grade: ", $row["Grade"], "<br>";
    echo "Student Total: ", $row["Grade_Count"],"<br>";
}

$result->free_result();
$link->close();
?>

</body>
</html>

<!-- WHERE Sec_Num=" .$_POST["Sec_Num"] . " AND Course_Num=" . $_POST["Course_Num"] -->
