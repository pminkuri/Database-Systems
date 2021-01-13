
CREATE TABLE Role(
    Role_id INT PRIMARY KEY NOT NULL,
    Role_name VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE User(
    User_id VARCHAR(200) PRIMARY KEY NOT NULL,
    User_name VARCHAR(200) NOT NULL,
    Role_id INT NOT NULL,
    DOB Date NOT NULL,
	FOREIGN KEY (Role_id) REFERENCES Role(Role_id)
);

CREATE TABLE Address(
    Address_id VARCHAR(200) PRIMARY KEY NOT NULL,
    User_id VARCHAR(200) NOT NULL,
    State VARCHAR(200),
    City VARCHAR(200),
    Zipcode bigint,
    FOREIGN KEY (User_id) REFERENCES User(User_id)
);

CREATE TABLE Queries(
    Query_Id VARCHAR(200) PRIMARY KEY NOT NULL,
    Query_Desc VARCHAR(200) NOT NULL,
    Posted_Date Date NOT NULL,
	User_id VARCHAR(200) NOT NULL,
    Resolved Boolean,
    IsActive Boolean,
    FOREIGN KEY (User_id) REFERENCES User(User_id)
);

CREATE TABLE Query_AuditBackup(
    Query_Id VARCHAR(200) PRIMARY KEY NOT NULL,
    Query_Desc VARCHAR(200) NOT NULL,
    Posted_Date Date NOT NULL,
	User_id VARCHAR(200) NOT NULL,
    Resolved Boolean,
    IsActive Boolean,
    modified_TIMESTAMP Date,
    FOREIGN KEY (User_id) REFERENCES User(User_id)
);

CREATE TABLE BACKUP_QUERIES(
    Query_Id VARCHAR(200) PRIMARY KEY NOT NULL,
    Query_Desc VARCHAR(200) NOT NULL,
    Posted_Date Date NOT NULL,
	User_id VARCHAR(200) NOT NULL,
    Resolved Boolean,
    IsActive Boolean,
    FOREIGN KEY (User_id) REFERENCES User(User_id)
);

CREATE TABLE Categories(
    Category_ID  VARCHAR(200) PRIMARY KEY NOT NULL,
    Category_name VARCHAR(200) NOT NULL
);

CREATE TABLE Query_detail(
    Query_detail_id VARCHAR(200) PRIMARY KEY NOT NULL,
	Query_Id VARCHAR(200) NOT NULL,
    Category_ID  VARCHAR(200),
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
    FOREIGN KEY (Query_Id) REFERENCES Queries(Query_Id)
);


CREATE TABLE Comments(
    Comment_ID  VARCHAR(200) PRIMARY KEY NOT NULL,
	Comment_Date Date NOT NULL,
    User_id  VARCHAR(200),
    Commented_On VARCHAR(200),
    FOREIGN KEY (User_id) REFERENCES User(User_id)
);

CREATE TABLE Leaderboard(
	leaderrank bigint PRIMARY KEY NOT NULL,
    User_id   VARCHAR(200)  NOT NULL,
	Points bigint,
    FOREIGN KEY (User_id) REFERENCES User(User_id)
);


CREATE TABLE Message(
	MessageId int PRIMARY KEY NOT NULL,
    SenderId VARCHAR(200)  NOT NULL,
    ReciverId VARCHAR(200)  NOT NULL,
    Message VARCHAR(2000)  NOT NULL,
    IsRead bool,
	FOREIGN KEY (SenderId) REFERENCES User(User_id),
	FOREIGN KEY (ReciverId) REFERENCES User(User_id)
);


INSERT INTO Role(
    Role_id,
    Role_name
) values (1, 'ADMIN');

INSERT INTO Role(
	Role_id, 
	Role_name
) values(2, 'STUDENT');


INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1023', 'chaitanya' , NOW(), 2);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1024', 'amulya' , NOW()-1, 2);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1025', 'Prashant' , NOW()-2, 2);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1026', 'Di Wu' , NOW()-3, 2);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1027', 'Hugo' , NOW()-3, 1);


