CREATE DATABASE NCP;
USE 6dO9xvYDBl;
create table Student(FirstName char(25) not null,MiddleName char(25),LastName char(25) not null, RollNumber varchar(16) primary key, EmailID varchar(50) not null unique, PhoneNumber varchar(10) not null unique, Address varchar(120) not null, Degree varchar(10) not null, Department varchar(50) not null, GradYear year not null, CGPA float(2) not null, check ((CGPA>=0) AND (CGPA<=10)), check ((GradYear>=2021) AND (GradYear<=2023)));
create table Registrations(RollNumber varchar(16), CompanyName varchar(25), RoleName varchar(50), RoleType varchar(15) not null, Question varchar(200) not null, ResumeLink varchar(150) not null, StatusVal char(15) not null, primary key(RollNumber,CompanyName), foreign key(RollNumber) references Student(RollNumber));

select * from Student;
select * from Registrations;
select * from Users;
select * from Companies;
select * from Roles;
delete from Registrations;
delete from Student;

drop table Registrations;
delete from Registrations where RollNumber = "CB.EN.U4CSE17307";
drop table Student;
drop table Roles;
drop table Companies;

select CompanyName from Registrations where NOT (RollNumber = "CB.EN.U4CSE17307");
select distinct Companies.CompanyName from Companies where CompanyName not in (select CompanyName from Registrations where RollNumber = "CB.EN.U4CSE17307");

create table Users(EmailID varchar(50) primary key, PasswordVal varchar(20),foreign key (EmailID) references Student(EmailID),check (length(PasswordVal)>=8));
create table Companies(CompanyName varchar(25) primary key, CGPA float(2) not null, CompanyLink varchar(120), Criteria varchar(300), Question varchar(100) not null,About varchar(600) not null,check (CGPA >=0 and CGPA <=10.0));
create table Roles(CompanyName varchar(25), CompanyRole varchar(25), RoleDescription varchar(100), CTC integer, primary key (CompanyName,CompanyRole), foreign key(CompanyName) references Companies(CompanyName));

insert into Companies values("Amazon",8,"http://www.amazon.com","No Backlogs & Experience with Python/Java/C & Proficiency in Algorithms", "Why do you want to join our company?","Amazon.com, Inc. is an American multinational technology company based in Seattle, Washington, which focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence. It is considered one of the Big Five companies in the U.S. information technology industry, along with Google, Apple, Microsoft, and Facebook.The company has been referred to as 'one of the most influential economic and cultural forces in the world', as well as the world's most valuable brand.");
insert into Companies values("Microsoft",8,"http://www.microsoft.com","No Backlogs & Experience with Python/Java/C & Proficiency in Algorithms or Cloud", "What is the most challenging problem you needed to solve?","Microsoft is considered to be one of the world's most valuable and prestigious firms to work at. It emphasizes on collective growth and social benefit, and is responsible for promoting the education of women in STEM");
insert into Companies(CompanyName,CGPA,Criteria,Question,About) values("Mr.Cooper",7,"No Backlogs & Experience with Python/Java/C & Proficiency in Algorithms", "Why do you want to join our company?","Mr.Cooper is a company that which provides servicing and originations for homeowners throughout the United States, and Xome, which provides technology and data enhanced solutions[buzzword] to the real estate market and companies engaged in the origination and/or servicing of mortgage loans.");

insert into Roles values("Amazon","Software Engineer","Responsible for developing and testing quality code.",2000000);
insert into Roles values("Amazon","R&D","Conducts research in Data Science and ML",2000000);
insert into Roles values("Mr.Cooper","Software Engineer","Develops code and communicates with program manager",1000000);
insert into Roles values("Microsoft","Data Analyst","Analyzes social media data and employs ML models to study them", 4000000);
insert into Roles values("Microsoft","Technical Writer","Content writing for online documentation and product reviews",3000000);
