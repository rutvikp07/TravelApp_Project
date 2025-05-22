create database if not exists `travelsdb`;

USE `travelsdb`;

/*Table structure for table `busmaster` */

DROP TABLE IF EXISTS `busmaster`;

CREATE TABLE `busmaster` (
  `BusId` varchar(20) NOT NULL default '',
  `BusType` varchar(50) default NULL,
  `BusNumber` varchar(20) default NULL,
  `Capacity` int(3) default '0',
  `TravelsId` varchar(20) default NULL
);

/*Data for the table `busmaster` */

insert  into `busmaster`(`BusId`,`BusType`,`BusNumber`,`Capacity`,`TravelsId`) 
values ('B3','Sleeper','AP 12 222',40,'T2'),('B4','Sleeper','AP 1900',40,'T3'),('B5','AC','AP 34322',40,'T3'),('B6','AC','AP 1981',40,'T2'),('B1','NonAC','1',40,'T2');

/*Table structure for table `customermaster` */

DROP TABLE IF EXISTS `customermaster`;

CREATE TABLE `customermaster` (
  `CustomerId` varchar(20) NOT NULL default '',
  `CustomerName` varchar(80) NOT NULL default '',
  `PhoneNumber` varchar(20) default NULL,
  `Address` tinytext NOT NULL,
  `Location` varchar(80) NOT NULL default '',
  `email` varchar(80) default NULL,
  `Gender` varchar(10) default NULL
);

/*Table structure for table `ticketdetails` */

DROP TABLE IF EXISTS `ticketdetails`;

CREATE TABLE `ticketdetails` (
  `TicketId` varchar(20) NOT NULL default '',
  `RouteId` varchar(20) NOT NULL default '',
  `CustomerId` varchar(20) NOT NULL default '',
  `rFrom` varchar(50) default NULL,
  `rTo` varchar(50) default NULL,
  `JourneyDate` date NOT NULL default '1000-01-01',
  `StartTime` time default NULL,
  `ReachTime` time default NULL,
  `Seats` varchar(255) default NULL,
  `BoardingPoint` varchar(50) default NULL,
  `NetAmount` int(10) default NULL,
  `Status` varchar(20) default NULL,
  `PaymentId` varchar(20) default NULL,
  `BusId` varchar(20) default NULL,
  PRIMARY KEY  (`TicketId`)
);

/*Data for the table `ticketdetails` */

insert  into `ticketdetails`(`TicketId`,`RouteId`,`CustomerId`,`rFrom`,`rTo`,`JourneyDate`,`StartTime`,`ReachTime`,`Seats`,`BoardingPoint`,`NetAmount`,`Status`,`PaymentId`,`BusId`) 
values ('T-3','R1','C1','London','Dundas','2009-07-25','11:00:00','23:00:00','A6','Fanshawe',350,'Booked','P1','B1');

/*Data for the table `customermaster` */

insert  into `customermaster`(`CustomerId`,`CustomerName`,`PhoneNumber`,`Address`,`Location`,`email`,`Gender`) values
 ('C2','Alex','6135550120','Dundas','London','alex@gmail.com','Male'),
 ('C3','Raj', '6135550120','Scarborough','Toronto','Raj001@yahoo.com','Male'),
 ('C4','Tom','9440944000','Hamilton','Ontario','Tom@gmail.com','Male'),
 ('C5','Nancy','9999999999','Montreal','Quebec','Nancy@hotmail.com','Female'),
 ('C6','Ruth','9290125200','Kingston','Ontario','Ruth@zapakmail.com','Female');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `FId` int(10) NOT NULL auto_increment,
  `UserID` varchar(100) default NULL,
  `Feedback` text,
  `DateSubmitted` date default NULL,
  PRIMARY KEY  (`FId`)
);

/*Data for the table `feedback` */

insert  into `feedback`(`FId`,`UserID`,`Feedback`,`DateSubmitted`) values 
(1,'Tester@gmail.com','Great job. The booking process was efficient','2024-01-10'),
(2,'smith@gmail.com','Good website. Services are superb. ','2023-12-24');


