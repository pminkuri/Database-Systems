delimiter $$
CREATE PROCEDURE `TopFiveActiveUsers`()
BEGIN
Select User_id, User_name from Comments inner join 
User using (User_id) group by User_id  order by count(User_id) desc limit 5;
END $$

call TopFiveActiveUsers;

delimiter $$
CREATE  PROCEDURE `ResolvedQueries`()
BEGIN
select * from Queries where 
Resolved= true ;
end $$

call ResolvedQueries;

delimiter $$ 
CREATE PROCEDURE `UserActivity`(in userid varchar(20))
BEGIN
select Comment_desc Posts ,Comment_Date Dated from Comments where User_id=userid
 union
select Query_Desc,Posted_Date from Queries where User_id=userid;
END $$

call UserActivity(1026);

