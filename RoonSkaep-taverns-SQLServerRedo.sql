CREATE DATABASE Roon_Skaep_Taverns; 

DROP TABLE IF Exists Taverns, Owners, NPCs, Roles, Locations, Cities, Supplies, Sales, Payment_Recieved, Services, ServiceStatuses, Guests, Guest_Statuses, Levels, Classes, Rooms;

CREATE TABLE Taverns(
    Tavern_Id INT PRIMARY KEY,
    Tavern_Name varchar(250),
    Location_Id INT, 
    Owner_Id INT,
    Floors INT,
    Rooms INT,
    City_Id INT
    /*ALTER TABLE Taverns ADD FOREIGN KEY(Owner_Id) REFERENCES Owners(Owner_Id)
      ALTER TABLE Taverns ADD FOREIGN KEY(Location_Id) REFERENCES Locations(Location_Id)
      ALTER TABLE Taverns ADD FOREIGN KEY(City_Id) REFERENCES Cities(City_Id)
      --ALTER TABLE Taverns ADD FOREIGN KEY(Service_Id) REFERENCES Services(Service_Id), Maybe in another design it should be added*/
);

SELECT * FROM Taverns; 

--Tavern Values
INSERT INTO Taverns(Tavern_Id, Tavern_Name, Location_Id, Owner_Id, Floors, Rooms)

                VALUES(101, 'Jolly Boar Inn', 1, 111, 2, 7),
                      (102, 'Blue Moon Inn', 2, 211, 3, 9),
                      (103, 'Falador Party Room', 3, 311, 4, 14),
                      (104, 'Flying Horse Inn', 4, 411, 2, 7),
                      (105, 'The Pick and Lute', 5, 511, 2, 7);

CREATE TABLE Owners(
    Owner_Id INT PRIMARY KEY,
    Tavern_Id INT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    FOREIGN KEY(Tavern_Id) References Taverns(Tavern_Id)
);

--Owner Values
INSERT INTO Owners(owner_id, tavern_Id, first_name, last_name)

                VALUES(111, 101, 'Varrock', 'Obama'),
                      (211, 102, 'Varrock', 'Obama'),
                      (311, 103, 'Osama.bin', 'Lumbridge'),
                      (411, 104, 'Hagascan', 'Richards'),
                      (511, 105, 'Malnisnid', 'Toad');

SELECT * FROM Owners;

CREATE TABLE NPCs(
    NPC_Id INT PRIMARY KEY,
    First_Name VARCHAR(250),
    Last_Name VARCHAR(250),
    birth_date DATE,
    gender VARCHAR(10) DEFAULT 'not listed',
    Role_Id INT,
    income DECIMAL DEFAULT 0,
    Tavern_Id INT,
    FOREIGN KEY(Tavern_Id) REFERENCES Taverns(Tavern_Id)
    /*ALTER TABLE NPCs ADD FOREIGN KEY(Role_Id) REFERENCES Roles(Role_Id)*/
);

