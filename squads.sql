CREATE DATABASE SQLI;
CREATE TABLE project (
  ProjectID int PRIMARY KEY NOT NULL, 
  ProjectName varchar(255) ,
  Description varchar(255),
  startDate date , 
  endDate date 
);
CREATE TABLE category (
    CategoryID int  PRIMARY KEY NOT NULL,
    categoryName varchar(255)
);
CREATE TABLE subcategory(
    SubCategoryID int (11) PRIMARY KEY NOT NULL,
    subcategoryName varchar(255)
);

CREATE TABLE squad(
    SquadID int (11) PRIMARY KEY NOT NULL,
    squadName varchar(255),
    ProjectID int,
    FOREIGN KEY (ProjectID)REFERENCES project(ProjectID)

);
CREATE TABLE utilisateur(
     UserID int  PRIMARY KEY NOT NULL,
     UserName varchar(255),
     email varchar (255),
     SquadId int,
     FOREIGN KEY (SquadID)REFERENCES squad(SquadID) 
);
CREATE TABLE ressource(
    RessoureceID int PRIMARY KEY NOT NULL,
    ressourceName varchar(255),
    ProjectID int,  
    SquadID int,
    CategoryID int,
    SubcategoryID int,
    FOREIGN KEY (ProjectID)REFERENCES project(ProjectID) ,
    FOREIGN KEY (SquadID)REFERENCES squad(SquadID) ,
    FOREIGN KEY (CategoryID)REFERENCES category(CategoryID) ,
    FOREIGN KEY (SubcategoryID)REFERENCES subcategory(SubcategoryID) 
);
INSERT INTO squad (SquadID, squadName)
VALUES (1, 'NomDuSquad');
UPDATE squad
SET squadName = 'Codex'
WHERE squadName= 'NomDuSquad';
INSERT INTO utilisateur (UserID, UserName, email,SquadId)
VALUES 
    (1, 'soumaya','soumaya2000@gmail.com', 1),
    (2, 'wissal','wissal2005@gmail.com', 1),
    (3, 'laila','laila1997@gmail.com', 1);
INSERT INTO project (ProjectID, ProjectName, Description, startDate, endDate)
VALUES (1, 'GestionSquads', 'Description du projet...', '2023-01-01', '2023-12-31');
SELECT project.*
FROM project
JOIN utilisateur ON Project.ProjectID = utilisateur.SquadId;

INSERT INTO category (CategoryID, categoryName)
VALUES (1, 'NomDuCategorie');
INSERT INTO subcategory(SubCategoryID, subcategoryName)
VALUES (1, 'NomDuSubcategorie');
INSERT INTO ressource (RessoureceID,ressourceName,ProjectID,SquadID,CategoryID,SubcategoryID)
VALUES (1,'WayToLearnX',1,1,1,1)
UPDATE utilisateur 
SET UserName='souad',email='souad1981@gmail.com'
WHERE UserID=3;
UPDATE squad
SET ProjectID=1
WHERE SquadID=1;
UPDATE project
set startDate='2023-04-20',endDate='2023-07-15'
WHERE ProjectID=1;
INSERT INTO project (ProjectID, ProjectName, Description, startDate, endDate)
VALUES (2, 'sqli', 'Description du projet sqli...', '2023-09-15', '2025-06-31'),
(3, 'gestion des site ', 'Description du projet ecomerce...', '2020-09-15', '2030-07-03'),
(4, 'gestionHotels ', 'Description du projet gestionHotels...', '2020-02-15', '2030-10-03');
UPDATE project
SET endDate='2025-06-29'
WHERE ProjectID=2;
INSERT INTO subcategory(SubCategoryID, subcategoryName)
VALUES (2, 'NomDuSubcategorie2'),
(3, 'NomDuSubcategorie3'),
(4, 'NomDuSubcategorie4'),
(5, 'NomDuSubcategorie5');
INSERT INTO squad (SquadID, squadName)
VALUES (2, 'Brogrammers'),
(3, 'cell13'),
(4, 'codezella'),
(5, 'alpha'),
(6, 'prodevs');
INSERT INTO category (CategoryID, categoryName)
VALUES (2, 'NomDuCategorie2'),
 (3, 'NomDuCategorie3'),
 (4, 'NomDuCategorie4'),
 (5, 'NomDuCategorie5');
SELECT SUM(RessoureceID*10)
FROM ressource;
SELECT * FROM `project` 
WHERE ProjectName LIKE 's%';
SELECT COUNT(squadName)
FROM squad
WHERE SquadID > 2;
SELECT ressource.RessoureceID, project.ProjectName, ressource.ressourceName
FROM ressource
INNER JOIN project ON ressource.RessoureceID=project.ProjectID;
