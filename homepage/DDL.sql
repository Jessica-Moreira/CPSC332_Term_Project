DROP TABLE College_Degrees;
DROP TABLE Enrollments;
DROP TABLE Meeting_Days;
DROP TABLE Preqrequisites;
DROP TABLE Sections;
DROP TABLE Courses;
DROP TABLE Students;
DROP TABLE Departments;
DROP TABLE Professors;

CREATE TABLE Professors(
    SSN Numeric(9) NOT NULL,
    PName VARCHAR(50),
    Salary INT,
    Title VARCHAR(50),
    Sex enum('M', 'F', 'O'),
    Street VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(50),
    Zip_Code Numeric(5),
    Area_Code Numeric(3),
    Phone_Number Numeric(7),
    PRIMARY KEY(SSN)
);

CREATE TABLE Departments(
    DNum Numeric(6) NOT NULL,
    DName VARCHAR(50),
    Location VARCHAR(50),
    Telephone Numeric(10),
    Chair_SSN Numeric(9),
    PRIMARY KEY(DNum),
    FOREIGN KEY(CHAIR_SSN) references Professors(SSN)
);

CREATE TABLE Students(
    CWID Numeric(9) NOT NULL,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Address VARCHAR(100),
    Telephone Numeric(10),
    Major_DNum Numeric(6),
    PRIMARY KEY(CWID),
    FOREIGN KEY(Major_DNum) references Departments(DNum)
);

CREATE TABLE Courses(
    CNum Char(7) NOT NULL,
    Title VARCHAR(50),
    Textbook VARCHAR(50),
    Units Numeric(1),
    Course_Dnum Numeric(6),
    PRIMARY KEY (CNum),
    FOREIGN KEY(Course_Dnum) references Departments(DNum)
);

CREATE TABLE Sections(
    Sec_Num Char(7) NOT NULL,
    Course_Num Char(7) NOT NULL,
    Classroom VARCHAR(20),
    Begin_Time TIME,
    End_Time TIME,
    Student_CWID Numeric(9),
    Professor Numeric(9),
    Num_Seats INT,
    PRIMARY KEY(Sec_Num, Course_Num),
    FOREIGN KEY(Course_Num) references Courses(CNum),
    FOREIGN KEY(Student_CWID) references Students(CWID),
    FOREIGN KEY(Professor) references Professors(SSN)
);

CREATE TABLE Preqrequisites(
    Course_Num CHAR(7) NOT NULL,
    Pre_Req_Course CHAR(7) NOT NULL,
    PRIMARY KEY (Course_Num, Pre_Req_Course),
    FOREIGN KEY(Course_Num) references Courses(CNum),
    FOREIGN KEY(Pre_Req_Course) references Courses(CNum)
);

CREATE TABLE Meeting_Days(
    Sec_Num Char(7) NOT NULL,
    C_Num Char(7) NOT NULL,
    Meeting_Day enum('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    PRIMARY KEY (Sec_Num, C_Num, Meeting_Day),
    FOREIGN KEY (Sec_Num) references Sections(Sec_Num),
    FOREIGN KEY (C_Num) references Courses(CNum)
);

CREATE TABLE Enrollments(
    Course_Num CHAR(7) NOT NULL,
    Sec_Num Char(7) NOT NULL,
    Student_ID Numeric(9) NOT NULL,
    Grade enum('A', 'B', 'C', 'D', 'F', 'W'),
    PRIMARY KEY (Course_Num, Sec_Num, Student_ID),
    FOREIGN KEY (Course_Num) references Sections(Course_Num),
    FOREIGN KEY (Sec_Num) references Sections(Sec_Num),
    FOREIGN KEY (Student_ID) references Students(CWID)
);

CREATE TABLE College_Degrees(
    Prof_SSN Numeric(9) NOT NULL,
    Degree VARCHAR(50) NOT NULL,
    PRIMARY KEY(Prof_SSN, Degree),
    FOREIGN KEY(Prof_SSN) references Professors(SSN)
);

INSERT INTO Professors VALUES (111111111, 'Francis Xavier', 90000, 'Director', 'M', '123 Mutant Lane', 'San Francisco', 'California', 94016, 415, 5552534);
INSERT INTO Professors VALUES (222222222, 'Shawn Wang', 150000, 'Director', 'M', '123 Cool Road', 'Fullerton', 'California', 90621, 714, 5551234);
INSERT INTO Professors VALUES (333333333, 'Stephanie Coolman', 100000, 'Professor', 'F', '321 Fun Lane', 'Irvine', 'California', 92617, 949, 5554321);

INSERT INTO Departments VALUES (222222, 'Computer Science', 'CS423', 7142241423, 222222222);
INSERT INTO Departments VALUES (111111, 'Mutant studies', 'MH143', 7141423433, 111111111);