--NPC Values
INSERT INTO NPCs(npc_id, first_name, last_name, birth_date, gender, role_id, income, tavern_id)

                VALUES(1, 'Jonathan', 'Cobbler', '1998-09-27', 'Male', 1, 2000.00, 101),
                      (2, 'Ameth', 'Grodgen', '1999-12-30', 'Female', 2, 2010.00, 101),
                      (3, 'Xiena', 'Bisk', '2000-11-14', 'Female', 3, 1991.00, 101),
                      (4, 'Zendar', 'Nami', '2001-10-18', 'Male', 4, 2100.00, 101),
                      (5, 'Thioh', 'Muay', '2002-09-30', 'Female', 5, 2100.00, 101),
                      (6, 'Pigral', 'Sursk', '1998-09-27', 'Male', 1, 2000.00, 102),
                      (7, 'Yerih', 'Rhamam', '1999-12-30', 'Female', 2, 2010.00, 102),
                      (8, 'Tihni', 'Naz', '2000-11-14', 'Female', 3, 1991.00, 102),
                      (9, 'Orerniz', 'Hurgundol', '2001-10-18', 'Male', 4, 2100.00, 102),
                      (10, 'Zorhe', 'Chestrun', '2002-09-30', 'Female', 5, 2100.00, 102),
                      (11, 'Gravef', 'Div', '1998-09-27', 'Male', 1, 2000.00, 103),
                      (12, 'Xia', 'Paom', '1999-12-30', 'Female', 2, 2010.00, 103),
                      (13, 'Bedv', 'Cirgeza', '2000-11-14', 'Female', 3, 1991.00, 103),
                      (14, 'Vloojarlat', 'Rhaegarlott', '2001-10-18', 'Male', 4, 2100.00, 103),
                      (15, 'Fohrol', 'Hakhad', '2002-09-30', 'Female', 5, 2100.00, 103),
                      (16, 'Gorlis', 'Grodzutra', '1998-09-27', 'Male', 1, 2000.00, 104),
                      (17, 'Sechuh', 'Starblower', '1999-12-30', 'Female', 2, 2010.00, 104),
                      (18, 'Shai', 'Shianong', '2000-11-14', 'Female', 3, 1991.00, 104),
                      (19, 'Medrum', 'Bhokhon', '2001-10-18', 'Male', 4, 2100.00, 104),
                      (20, 'Veirtm', 'Goganer', '2002-09-30', 'Female', 5, 2100.00, 104),
                      (21, 'Haldul', 'Caskwoods', '1998-09-27', 'Male', 1, 2000.00, 105),
                      (22, 'Tai', 'Na', '1999-12-30', 'Female', 2, 2010.00, 105),
                      (23, 'Sona', 'Marlblebinder', '2000-11-14', 'Female', 3, 1991.00, 105),
                      (24, 'Cheadral', 'Cestiscus', '2001-10-18', 'Male', 4, 2100.00, 105),
                      (25, 'Cisha', 'Clankeep', '2002-09-30', 'Female', 5, 2100.00, 105);

SELECT * FROM NPCs; 

CREATE TABLE Roles(
    Role_Id INT,
    Role_Name VARCHAR(50) DEFAULT 'tavern keeper',
    Role_Description VARCHAR(250) DEFAULT 'tends to the tavern.',
    PRIMARY KEY(Role_Id, Role_Name, Role_Description)
);

-- Roles Values
INSERT INTO Roles(Role_Id, Role_Name, Role_Description)

            VALUES(1, 'bartender', 'serves drinks, takes, orders, maintains premises'),
                  (2, 'cook', 'prepare food, learns receipts, delivers food') ,
                  (3, 'bard', 'sings songs, performs jokes, records history'),
                  (4, 'merchant', 'sells goods, brokers or provides services, acts as clearing house'),
                  (5, 'clerk', 'logs room rentals, maintains premises, bookeeping, performs maintanence');

SELECT * FROM Roles; 

CREATE TABLE Locations(
    Location_Id INT PRIMARY KEY,
    Tavern_Name varchar(250)
);

INSERT INTO Locations(Location_Id, Tavern_Name)

            VALUES(1, 'Jolly Boar Inn'),
                  (2, 'Blue Moon Inn'),
                  (3, 'Falador Party Room'),
                  (4, 'Flying Horse Inn'),
                  (5, 'The Pick and Lute');

SELECT * FROM Locations; 

CREATE TABLE Cities(
    City_Id INT PRIMARY KEY,
    City_Name VARCHAR(40),
    Location_Id INT,
    FOREIGN KEY(Location_Id) REFERENCES Locations(Location_Id)
);

INSERT INTO Cities(City_Id, City_Name, Location_id)

            VALUES(1, 'Varrock', 1),
                  (2, 'Varrock', 2),
                  (3, 'Falador', 3),
                  (4, 'East Ardougne', 4),
                  (5, 'Taverly', 5);

SELECT * FROM Cities;

CREATE TABLE Supplies(
    Supply_Id INT PRIMARY KEY,
    Supply_Name VARCHAR(250),
    Date_Purchased DATE,
    Tavern_Id INT,
    Supply_Cost INT,
    FOREIGN KEY(Tavern_Id) References Taverns(Tavern_Id)
);

