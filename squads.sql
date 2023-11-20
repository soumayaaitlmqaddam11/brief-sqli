CREATE DATABASE SQLI;
CREATE TABLE project (
  ProjectID int PRIMARY KEY NOT NULL, 
  ProjectName varchar(255) ,
  Description varchar(255),
  tatDate date , 
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
