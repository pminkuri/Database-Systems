/* view to get all the students */
create view student as
select u.User_id, u.User_name, u.addr_line1,u.addr_line2, u.city, u.state, u.zipcode from User u
inner join Role r on u.Role_id = r.Role_id where r.Role_id="2";


/* queries with their comments */

create view get_details as
select q.Query_Id, q.Query_Desc, group_concat(c.Comment_desc) as comments 
from Queries q inner join Comments c
on q.Query_Id= c.Query_id group by q.Query_ID order by Query_id asc;

select * from get_details;

/* create view to display all reports sent to admin*/
create view get_reports as
SELECT M.* FROM Message M 
INNER JOIN User u on M.ReciverId = u.User_id
INNER JOIN Role r on u.Role_id = r.Role_id
where r.Role_id = 1 ;

select * from get_reports;

/* create view to get all users from charlotte  */
create view users_in_charlotte as
select u.User_id, u.User_name,u.Role_id, u.DOB,u.addr_line1,u.addr_line2,
u.city,u.state,u.zipcode 
from User u inner join Role r
on u.Role_id = r.Role_id  
and r.Role_name = "student" and u.city = "charlotte"  ;