DROP TABLE College_Degrees;
DROP TABLE Minors_In;
DROP TABLE Enrollments;
DROP TABLE Meeting_Days;
DROP TABLE Preqrequisites;
DROP TABLE Sections;
DROP TABLE Courses;
DROP TABLE Students;
DROP TABLE Departments;
DROP TABLE Professors;

-- Do not change the orders of any of the tables or inserts. Order matters. 

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
    Course_DNum Numeric(6),
    PRIMARY KEY (CNum),
    FOREIGN KEY(Course_Dnum) references Departments(DNum)
);

CREATE TABLE Sections(
    Sec_Num Char(7) NOT NULL,
    Course_Num Char(7) NOT NULL,
    Classroom VARCHAR(20),
    Begin_Time TIME,
    End_Time TIME,
    Professor Numeric(9),
    Num_Seats INT,
    PRIMARY KEY(Sec_Num, Course_Num),
    FOREIGN KEY(Course_Num) references Courses(CNum),
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
    FOREIGN KEY (C_Num) references Sections(Course_Num)
);

CREATE TABLE Enrollments(
    Course_Num CHAR(7) NOT NULL,
    Sec_Num Char(7) NOT NULL,
    Student_ID Numeric(9) NOT NULL,
    Grade CHAR(2),
    PRIMARY KEY (Course_Num, Sec_Num, Student_ID),
    FOREIGN KEY (Course_Num) references Sections(Course_Num),
    FOREIGN KEY (Sec_Num) references Sections(Sec_Num),
    FOREIGN KEY (Student_ID) references Students(CWID)
);

