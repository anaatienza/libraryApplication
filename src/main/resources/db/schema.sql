DROP DATABASE IF EXISTS library_app;
CREATE DATABASE IF NOT EXISTS library_app;
USE library_app;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    national_id VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE author (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50),
    biography VARCHAR(1000)
);

CREATE TABLE genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE editorial (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    website VARCHAR(100)
);

CREATE TABLE book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    cover_image VARCHAR(255),
    sinopsis VARCHAR(1500),
    number_pages INT,
    publication_date DATE,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    editorial_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (editorial_id) REFERENCES editorial(id)
);

CREATE TABLE loan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);