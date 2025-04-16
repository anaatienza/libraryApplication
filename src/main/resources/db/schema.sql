DROP DATABASE IF EXISTS library_app;
CREATE DATABASE IF NOT EXISTS library_app;
USE library_app;

CREATE TABLE IF NOT EXISTS Author (
    id INT AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL CHECK(LENGTH(firstName)>=2),
    lastName VARCHAR(100) NOT NULL CHECK(LENGTH(lastName)>=2),
    birthDate DATE,
    nationality VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Editorial (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    website VARCHAR(255) UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Book (
    id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    coverImage VARCHAR(255),
    isbn VARCHAR(13) NOT NULL UNIQUE,
    publicationDate DATE,
    genre ENUM('FICCION', 'NO_FICCION', 'FANTASIA', 'CIENCIA_FICCION', 'MISTERIO', 'ROMANCE', 'TERROR', 'HISTORICO', 'BIOGRAFIA', 'CIENCIA', 'AUTOAYUDA', 'INFANTIL', 'JUVENIL', 'COMICS', 'EDUCACION') NOT NULL,
    totalCopies INT NOT NULL CHECK (totalCopies >= 0),
    authorId INT NOT NULL,
    editorialId INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (authorId) REFERENCES Author(id) ON DELETE CASCADE,
    FOREIGN KEY (editorialId) REFERENCES Editorial(id) ON DELETE CASCADE
);

CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Client (
    id INT,
    nationalId VAR CHAR(20) NOT NULL UNIQUE,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    birthDate DATE NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE CHECK (email LIKE '%@%.%'),
    PRIMARY KEY (id)
);

CREATE TABLE Employee (
    id INT,
    isAdmin BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Loan (
    id INT AUTO_INCREMENT,
    loanDate DATE NOT NULL,
    dueDate DATE NOT NULL CHECK (due_date > loan_date),
    returnDate DATE CHECK (return_date IS NULL OR return_date >= loan_date),
    userId INT NOT NULL,
    bookId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (userId) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (bookId) REFERENCES Book(id) ON DELETE CASCADE
);

