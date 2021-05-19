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
$query = "SELECT * 
        FROM Sections S, Meeting_Days M
        WHERE M.C_Num = S.Course_Num AND M.Sec_Num = S.Sec_Num
        AND Course_Num= '{$_POST["CNum"]}'";
$result = $link->query($query);
$nor = $result->num_rows;

for ($i = 0; $i < $nor; $i++){
    if ($row = $result->fetch_assoc()){
        echo "Section: ", $row["Sec_Num"], "<br>";
        echo "Classroom: ", $row["Classroom"], "<br>";
        echo "Meeting Days: ", $row["Meeting_Day"], "<br>";
        echo "Times: ", $row["Begin_Time"], "-", $row["End_Time"], "<br>";
        echo "Number of Students Enrolled: ", $row["Num_Seats"], "<br>";
        echo "<br>";
    }
}
$result->free_result();
$link->close();
?>

</body>
</html>