SELECT * FROM User;

INSERT INTO Address(
    Address_id,
    User_id,
    State,
    City,
    Zipcode
) VALUES ('1', '1023', 'NORTH CAROLINA', 'CHARLOTTE', '28262');


INSERT INTO Address(
    Address_id,
    User_id,
    State,
    City,
    Zipcode
) VALUES ('2', '1024', 'CALIFORNIA', 'SanFransico', '12321');


INSERT INTO Address(
    Address_id,
    User_id,
    State,
    City,
    Zipcode
) VALUES ('3', '1025', 'FLORIDA', 'GAINSVILLE', '23122');


INSERT INTO Address(
    Address_id,
    User_id,
    State,
    City,
    Zipcode
) VALUES ('4', '1026', 'TEXAS', 'ARLINGTON', '91921');


INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('1', 'What is arithmetic exception?', NOW(), '1023', TRUE, TRUE);

INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('1', 'Computer Science');

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On
) VALUES ('1', NOW(), '1023', '1');


INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(1, '1023', 1213);





SELECT * FROM Leaderboard order by leaderrank ASC LIMIT 1;


/* Retrieve all the comments*/
SELECT * FROM Comments;

/* RETRIEVE ALL STUDENTS*/
SELECT u.* FROM User u inner join Role r on u.Role_id = r.Role_id where r.Role_id = 2;

select * from Categories;

INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('2', 'Mathematics');

INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('3', 'Electronics');
INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('2', 'How can we define an integer', NOW(), '1024', TRUE, TRUE);

INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('3', 'What is a Diode?', NOW(), '1025', TRUE, TRUE);

INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('4', 'Defination of an even number?', NOW(), '1026', FALSE, TRUE);
INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('5', 'Difference between data mining and web mining?', NOW(), '1025', FALSE, TRUE);


select * from Queries;

select * from Queries order by Posted_Date desc limit 2;
select * from Categories;

select * from Query_detail;

INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('101', '1', '1');

INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('102', '2', '1');

INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('103', '2', '2');

INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('104', '3', '3');

select q.Query_Id , q.Query_Desc from Queries q 
inner join Query_detail d on q.Query_Id = d.Query_Id
inner join Categories c on d.Category_ID = c.Category_ID
where Category_name = "Computer Science" ;

select * from Categories;
select * from Comments;
INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(2, '1024', 1100);
INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(3, '1025', 1450);



select * from Leaderboard;

select User_id, max(Points) as max_points from Leaderboard;

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On
) VALUES ('2', NOW(), '1024', '2');
INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On
) VALUES ('3', NOW(), '1025', '3');



INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On
) VALUES ('4', NOW(), '1024', '4');

select * from Comments;




SELECT * FROM Message;

INSERT INTO Message(MessageId, SenderId, ReciverId, Message, IsRead) VALUES(1, '1023', '1027', 'Please Verify the schema', false);

/* RETRIEVE ALL THE REPORTS. ALL THE MESSAGES FOR ADMIN ARE REPORTS*/

INSERT INTO Message(MessageId, SenderId, ReciverId, Message, IsRead) VALUES(2, '1023', '1027', 'Remove/delete the query', false);

SELECT M.* FROM Message M 
					INNER JOIN User u on M.ReciverId = u.User_id
                    INNER JOIN Role r on u.Role_id = r.Role_id
                    where r.Role_id = 1;
                    
select Query_Id, Query_Desc from Queries where Resolved = "0";      

INSERT INTO Message(MessageId, SenderId, ReciverId, Message, IsRead) VALUES(3, '1023', '1027', 'Please Verify the tables', true);
            
select MessageId, Message from Message where IsRead = "1";


INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('4', 'Mechanical');
INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('5', 'Civil');

INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('6', 'Bioinformatics');
INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('7', 'InformationSystems');
INSERT INTO Categories(
    Category_ID,
    Category_name
) values ('8', 'StudentServices');


