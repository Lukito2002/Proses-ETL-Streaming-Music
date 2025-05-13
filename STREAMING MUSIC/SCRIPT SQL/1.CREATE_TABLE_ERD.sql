DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;

CREATE TABLE Country_User(
  CountryUser_ID INT AUTO_INCREMENT PRIMARY KEY,
  CountryUser_Name VARCHAR(255) NOT NULL
);

CREATE TABLE City_User (
  City_ID INT AUTO_INCREMENT PRIMARY KEY,
  Country_ID INT,
  City_Name VARCHAR(255) NOT null,
  FOREIGN KEY (Country_ID) REFERENCES Country_User(CountryUser_ID)
);

CREATE TABLE Address_User (
  Address_ID INT AUTO_INCREMENT PRIMARY KEY,
  City_ID INT,
  Address_Name VARCHAR(255) NOT NULL,
  Postal_Code VARCHAR(255) NOT null,
  FOREIGN KEY (City_ID) REFERENCES City_User(City_ID)
);

CREATE TABLE Users (
  User_ID INT AUTO_INCREMENT PRIMARY KEY,
  First_Name VARCHAR(255) NOT NULL,
  Last_Name VARCHAR(255),
  Address_ID INT NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE,
  Password VARCHAR(255) NOT NULL,
  Date_of_Birth DATE,
  user_Image BLOB,
  FOREIGN KEY (Address_ID) REFERENCES Address_User(Address_ID)
);

CREATE TABLE Country_Artist (
  CountryArtist_ID INT AUTO_INCREMENT PRIMARY KEY,
  CountryArtist_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Artists (
  Artist_ID INT AUTO_INCREMENT PRIMARY KEY,
  Artist_Name VARCHAR(255) NOT NULL,
  CountryArtist_ID INT,  
  Genre VARCHAR(255),
  Artist_Image VARCHAR(255),
  FOREIGN KEY (CountryArtist_ID) REFERENCES Country_Artist(CountryArtist_ID)
);

CREATE TABLE Albums (
  Album_ID INT AUTO_INCREMENT PRIMARY KEY,
  Artist_ID INT,
  Name_Albums VARCHAR(255) NOT NULL,
  Release_Date DATE,
  Albums_Image VARCHAR(255),
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);

CREATE TABLE Songs (
  Songs_ID INT AUTO_INCREMENT PRIMARY KEY,
  Album_ID INT,
  Songs_Name VARCHAR(255) NOT NULL,
  Duration 	TIME  NOT NULL,
  Songs_Image VARCHAR(255),
  Path VARCHAR(255),
  FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID)
);


CREATE TABLE Playlists (
  Playlist_ID INT AUTO_INCREMENT PRIMARY KEY,
  User_ID INT,
  Name_Playlist VARCHAR(255) NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Playlist_Songs (
  Playlist_ID INT,
  Songs_ID INT,
  `Order` INT,  
  PRIMARY KEY (Playlist_ID, Songs_ID),
  FOREIGN KEY (Playlist_ID) REFERENCES Playlists(Playlist_ID),
  FOREIGN KEY (Songs_ID) REFERENCES Songs(Songs_ID)
);

CREATE TABLE Playdate (
  User_ID INT,
  Songs_ID INT,
  Play_Date_ID INT AUTO_INCREMENT PRIMARY KEY ,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Songs_ID) REFERENCES Songs(Songs_ID)
);


CREATE TABLE Play_date_detail(
	Play_Date_ID INT AUTO_INCREMENT PRIMARY KEY,
	Play_Date DATE,
    Play_Count INTEGER,
	FOREIGN KEY (Play_Date_ID) REFERENCES Playdate (Play_Date_ID)

);




