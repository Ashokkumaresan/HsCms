create database HsCmsSolution;
use HsCmsSolution;
CREATE SCHEMA HsCms;
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'HsCms' 
                 AND  TABLE_NAME = 'Hs_superadmin'))
DROP TABLE HsCms.Hs_superadmin;
CREATE TABLE HsCms.Hs_superadmin(
id INT NOT NULL IDENTITY(1,1),
username varchar(50) NOT NULL,
password varchar(50)  NOT NULL,
PRIMARY KEY (id)
);
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'HsCms' 
                 AND  TABLE_NAME = 'Hs_domainadmin'))
DROP TABLE HsCms.Hs_domainadmin;
CREATE TABLE HsCms.Hs_domainadmin(
id INT NOT NULL IDENTITY(1,1),
domain varchar(max) NOT NULL,
username varchar(50)  NOT NULL,
password varchar(50) NOT NULL,
lastlogin datetime,
status int NOT NULL,
PRIMARY KEY (id)
);
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'HsCms' 
                 AND  TABLE_NAME = 'Hs_pages'))
DROP TABLE HsCms.Hs_pages;
CREATE TABLE HsCms.Hs_pages(
id INT NOT NULL IDENTITY(1,1),
domainid int NOT NULL,
pagename varchar(50)  NOT NULL,
status int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (domainid) REFERENCES HsCms.Hs_domainadmin(id)
);

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'HsCms' 
                 AND  TABLE_NAME = 'Hs_generaldetails'))
DROP TABLE HsCms.Hs_generaldetails;
CREATE TABLE HsCms.Hs_generaldetails(
id INT NOT NULL IDENTITY(1,1),
domainid int NOT NULL,
logo varchar(max),
facebook varchar(max),
twitter varchar(max),
instagram varchar(max),
gplus varchar(max),
youtube varchar(max),
linkedin varchar(max),
address1 varchar(max),
address2 varchar(max),
contactno varchar(max),
mapurl varchar(max),
emailid varchar(max),
others varchar(max),
status int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (domainid) REFERENCES HsCms.Hs_domainadmin(id)
);

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'HsCms' 
                 AND  TABLE_NAME = 'Hs_menu'))
DROP TABLE HsCms.Hs_menu;
CREATE TABLE HsCms.Hs_menu(
id INT NOT NULL IDENTITY(1,1),
domainid int NOT NULL,
pageid int NOT NULL,
menuname varchar(50),
menuref varchar(50),
parent varchar(50),
sectionid varchar(50),
link varchar(max),
imageurl varchar(max),
iconclass varchar(max),
orderpriority int,
status int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (domainid) REFERENCES HsCms.Hs_domainadmin(id),
FOREIGN KEY (pageid) REFERENCES HsCms.Hs_pages(id),
);

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'HsCms' 
                 AND  TABLE_NAME = 'Hs_slider'))
DROP TABLE HsCms.Hs_slider;
CREATE TABLE HsCms.Hs_slider(
id INT NOT NULL IDENTITY(1,1),
domainid int NOT NULL,
pageid int NOT NULL,
sectionid varchar(50),
imageurl varchar(max),
imagetext varchar(max),
alt varchar(50),
width varchar(50),
height varchar(50),
imagetype varchar(50),
imagepriority int,
groupname varchar(50),
header varchar(100),
status int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (domainid) REFERENCES HsCms.Hs_domainadmin(id),
FOREIGN KEY (pageid) REFERENCES HsCms.Hs_pages(id),
);

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'HsCms' 
                 AND  TABLE_NAME = 'Hs_news'))
DROP TABLE HsCms.Hs_news;
CREATE TABLE HsCms.Hs_news(
id INT NOT NULL IDENTITY(1,1),
domainid int NOT NULL,
pageid int NOT NULL,
sectionid varchar(50),
newstype varchar(50),
imageurl varchar(max),
newsdate datetime,
title varchar(max),
details varchar(max),
redirecturl varchar(max),
status int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (domainid) REFERENCES HsCms.Hs_domainadmin(id),
FOREIGN KEY (pageid) REFERENCES HsCms.Hs_pages(id),
);