select * from Categories;


INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('6', 'How does Hydraulic cluthches work', NOW(), '1023', TRUE, TRUE);

INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('7', 'what is knurling', NOW(), '1025', FALSE, TRUE);

INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('8', 'what are the steps involved in concreting process', NOW(), '1026', TRUE, TRUE);

INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('9', 'what are the different layers in a communication network?', NOW(), '1024', FALSE, TRUE);

select * from Query_detail;

INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('105', '3', '3');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('106', '4', '2');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('107', '5', '7');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('108', '6', '4');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('109', '6', '5');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('110', '4', '1');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('111', '7', '5');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('112', '7', '6');

select * from Categories;

delete from Query_detail  where Query_id ="3";

select * from Comments;

alter table Comments add Query_id varchar(200);

update Comments set Query_id = "1" where Comment_ID = "1";
update Comments set Query_id = "1" where Comment_ID = "2";
update Comments set Query_id = "1" where Comment_ID = "3";
update Comments set Query_id = "1" where Comment_ID = "4";

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_id
) VALUES ('5', NOW(), '1026', '6','2');

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_id
) VALUES ('6', NOW(), '1026', '7','2');

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_id
) VALUES ('7', NOW(), '1024', '1','3');

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_id
) VALUES ('8', NOW(), '1024', '2','3');

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_id
) VALUES ('9', NOW(), '1026', '6','2');

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_id
) VALUES ('10', NOW(), '1025', '4','2');
update Leaderboard set Points = "1050" where leaderrank = "3";



INSERT INTO Message(MessageId, SenderId, ReciverId, Message, IsRead) VALUES(4, '1024', '1027', 'Provide the edit access to user', true);
INSERT INTO Message(MessageId, SenderId, ReciverId, Message, IsRead) VALUES(5, '1025', '1027', 'Change the user name to default', false);
INSERT INTO Message(MessageId, SenderId, ReciverId, Message, IsRead) VALUES(6, '1025', '1027', 'Update the address of user 1025', false);
INSERT INTO Message(MessageId, SenderId, ReciverId, Message, IsRead) VALUES(7, '1026', '1027', 'Verify the comments provided', true);

INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1028', 'Harini' , NOW(), 1);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1029', 'Spandana' , NOW(), 2);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1030', 'Pranitha' , NOW(), 2);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1031', 'Chaitra' , NOW(), 2);
INSERT INTO User (User_id, User_name, DOB, Role_id) values ('1032', 'Sahithi' , NOW(), 2);

select * from User;

alter table User add addr_line1 varchar(100);
alter table User add addr_line2 varchar(100);
alter table User add city varchar(100);
alter table User add state varchar(100);
alter table User add zipcode varchar(100);

update User set addr_line1 = "9309 kittansett Dr" where User_id = "1023";
select * from User;
update User set addr_line2 = "Apt E" where User_id = "1023";
update User set city = "Charlotte" where User_id = "1023";
update User set state = "North Carolina" where User_id = "1023";
update User set zipcode = "28262" where User_id = "1023";

update User set addr_line1 = "202 Barton creek Dr" where User_id = "1024";
update User set addr_line2 = "Apt H" where User_id = "1024";
update User set city = "Charlotte" where User_id = "1024";
update User set state = "North Carolina" where User_id = "1024";
update User set zipcode = "28262" where User_id = "1024";

update User set addr_line1 = "1118 Halifax PI" where User_id = "1025";
update User set addr_line2 = "Apt D" where User_id = "1025";
update User set city = "Hamiltom" where User_id = "1025";
update User set state = "New Jersey" where User_id = "1025";
update User set zipcode = "50410" where User_id = "1025";

update User set addr_line1 = "508 Alanton park" where User_id = "1026";
update User set addr_line2 = "Apt D" where User_id = "1026";
update User set city = "Cleveland" where User_id = "1026";
update User set state = "ohio" where User_id = "1026";
update User set zipcode = "43002" where User_id = "1026";

