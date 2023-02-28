CREATE DATABASE catalogs;

CREATE TABLE item(
    id int NOT NULL PRIMARY KEY,
    author_id int NOT NULL REFERENCES author(id) ON DELETE cascade
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