CREATE DATABASE catalogs;

CREATE TABLE item(
    id int NOT NULL PRIMARY KEY,
    author_id int NOT NULL REFERENCES author(id) ON DELETE cascade,
    genre VARCHAR(255) NOT NULL,
    source VARCHAR(255) NOT NULL,
    label_id INTEGER REFERENCES labels(id) ON DELETE CASCADE,
    publish_date DATE,
    archived BOOL
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

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL
);

CREATE TABLE books (
  id INTEGER REFERENCES item(id) PRIMARY KEY,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL,
  FOREIGN KEY (id) REFERENCES item(id) ON DELETE CASCADE
);