INSERT INTO Supplies(Supply_Id, Supply_Name, Date_Purchased, Tavern_Id, Supply_Cost)

            VALUES(1, 'Ale', '2002-11-09', 101, 460.00),
                  (2, 'Smithing Kit', '2002-12-04', 102, 300.00),
                  (3, 'Coal Ore', '2002-12-14', 103, 2000.00),
                  (4, 'Groceries', '2003-01-15', 104, 5000.00),
                  (5, 'Linens', '2003-02-01', 105, 200.00),
                  (6, 'Cleaning Wares', '2004-04-15', 101, 50.00),
                  (7, 'Leather', '2005-11-09', 101, 200.00),
                  (8, 'Runes', '2005-12-04', 101, 100.00),
                  (9, 'Hatchets', '2002-12-14', 101, 200.00),
                  (10, 'Groceries', '2006-01-15', 102, 5000.00),
                  (11, 'Linens', '2006-02-01', 102, 200.00);

SELECT * FROM Supplies; 

CREATE TABLE Guests(
    Guest_Id INT PRIMARY KEY,
    Guest_Name VARCHAR(250),
    Guest_Notes VARCHAR(250),
    Status_Name VARCHAR(20) DEFAULT 'Unknown.',
    Birthday DATE,
    CakeDay DATE,
    Status_Id INT,
    Level_Id INT,
    Class_Id INT
    /*ALTER TABLE Guests ADD FOREIGN KEY(Status_Id) REFERENCES GuestStatuses(Status_Id) */
    /*ALTER TABLE Guests ADD FOREIGN KEY(Class_Id) REFERENCES Levels(Guest_Id) */
);

INSERT INTO Guests(Guest_Id, Guest_Name, Guest_Notes, Status_Name, Birthday, CakeDay, Status_Id, Level_Id, Class_Id)

            VALUES(1, 'Rahllkath', 'From a far away land', 'sick', '2005-01-22', '2006-01-01', 1, 20, 2),
                  (2, 'JusticeZero', 'From Lumbridge', 'fine', '2004-08-22', '2006-01-01', 2, 86, 5),
                  (3, 'Yimer', 'From Lumbridge', 'hangry', '2004-08-22', '2006-01-01', 3, 61, 3),
                  (4, 'Brunthorpe', 'From Tutorial Island', 'placid', '2004-08-22', '2006-01-01', 4, 32, 1),
                  (5, 'Dagnurgen', 'From Falador', 'hydrated', '2004-08-22', '2006-01-01', 5, 32, 1),
                  (6, 'Lardar', 'From a far away land', 'cool', '2004-08-22', '2006-01-01', 6, 47, 4),
                  (7, 'Golribul', 'From Falador', 'cool', '2005-08-22', '2006-01-01', 6, 20, 1),
                  (8, 'Zavigad', 'From Falador', 'hangry', '2005-08-22', '2006-01-01', 3, 3, 2),
                  (9, 'Bobronkun', 'From Falador', 'fine', '2005-09-22', '2006-01-01', 2, 11, 2),
                  (10, 'Lenuknil', 'From Taverly', 'hydrated', '2005-09-22', '2006-01-01', 5, 12, 4),
                  (11, 'Belnelban', 'From Taverly', 'hydrated', '2005-08-22', '2006-01-01', 5, 20, 3),
                  (12, 'Zavelbam', 'From Taverly', 'sick', '2004-08-22', '2006-01-01', 1, 2, 3),
                  (13, 'Shalralah', 'From Taverly', 'fine', '2006-08-22', '2006-01-01', 2, 8, 4),
                  (14, 'Alrohlel', 'From Taverly', 'hydrated', '2006-08-22', '2006-01-01', 5, 17, 1),
                  (15, 'Erictal', 'From Taverly', 'placid', '2006-09-22', '2006-01-01', 4, 34, 1),
                  (16, 'Zezima', 'From Tutorial Island', 'placid', '1999-09-22', '2006-01-01', 4, 126, 5),
                  (17, 'Helvomos', 'From Burthorpe', 'sick', '2006-09-22', '2006-01-01', 1, 52, 4),
                  (18, 'Zozzoshel', 'From Burthorpe', 'cool', '2008-08-22', '2006-01-01', 6, 8, 3),
                  (19, 'Elrorvah', 'From Burthorpe', 'sick', '2008-09-22', '2006-01-01', 1, 3, 1),
                  (20, 'Ovopil', 'From Burthorpe', 'hangry', '2008-09-22', '2006-01-01', 3, 13, 3),
                  (21, 'Shinalma', 'From Burthorpe', 'cool', '2008-08-22', '2006-01-01', 6, 20, 4),
                  (22, 'Manzarval', 'From Burthorpe', 'placid', '2008-08-22', '2006-01-01', 4, 21, 2),
                  (23, 'Virrasol', 'From Burthorpe', 'hangry', '2008-08-22', '2006-01-01', 3, 29, 2);