CREATE TABLE Minors_In(
    Minor_DNum Numeric(6) NOT NULL,
    Student_CWID Numeric(9) NOT NULL,
    PRIMARY KEY(Minor_DNum, Student_CWID),
    FOREIGN KEY(Minor_Dnum) references Departments(DNum),
    FOREIGN KEY(Student_CWID) references Students(CWID)
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
INSERT INTO Departments VALUES (111111, 'Mutant Studies', 'MH143', 7141423433, 111111111);

INSERT INTO Courses VALUES ('CSPC120', 'Introduction to C++', 'C++ Fundamentals', 3, 222222);
INSERT INTO Courses VALUES ('CSPC131', 'Datastructures and Algorithms', 'C++ Datastructures and Algorithms', 3, 222222);
INSERT INTO Courses VALUES ('MUT143', 'Advanced Flying', 'Advanced Techniques in Flying', 3, 111111);
INSERT INTO Courses VALUES ('MUT224', 'Invisibility Fundamentals', 'Invisibility Basics', 3, 111111);

INSERT INTO Sections VALUES ('120-01', 'CSPC120', 'CS123', '08:00:00', '09:00:00', 222222222, 30);
INSERT INTO Sections VALUES ('120-02', 'CSPC120', 'CS123', '10:00:00', '11:00:00', 222222222, 30);
INSERT INTO Sections VALUES ('131-01', 'CSPC131', 'CS225', '10:00:00', '11:00:00', 333333333, 20);
INSERT INTO Sections VALUES ('143-01', 'MUT143', 'M100', '08:00:00', '09:45:00', 111111111, 40);
INSERT INTO Sections VALUES ('224-01', 'MUT224', 'M232', '10:00:00', '11:00:00', 111111111, 35);
INSERT INTO Sections VALUES ('224-02', 'MUT224', 'M232', '12:00:00', '13:00:00', 111111111, 35);

INSERT INTO Students VALUES (142192145, 'Tom', 'Kim', '432 Disney Way, Anaheim CA', 7141401423, 222222);
INSERT INTO Students VALUES (843235123, 'Ellen', 'Page', '11 Deerfield, Irvine CA', 9491421934, 222222);
INSERT INTO Students VALUES (721123043, 'Allen', 'Johnson', '1142 Sky Lane, San Francisco CA', 1421236667, 222222);
INSERT INTO Students VALUES (234768912, 'Bethany', 'Herbert', '5 Via Las Vegas, Portland OR', 2321421243, 222222);
INSERT INTO Students VALUES (314214213, 'Cassidy', 'Lee', '323 Hot Street, Houston TX', 3141236789, 111111);
INSERT INTO Students VALUES (429203637, 'Darren', 'Porter', '902 Las Vegas Blvd, Las Vegas NV', 5654567890, 111111);
INSERT INTO Students VALUES (589213032, 'Frank', 'Miller', '76 New York, New York NY', 6340961256, 111111);
INSERT INTO Students VALUES (690123578, 'George', 'Smith', '16 Fun Street, Miami FL', 8882120434, 111111);

INSERT INTO Enrollments VALUES ('CSPC120', '120-01', 142192145, 'A-');
INSERT INTO Enrollments VALUES ('MUT143', '143-01', 142192145, 'B-');
INSERT INTO Enrollments VALUES ('MUT224', '224-01', 142192145, 'C');
INSERT INTO Enrollments VALUES ('CSPC120', '120-01', 843235123, 'B');
INSERT INTO Enrollments VALUES ('MUT143', '143-01', 843235123, 'B');
INSERT INTO Enrollments VALUES ('MUT224', '224-01', 843235123, 'C+');
INSERT INTO Enrollments VALUES ('CSPC120', '120-02', 721123043, 'A');
INSERT INTO Enrollments VALUES ('MUT143', '143-01', 721123043, 'A');
INSERT INTO Enrollments VALUES ('MUT224', '224-02', 721123043, 'D');
INSERT INTO Enrollments VALUES ('CSPC131', '131-01', 234768912, 'A');
INSERT INTO Enrollments VALUES ('MUT143', '143-01', 234768912, 'A');
INSERT INTO Enrollments VALUES ('MUT224', '224-02', 234768912, 'C-');
INSERT INTO Enrollments VALUES ('CSPC131', '131-01', 314214213, 'F');
INSERT INTO Enrollments VALUES ('MUT143', '143-01', 314214213, 'F');
INSERT INTO Enrollments VALUES ('CSPC131', '131-01', 429203637, 'A+');
INSERT INTO Enrollments VALUES ('MUT143', '143-01', 429203637, 'A+');
INSERT INTO Enrollments VALUES ('CSPC131', '131-01', 589213032, 'B');
INSERT INTO Enrollments VALUES ('MUT143', '224-02', 589213032, 'D');
INSERT INTO Enrollments VALUES ('MUT224', '224-01', 690123578, 'B');
INSERT INTO Enrollments VALUES ('MUT143', '143-01', 690123578, 'D');

INSERT INTO Meeting_Days VALUES('120-01', 'CSPC120', 'Monday');
INSERT INTO Meeting_Days VALUES('120-01', 'CSPC120', 'Wednesday');
INSERT INTO Meeting_Days VALUES('120-02', 'CSPC120', 'Monday');
INSERT INTO Meeting_Days VALUES('120-02', 'CSPC120', 'Wednesday');
INSERT INTO Meeting_Days VALUES('131-01', 'CSPC131', 'Tuesday');
INSERT INTO Meeting_Days VALUES('131-01', 'CSPC131', 'Thursday');
INSERT INTO Meeting_Days VALUES('143-01', 'MUT143', 'Saturday');
INSERT INTO Meeting_Days VALUES('224-01', 'MUT224', 'Friday');
INSERT INTO Meeting_Days VALUES('224-02', 'MUT224', 'Tuesday');

INSERT INTO Preqrequisites VALUES ('CSPC131', 'CSPC120');

INSERT INTO Minors_In VALUES (111111, 721123043);
INSERT INTO Minors_In VALUES (222222, 589213032);

INSERT INTO College_Degrees VALUES (111111111, 'P.H.D in Psychology');
INSERT INTO College_Degrees VALUES (222222222, 'P.H.D in Computer Science');
INSERT INTO College_Degrees VALUES (333333333, 'M.S. in Computer Science');
