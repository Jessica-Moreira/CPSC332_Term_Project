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

//----Displays all the courses and grades of the CWID inputed----
if ($result = $link->query("SELECT * FROM Enrollments WHERE Student_ID=" .$_POST["CWID"])) {

    /* determine number of rows result set */
    $row_cnt = $result->num_rows;

    printf("The student has %d courses.<br>", $row_cnt);
    
    //Prints out each of the courses and the grade
    for ($i = 0; $i < $row_cnt; $i++){
        $row = $result->fetch_assoc();
        printf("Course: %s<br>", $row[Course_Num]);
        printf("Grade: %s<br>", $row[Grade]);
    }

    /* close result set */
    $result->close();
}

$result->free_result();
$link->close();
?>

</body>
</html>