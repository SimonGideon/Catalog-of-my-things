CREATE DATABASE catalogs;

CREATE TABLE item(
    id int NOT NULL PRIMARY KEY,
    author_id int NOT NULL REFERENCES author(id) ON DELETE cascade
    genre_id int NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
);

CREATE TABLE game(
    id int NOT NULL PRIMARY KEY,
    multiplayer boolean,
    last_played_at date
);

CREATE TABLE author(
    id INT NOT NULL PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50)
);

CREATE TABLE genre(
    genre_id INT IDENTITY(1,1) PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE music_album(
    album_id INT IDENTITY(1,1) PRIMARY KEY,
    on_spotify boolean,
);