SELECT * FROM Guests;

DROP TABLE IF EXISTS Payments_Recieved; 

CREATE TABLE Payments_Recieved(
    Payment_Recieved_Id INT PRIMARY KEY,
    Date_Recieved Date, 
    Amount_Recieved DECIMAL(18, 2),
    Service_Name VARCHAR(250),
    Service_Id INT,
    Tavern_id INT,
    Guest_Id INT,
    
    /*ALTER TABLE Payments_Recieved ADD FOREIGN KEY(Service_Id) REFERENCES Sales(Sale_Id)--ask why it didn't work*/
    FOREIGN KEY(Tavern_Id) REFERENCES Taverns(Tavern_Id),
    FOREIGN KEY(Guest_Id) REFERENCES Guests(Guest_Id)
);

INSERT INTO Payments_Recieved(Payment_Recieved_Id, Date_Recieved, Amount_Recieved, Service_Name, Service_Id, Tavern_Id, Guest_Id)

            VALUES(1, '2007-12-30', 20.00, 'Food & Beverage', 1, 101, 3),
                  (2, '2007-12-31', 10000.00, 'Equipment Smithing & Crafting', 2, 101, 16),
                  (3, '2008-01-21', 40.00, 'Room Rentals', 3, 101, 5),
                  (4, '2008-02-15', 160.00, 'Room Rentals', 3, 103, 21),
                  (5, '2008-03-10', 40.00, 'Room Rentals', 3, 101, 2),
                  (6, '2008-04-13', 90.00, 'Wares', 5, 101, 10),
                  (7, '2008-01-21', 110.00, 'Wares', 5, 101, 3),
                  (8, '2008-02-15', 5070.00, 'Equipment Smithing & Crafting', 2, 101, 16),
                  (9, '2008-03-10', 110.00, 'Room Rentals', 3, 103, 23),
                  (10, '2008-04-13', 110.00, 'Room Rentals', 3, 103, 18),
                  (11, '2008-01-21', 160.00, 'Room Rentals', 3, 103, 14),
                  (12, '2008-02-15', 390.00, 'Wares', 5, 101, 11),
                  (13, '2008-03-03', 40.00, 'Room Rentals', 3, 101, 23),
                  (14, '2008-04-13', 590.00, 'Wares', 2, 101, 10);

SELECT * FROM Payments_Recieved;

DROP TABLE IF EXISTS Sales; 

CREATE TABLE Sales(
    Sale_Id INT Primary KEY,
    Service_Id INT,
    Guest_Id INT,
    Price DECIMAL(18, 2),
    Sale_Date DATE,
    Sale_Amount DECIMAL(18, 2),
    Tavern_Id INT,
    FOREIGN KEY(Service_Id) REFERENCES Payments_Recieved(Payment_Recieved_Id)
    /*ALTER TABLE Sales ADD FOREIGN KEY(Sale_Amount) REFERENCES Payments_Recieved(Amount_Recieved)-ask why it didn't work 

                                                        -- Ask if there is a way to make 
                                                        a decimal a Primary Key or even
                                                        part of a composite key.*/
);