/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` varchar(20) NOT NULL default '',
  `password` varchar(20) NOT NULL default '',
  `auth` int(5) default NULL,
  PRIMARY KEY  (`userid`)
);

/*Data for the table `login` */

insert  into `login`(`userid`,`password`,`auth`) values 
('admin','admin',0),
('test','test',0);


CREATE TABLE userlogin (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);


/*Data for the table `login` */

insert  into `userlogin`(`username`,`password`) values 
('capstone','info6068');

/*Table structure for table `paymentdetails` */

DROP TABLE IF EXISTS `paymentdetails`;

CREATE TABLE `paymentdetails` (
  `PaymentId` varchar(20) default NULL,
  `CustomerId` varchar(20) default NULL,
  `PaymentMode` varchar(25) default NULL,
  `BankName` varchar(30) default NULL,
  `CardNo` varchar(25) default NULL,
  `NetAmount` int(10) default NULL,
  `PaymentStatus` varchar(20) default NULL,
  `TicketId` varchar(20) default NULL
);

/*Data for the table `paymentdetails` */

insert  into `paymentdetails`(`PaymentId`,`CustomerId`,`PaymentMode`,`BankName`,`CardNo`,`NetAmount`,`PaymentStatus`,`TicketId`)
 values ('P1','C5','Credit','ICICI','4565456456454565',2600,'Made',''),
 ('P2','C6','Credit','ICICI','9909990999099909',1950,'Made','T-8'),
 ('P1','C1','Credit','Axis','1234567890123456',350,'Made','T-3'),
 ('P1','C1','Credit','sbi','1234567890123456',450,'Made','T-1'),
 ('P1','C1','Credit','sbi','1234567890123456',450,'Made','T-1'),
 ('P1','C1','Credit','SBI','1234567890987634',700,'Made','T-9');

/*Table structure for table `routemap` */

DROP TABLE IF EXISTS `routemap`;

CREATE TABLE `routemap` (
  `RouteId` varchar(20) NOT NULL default '',
  `PickupPoint` varchar(50) NOT NULL default '',
  `Fare` int(3) default '0',
  PRIMARY KEY  (`RouteId`,`PickupPoint`)
);

/*Data for the table `routemap` */

insert  into `routemap`(`RouteId`,`PickupPoint`,`Fare`)
 values ('R1','Downtown',0),('R1','RobertQueue',0),('R1','Fanshawe',0),('R2','Western',0),('R2','Hospital',0),
 ('R2','Dorval',0),('R3','Guy',0),('R9','Central',0),('R9','Whiteoaks',0),('R9','King',0),('R9','Richmond',0),
 ('R9','Fanshawe',0),('R5','Masonville',0),('R2','HydePark',0),('R3','Castlegrove',0),('R1','Springbank',0);

/*Table structure for table `routemaster` */

DROP TABLE IF EXISTS `routemaster`;

CREATE TABLE `routemaster` (
  `RouteId` varchar(20) NOT NULL default '',
  `rFrom` varchar(50) NOT NULL default '',
  `rTo` varchar(50) NOT NULL default '',
  `TravelsId` varchar(20) NOT NULL default '',
  `BusId` varchar(20) NOT NULL default '',
  `Departure` time default NULL,
  `Arrival` time default NULL,
  `Fare` int(10) NOT NULL default '0',
  `JDate` date default NULL,
  `Availability` int(3) default NULL
);

/*Data for the table `routemaster` */

insert  into `routemaster`(`RouteId`,`rFrom`,`rTo`,`TravelsId`,`BusId`,`Departure`,`Arrival`,`Fare`,`JDate`,`Availability`)
 values ('R2','London','Toronto','T2','B3','21:00:00','09:00:00',600,'2024-02-27',37),
 ('R3','London','Montreal','T3','B3','21:00:00','09:00:00',600,'2024-01-31',40),
 ('R4','London','Kingston','T1','B1','19:00:00','08:00:00',450,'2024-02-20',40),
 ('R5','London','Naigra','T1','B2','18:00:00','19:00:00',450,'2024-01-15',40),
 ('R6','London','Ottawa','T2','B3','08:00:00','08:30:00',600,'2024-04-27',40),
 ('R7','Montreal','Cornwall','T2','B3','11:00:00','19:00:00',234,'2024-05-16',40),
 ('R8','Toronto','Windsor','T2','B3','11:00:00','19:00:00',234,'2024-11-27',40),
 ('R1','Toronto','Woodstock','T2','B1','11:00:00','23:00:00',350,'2024-07-25',37);



/*Table structure for table `travelsmaster` */

DROP TABLE IF EXISTS `travelsmaster`;

CREATE TABLE `travelsmaster` (
  `TravelsId` varchar(20) NOT NULL default '',
  `Travels` varchar(80) default NULL,
  `Location` varchar(80) default NULL,
  `Address` tinytext,
  `AgentName` varchar(80) default NULL,
  `PhoneNumber` varchar(20) default NULL,
  PRIMARY KEY  (`TravelsId`)
);

/*Data for the table `travelsmaster` */

insert  into `travelsmaster`(`TravelsId`,`Travels`,`Location`,`Address`,`AgentName`,`PhoneNumber`)
 values ('T2','Travel Express','Toronto','TrainStation','Alex','9298892222'),
 ('T3','Expert Travels','London','Lower Tankbund','Jarett','98989898980'),
 ('T1','Bon Travail','London','Woodstock','Oliver','9885148211'),
 ('T4','Convenience','London','ap','sai','9885148211');


