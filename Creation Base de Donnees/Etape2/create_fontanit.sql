CREATE TABLE PORT(
PortId char(1) primary key,
PortName varchar NOT NULL,
Country varchar NOT NULL,
Constraint prt CHECK (PortId IN ('C','Q','S')));

CREATE TABLE PASSENGER(
PassengerId int primary key,
Name varchar NOT NULL,
Sex varchar NOT NULL,
Age int,
Survived boolean,
Pclass int NOT NULL,
PortId char(1),
Constraint cla CHECK (Pclass>=1 AND Pclass<=3),
foreign key (PortId) references PORT(PortId));

CREATE TABLE OCCUPATION(
PassengerId int,
CabinCode varchar,
primary key (PassengerId,CabinCode),
foreign key (PassengerId) references PASSENGER(PassengerId));

CREATE TABLE SERVICE(
PassengerId_Dom int primary key,
PassengerId_Emp int NOT NULL,
Role varchar NOT NULL,
foreign key (PassengerId_Dom) references PASSENGER(PassengerId),
foreign key (PassengerId_Emp) references PASSENGER(PassengerId));

CREATE TABLE CATEGORY(
LifeBoatCat varchar primary key,
Structure varchar NOT NULL CHECK (Structure IN ('bois','bois et toile')),
Places int NOT NULL,
Constraint cat CHECK (LifeBoatCat IN('standard','secours','radeau')));

CREATE TABLE LIFEBOAT(
LifeBoatId varchar primary key,
LifeBoatCat varchar NOT NULL,
Side varchar NOT NULL CHECK (Side IN ('babord','tribord')),
Position varchar NOT NULL CHECK(Position IN('avant','arriere')),
Location varchar NOT NULL DEFAULT 'pont',
Launching_Time Time NOT NULL,
foreign key (LifeBoatCat) references CATEGORY(LifeBoatCat));

CREATE TABLE RECOVERY(
LifeBoatId varchar primary key,
Recovery_Time Time NOT NULL,
foreign key (LifeBoatId) references LIFEBOAT(LifeBoatId));

CREATE TABLE RESCUE(
PassengerId int primary key,
LifeBoatId varchar NOT NULL,
foreign key (PassengerId) references PASSENGER(PassengerId),
foreign key (LifeBoatId) references LIFEBOAT(LifeBoatId));