update User set addr_line1 = "Allens lake" where User_id = "1027";
update User set addr_line2 = "Apt E" where User_id = "1027";
update User set city = "Gainsville" where User_id = "1027";
update User set state = "Florida" where User_id = "1027";
update User set zipcode = "20025" where User_id = "1027";

update User set addr_line1 = "Amherst" where User_id = "1028";
update User set addr_line2 = "Gate 6" where User_id = "1028";
update User set city = "Cincinnati" where User_id = "1028";
update User set state = "Ohio" where User_id = "1028";
update User set zipcode = "40135" where User_id = "1028";

update User set addr_line1 = "Alameda street" where User_id = "1029";
update User set addr_line2 = "Lane 5" where User_id = "1029";
update User set city = "Los Angeles" where User_id = "1029";
update User set state = "California" where User_id = "1029";
update User set zipcode = "90201" where User_id = "1029";

update User set addr_line1 = "Atlantic  Boulevard" where User_id = "1030";
update User set addr_line2 = "APT B" where User_id = "1030";
update User set city = "Buffalo" where User_id = "1030";
update User set state = "NewYork" where User_id = "1030";
update User set zipcode = "91025" where User_id = "1030";

update User set addr_line1 = "Arrow Highway" where User_id = "1031";
update User set addr_line2 = "Gate 4" where User_id = "1031";
update User set city = "Charlotte" where User_id = "1031";
update User set state = "North Carolina" where User_id = "1031";
update User set zipcode = "28262" where User_id = "1031";

update User set addr_line1 = "Avalon Boulevard" where User_id = "1032";
update User set addr_line2 = "Apt E" where User_id = "1032";
update User set city = "Charlotte" where User_id = "1032";
update User set state = "North Carolina" where User_id = "1032";
update User set zipcode = "28262" where User_id = "1032";


select * from User;

Drop table Address;

select q.Query_Id , q.Query_Desc from Queries q 
inner join Query_detail d on q.Query_Id = d.Query_Id
inner join Categories c on d.Category_ID = c.Category_ID
where Category_name = "Computer Science" ;



/* Query which belong to both computerscience and Mathematics */
select Query_id, Query_desc from Queries where Query_id in
( select Query_id from Query_detail inner join Categories on
Query_detail.Category_ID = Categories.Category_ID
where Category_name = "computer science")
AND
Query_id in 
(select Query_id from Query_detail inner join Categories on
Query_detail.Category_ID = Categories.Category_ID
where Category_name = "Mathematics");

select * from Comments;

alter table Comments add Comment_desc varchar(100);

update Comments set Comment_desc = "It is an expression that results in numerival value" where Comment_ID = "1";
update Comments set Comment_desc = "An integer is an whole number that is not fraction" where Comment_ID = "10";
update Comments set Comment_desc = "This expression uses additions and subtractions" where Comment_ID = "2";
update Comments set Comment_desc = "It can be positive and negative" where Comment_ID = "3";
update Comments set Comment_desc = " Expressions are usually represented in what is known as Infix notation" where Comment_ID = "4";

update Comments set Comment_desc = " A number which is multiple of 2 is even" where Comment_ID = "5";
update Comments set Comment_desc = " Odd number is a number which is not multiple of 2" where Comment_ID = "6";
update Comments set Comment_desc = " A diode is a semiconductor device" where Comment_ID = "7";
update Comments set Comment_desc = " It is a two terminal component" where Comment_ID = "8";
update Comments set Comment_desc = " Integers have no fractional part and no digits after decimal" where Comment_ID = "9";

select * from Comments;
select * from Categories;

/*All comments posted by the user 1025*/
select Comment_desc,Comment_ID from Comments where User_id = "1025";


INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(7, '1028', 780);
INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(8, '1029', 750);
INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(9, '1030', 729);
INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(10, '1031', 650);

update Leaderboard set leaderrank = "4" where User_id = "1028";
update Leaderboard set leaderrank = "5" where User_id = "1029";
update Leaderboard set leaderrank = "6" where User_id = "1030";
update Leaderboard set leaderrank = "7" where User_id = "1031";