INSERT INTO Sales(Sale_Id, Service_Id, Guest_Id, Price, Sale_Date, Sale_Amount, Tavern_Id)

        VALUES(1, 1, 3, 20.00, '2007-12-30', 20.00, 101),
              (2, 2, 16, 12000.00, '2007-12-30', 10000.00, 101),
              (3, 3, 5, 40.00, '2008-01-21', 40.00, 101),
              (4, 3, 21, 160.00, '2008-02-15', 160.00, 103),
              (5, 3, 2, 40.00, '2008-03-10', 40.00, 101),
              (6, 5, 10, 90.00, '2008-04-13', 90.00, 101),
              (7, 5, 3, 110.00, '2007-12-30', 110.00, 101),
              (8, 2, 16, 5070.00, '2007-12-30', 5070.00, 101),
              (9, 3, 23, 110.00, '2008-01-21', 110.00, 103),
              (10, 3, 18, 110.00, '2008-02-15', 110.00, 103),
              (11, 3, 14, 160.00, '2008-03-10', 160.00, 103),
              (12, 5, 11, 390.00, '2008-04-13', 390.00, 101),
              (13, 5, 23, 2240.00, '2008-03-10', 2240.00, 101),
              (14, 2, 10, 590.00, '2008-04-13', 590.00, 101);

SELECT * FROM Sales; 

CREATE TABLE ServiceStatuses(
    Status_Id INT PRIMARY KEY,
    Service_Name VARCHAR(250),
    Status_Name VARCHAR(10)
);

INSERT INTO ServiceStatuses(Status_Id, Service_Name, Status_Name)

            VALUES(1, 'Rune Crafting', 'InActive'),
                  (2, 'Team Rostering', 'InActive'),
                  (3, 'Quick Travel', 'InActive'),
                  (4, 'Food & Beverage', 'Active'),
                  (5, 'Equipment Smithing & Crafting', 'Active'),
                  (6, 'Room Rentals', 'Active'),
                  (7, 'Quest/Job Board', 'Active'),
                  (8, 'Wares', 'Active');

SELECT * FROM ServiceStatuses; 

CREATE TABLE Services(
    Service_Id INT,
    Service_Name VARCHAR(250),
    Status_Id INT,
    Tavern_Id INT,
    PRIMARY KEY(Service_Id, Status_Id),
    FOREIGN KEY(Status_Id) REFERENCES ServiceStatuses(Status_Id)
);

INSERT INTO Services(Service_Id, Service_Name, Status_Id)

            VALUES(1, 'Food & Beverage', 4),
                  (2, 'Equipment Smithing & Crafting', 5),
                  (3, 'Room Rentals', 6),
                  (4, 'Quest/Job Board', 7),
                  (5, 'Wares', 8),
                  (6, 'Rune Crafting', 1),
                  (7, 'Team Rostering', 2),
                  (8, 'Quick Travel', 3);

SELECT * FROM Services; 

CREATE TABLE GuestStatuses(
    Status_Id INT,
    Status_Name VARCHAR(50),
    Guest_Id INT PRIMARY KEY,
    FOREIGN KEY(Status_Id) REFERENCES Guests(Guest_Id)
);

INSERT INTO GuestStatuses(Status_Id, Status_Name, Guest_Id)

            VALUES(1, 'sick', 1),
                  (2, 'fine', 2),
                  (3, 'hangry', 3),
                  (4, 'placid', 4),
                  (5, 'hydrated', 5),
                  (6, 'cool', 6),
                  (6, 'cool', 7),
                  (3, 'hangry', 8),
                  (2, 'fine', 9),
                  (5, 'hydrated', 10),
                  (5, 'hydrated', 11),
                  (1, 'sick', 12),
                  (2, 'fine', 13),
                  (5, 'hydrated', 14),
                  (4, 'placid', 15),
                  (4, 'placid', 16),
                  (1, 'sick', 17),
                  (6, 'cool', 18),
                  (1, 'sick', 19),
                  (3, 'hangry', 20),
                  (6, 'cool', 21),
                  (4, 'placid', 22),
                  (3, 'hangry', 23);

