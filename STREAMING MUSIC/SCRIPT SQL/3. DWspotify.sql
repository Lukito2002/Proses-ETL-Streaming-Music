DROP DATABASE IF EXISTS dwspotify;
CREATE DATABASE IF NOT EXISTS dwspotify;

USE dwspotify;

CREATE TABLE dim_Users (
  User_ID INT PRIMARY KEY,
  Full_Name VARCHAR(255) NOT NULL
);

CREATE TABLE dim_Artists (
  Artist_ID INT PRIMARY KEY,
  Artist_Name VARCHAR(255) NOT NULL,
  Artist_Image VARCHAR(255)
);

CREATE TABLE dim_Albums (
  Album_ID INT PRIMARY KEY,
  Name_Albums VARCHAR(255) NOT NULL,
  Albums_Image VARCHAR(255)
);

CREATE TABLE dim_songs (
  Songs_ID INT PRIMARY KEY,
  Songs_Name VARCHAR(255) NOT NULL,
  Duration TIME NOT NULL,
  Songs_Image VARCHAR(255)
);

CREATE TABLE dim_Playlists (
  Playlist_ID INT PRIMARY KEY,
  Name_Playlist VARCHAR(255) NOT NULL,
  Image VARCHAR(255)
);



CREATE TABLE dim_Playdate (
  Play_Date_ID INT AUTO_INCREMENT PRIMARY KEY,
  `Tanggal` INT,
  Nama_Bulan TINYTEXT,
  Tahun INT
);

CREATE TABLE Fact_Record_Streaming (
  ID_FACT INT,
  User_ID INT,
  Artist_ID INT,
  Album_ID INT,
  Songs_ID INT,
  Playlist_ID INT,
  play_Date_ID INT ,
  playcount INT,
  
  FOREIGN KEY (User_ID) REFERENCES dim_Users(User_ID),
  FOREIGN KEY (Artist_ID) REFERENCES dim_Artists(Artist_ID),
  FOREIGN KEY (Album_ID) REFERENCES dim_Albums(Album_ID),
  FOREIGN KEY (Songs_ID) REFERENCES dim_songs(Songs_ID),
  FOREIGN KEY (Playlist_ID) REFERENCES dim_Playlists(Playlist_ID),
  FOREIGN KEY (Play_Date_ID) REFERENCES dim_Playdate(Play_Date_ID)
);



select * from fact_record_streaming

SELECT COUNT(*) AS total_rows
FROM fact_record_streaming;