select * from Leaderboard;
INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_Id,
    Comment_desc
) VALUES ('11', NOW(), '1029', '4','4',"A number which is a multiple of 2");

INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_Id,
    Comment_desc
) VALUES ('12', NOW(), '1030', '5','5',"Process of finding patterns in data");
INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_Id,
    Comment_desc
) VALUES ('13', NOW(), '1030', '6','6',"The system works using various Hydraulic components");
INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_Id,
    Comment_desc
) VALUES ('14', NOW(), '1031', '7','5',"It discovers useful information from huge data");
INSERT INTO Comments(
    Comment_ID,
	Comment_Date,
    User_id,
    Commented_On,
    Query_Id,
    Comment_desc
) VALUES ('15', NOW(), '1032', '8','7',"It is a manufacturing process conducted on lathe");

select * from Comments order by Comment_ID asc;


CREATE TABLE Archived_Queries(
    Query_Id VARCHAR(200) PRIMARY KEY NOT NULL,
    Query_Desc VARCHAR(200) NOT NULL,
    Posted_Date Date NOT NULL,
	User_id VARCHAR(200) NOT NULL,
    Resolved Boolean,
    Date_deleted Date NOT NULL,
    FOREIGN KEY (User_id) REFERENCES User(User_id)
);

select * from Archived_Queries;


INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('10', 'what is an object oriented programming?', NOW(), '1029', TRUE, TRUE);
INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('11', 'what is a hub, switch and a network', NOW(), '1030', FALSE, TRUE);
INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('12', 'what is the difference between TCP and UDP', NOW(), '1032', TRUE, TRUE);

select * from Queries;

INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('113', '10', '1');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('114', '11', '6');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('115', '12', '6');

INSERT INTO Queries(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive
) values ('13', 'what is modulation and name the modulation techniques', NOW(), '1029', FALSE, TRUE);
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('116', '13', '3');
INSERT INTO Query_detail(
    Query_detail_id,
    Query_Id,
    Category_ID
) values ('117', '10', '8');

INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(8, '1026', 600);
INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(9, '1032', 590);
INSERT INTO Leaderboard(
	leaderrank,
    User_id,
	Points
) VALUES(10, '1027', 528);



/* TRIGGERS AND EVENTS*/

DELIMITER $$
CREATE TRIGGER updateLeaderboard_trig
AFTER INSERT ON `COMMENTS` FOR EACH ROW
begin       
       UPDATE leaderboard
       SET Points = Points + 1
       WHERE User_id = NEW.User_id;

END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER addrecordsAuditQuery_trig
AFTER DELETE ON `Queries` FOR EACH ROW
begin       
	   
	INSERT INTO Query_AuditBackup(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive,
    modified_TIMESTAMP
	) values (OLD.Query_Id,
    OLD.Query_Desc,
    OLD.Posted_Date,
	OLD.User_id,
    OLD.Resolved,
    OLD.IsActive,
    NOW());
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER updaterecordsAuditQuery_trig
AFTER UPDATE ON `Queries` FOR EACH ROW
begin       
	   
	INSERT INTO Query_AuditBackup(
    Query_Id,
    Query_Desc,
    Posted_Date,
	User_id,
    Resolved,
    IsActive,
    modified_TIMESTAMP
	) values (OLD.Query_Id,
    OLD.Query_Desc,
    OLD.Posted_Date,
	OLD.User_id,
    OLD.Resolved,
    OLD.IsActive,
    NOW());
END;
$$
DELIMITER ;




/*EVENTS*/
delimiter $$
create procedure backup_Queries()
begin
    insert into BACKUP_QUERIES select * from queries;
end $$
delimiter ;

-- Now, suposing that you want to execute this procedure every hour:
delimiter $$
create event backup_queriesevent
    on schedule EVERY 1 WEEK STARTS NOW()
    do
        begin
            call backup_Queries();
        end $$
delimiter ;







