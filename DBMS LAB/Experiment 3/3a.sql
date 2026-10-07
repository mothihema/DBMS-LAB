create table emp(
id number (20),
name varchar (20),
address varchar (25));

desc emp;

insert into emp values('1','Ganga','Anantapur');
insert into emp values('2','Manu','Hyderabad');
insert into emp values('3','Lalitha','Tirupathi');

select * from emp;

create table emp2(
id number(20),
name varchar(10),
address varchar(20));

desc emp2;

insert into emp2 values('2','Manu','Hyderabad');
insert into emp2 values('5','Yamuna','Vizag');
insert into emp2 values('6','Rupa','Mysore');

select * from emp2;

select * from emp
union
select * from emp2;

select * from emp
union all
select * from emp2;

select * from emp 
Intersect 
select * from emp2; 

select * from emp 
minus 
select * from emp2; 

select * from empg 
cross join emp2; 