SELECT * FROM GuestStatuses; 

CREATE TABLE Classes(
    Class_Id INT,
    Class_Name VARCHAR(50),
    Guest_Id INT,
    PRIMARY KEY(Guest_Id, Class_Name),
    FOREIGN KEY(Class_Id) REFERENCES Guests(Guest_Id)
);

INSERT INTO Classes(Class_Id, Class_Name, Guest_Id)

            VALUES(1, 'Artisan', 7),
                  (2, 'Warrior', 1),
                  (3, 'Ranger', 3),
                  (4, 'Mage', 17),
                  (5, 'PolyMath', 2),
                  (1, 'Artisan', 4),
                  (2, 'Warrior', 22),
                  (3, 'Ranger', 20),
                  (4, 'Mage', 13),
                  (5, 'PolyMath', 16),
                  (1, 'Artisan', 15),
                  (2, 'Warrior', 8),
                  (3, 'Ranger', 11),
                  (4, 'Mage', 6),
                  (1, 'Artisan', 5),
                  (2, 'Warrior', 9),
                  (3, 'Ranger', 12),
                  (4, 'Mage', 10),
                  (1, 'Artisan', 14),
                  (2, 'Warrior', 23),
                  (3, 'Ranger', 18),
                  (4, 'Mage', 21),
                  (1, 'Artisan', 19);


SELECT * FROM Classes;

CREATE TABLE Levels(
    Guest_Id INT PRIMARY KEY,
    Level_Id INT,
    Class_Id INT,
    level_Date DATE,
    /*ALTER TABLE Levels ADD FOREIGN KEY(level_Id) REFERENCES Guests(Guest_Id)-- this didn't work */
    /*ALTER TABLE Levels ADD FOREIGN KEY(Class_Id) REFERENCES Guests(Guest_Id)  */
);

INSERT INTO Levels(Level_Id, Guest_Id, Class_Id, Level_Date)

            VALUES(20, 1, 2, '2006-01-22'),
                  (86, 2, 5, '2005-08-22'),
                  (61, 3, 3, '2005-08-22'),
                  (32, 4, 1, '2005-08-22'),
                  (32, 5, 1, '2005-08-22'),
                  (47, 6, 4, '2005-08-22'),
                  (20, 7, 1, '2007-01-01'),
                  (3, 8, 2, '2007-01-01'),
                  (11, 9, 2, '2007-01-01'),
                  (12, 10, 4, '2007-01-01'),
                  (20, 11, 3, '2007-01-01'),
                  (2, 12, 3, '2007-01-01'),
                  (8, 13, 4, '2007-01-01'),
                  (17, 14, 1, '2007-01-01'),
                  (34, 15, 1, '2007-09-22'),
                  (126, 16, 5, '1999-09-22'),
                  (52, 17, 4, '2007-09-22'),
                  (8, 18, 3, '2009-08-22'),
                  (3, 19, 1, '2009-09-22'),
                  (13, 20, 3, '2009-09-22'),
                  (20, 21, 4, '2009-09-22'),
                  (21, 22, 2, '2009-09-22'),
                  (29, 23, 2, '2009-09-22');

SELECT * FROM Levels; 

CREATE TABLE Rooms(
    Room_Id INT,
    Tavern_Id INT,
    Room_Status VARCHAR(10),
    Floor INT,
    Guest_Name VARCHAR(250),
    Guest_Id INT,
    Room_Rate DECIMAL,
    Date_Occupied DATE, 
    Sale_Id INT,
    PRIMARY KEY(Guest_Id, Tavern_Id),
    
    /*FOREIGN KEY(Date_Occupied) ADD REFERENCES Sales(Sale_Date), Is it possile to set Foreign keys as Dates and to 
    have a primary key as anything but an INT*/

    /*ALTER TABLE Sales ADD FOREIGN KEY(Tavern_Id) REFERENCES Rooms(Room_Id)*/
    FOREIGN KEY(Room_Id) REFERENCES Guests(Guest_Id) 
);

