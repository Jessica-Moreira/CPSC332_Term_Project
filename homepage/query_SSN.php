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

$query = "SELECT Title, Classroom, Begin_Time, End_Time, Meeting_Day 
        FROM Sections S, Meeting_Days M, Courses C 
        WHERE  M.Sec_Num=S.Sec_Num AND C.CNum=S.Course_Num AND S.Professor=" .$_POST["SSN"];

$result = $link->query($query);
$nor = $result->num_rows;

for($i = 0; $i < $nor; $i++){
    $row=$result->fetch_assoc();
    echo "Title: ", $row["Title"], "<br>";
    echo "Classrooms: ", $row["Classroom"], "<br>";
    echo "Meeting Days: ", $row["Meeting_Day"], "<br>";
    echo "Times: ", $row["Begin_Time"], "-", $row["End_Time"], "<br>";
    echo "<br>";
}

$result->free_result();
$link->close();
?>

</body>
</html>




