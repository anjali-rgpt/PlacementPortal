CREATE DATABASE NCP;
USE NCP;
create table Student(FirstName char(25) not null,MiddleName char(25),LastName char(25) not null, RollNumber varchar(16) primary key, EmailID varchar(50) not null unique, PhoneNumber varchar(10) not null unique, Address varchar(120) not null, Degree varchar(10) not null, Department varchar(50) not null, GradYear year not null, CGPA float(2) not null, check ((CGPA>=0) AND (CGPA<=10)), check ((GradYear>=2021) AND (GradYear<=2023)));
create table Registrations(RollNumber varchar(16), CompanyName varchar(25), RoleName varchar(50), RoleType varchar(15) not null, Question varchar(200) not null, ResumeLink varchar(150) not null, StatusVal char(15) not null, primary key(RollNumber,CompanyName), foreign key(RollNumber) references Student(RollNumber));

select * from student;
select * from registrations;
select * from Users;
delete from Registrations;
delete from Student;

drop table Registrations;
drop table Student;

create table Users(EmailID varchar(50) primary key, PasswordVal varchar(20),foreign key (EmailID) references Student(EmailID),check (length(PasswordVal)>=8));