INSERT INTO Rooms(Room_Id, Tavern_Id, Room_Status, Floor, Guest_Name, Guest_Id, Room_Rate, Date_Occupied, Sale_Id)

        VALUES(01, 101, 'Occupied', 2, 'Dagnurgen', 5, 40.00, '2008-01-21', 3),
              (02, 101, 'Occupied', 2, 'JusticeZero', 2, 40.00, '2008-03-10', 5),
              (01, 301, 'Occupied', 3, 'Shinalma', 21, 160.00, '2008-02-15', 4),
              (02, 301, 'Occupied', 2, 'Virrasol', 23, 110.00, '2008-03-10', 9),
              (03, 301, 'Occupied', 2, 'Shalralah', 18, 110.00, '2008-04-13', 10),
              (04, 301, 'Occupied', 3, 'Alrohlel', 14, 160.00, '2008-01-21', 11);

SELECT * FROM Rooms;

/*
#9. Insert column values into another table.

INSERT INTO Owners(owner_id, tavern_Id, first_name, last_name)
Service_Id INT,
    Service_Name VARCHAR(250),
    Status_Id INT,
    Tavern_Id INT

	CREATE TABLE Locations(
    Location_Id INT PRIMARY KEY,
    Tavern_Name varchar(250)
);

INSERT INTO Locations(location_id, tavern_name) SELECT owner_id, first_name FROM Owners; --It worked
SELECT * FROM Locations; 

#8. Create a column with Guest Classes and levels then use a CONCAT statement to join two columns together, the second column has their level grouping.

SELECT CONCAT('Class: ', class_Id, ' ', 'Level: ', Level_Id)  
AS 'Levels 1-30' FROM Levels 
WHERE Level_Id BETWEEN 1 AND 30
ORDER BY Level_Id ASC;

SELECT CONCAT('Class: ', class_Id, ' ', 'Level: ', Level_Id)  
AS 'Levels 31-31' FROM Levels 
WHERE Level_Id BETWEEN 31 AND 60
ORDER BY Level_Id ASC;

SELECT CONCAT('Class: ', class_Id, ' ', 'Level: ', Level_Id)  
AS 'Levels 61-126' FROM Levels 
WHERE Level_Id BETWEEN 61 AND 126
ORDER BY Level_Id ASC;

2. SELECT * FROM Guests WHERE Birthday < '2000-01-01';
3. SELECT Rooms.Room_Rate, Rooms.Tavern_Id, Rooms.Room_Id FROM Rooms WHERE Rooms.Room_Rate >= 100.00; 
    SELECT Guest_Name FROM Guests; 
    SELECT Guest_Name FROM Guests WHERE Guest_Name = 'JusticeZero';
4. SELECT Guests.Guest_Name FROM Guests ORDER BY Guest_Name;
5. SELECT Guests.Guest_Name FROM Guests ORDER BY Guest_Name ASC;
    SELECT Guests.Guest_Name FROM Guests ORDER BY Guest_Name DESC;
    DESCRIBE Guests;
    DESCRIBE Rooms;
6.  SELECT * FROM Sales ORDER BY Price LIMIT 10; 
    SELECT Top 10 FROM Sales.Price; 
7.  SELECT Tavern_Name FROM Taverns
    UNION
    SELECT First_Name FROM Owners
    UNION 
    SELECT First_name FROM NPCs
    UNION
    SELECT Role_Name FROM Roles
    UNION
    SELECT Tavern_name FROM Locations
    UNION
    SELECT City_Name FROM Cities
    UNION
    SELECT Supply_Name FROM Supplies
    UNION 
    SELECT Sale_Amount FROM Sales
    UNION
    SELECT Amount_Recieved FROM Payments_Recieved
    UNION
    SELECT Guest_Name FROM Guests
    UNION
    SELECT Status_Name FROM GuestStatuses
    UNION
    SELECT Level_Id FROM Levels
    UNION
    SELECT Class_Name FROM Classes
    UNION 
    SELECT Guest_Name FROM Rooms; 

*/
              
