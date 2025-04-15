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
    name VARCHAR(150) NOT NULL,
    country VARCHAR(100),
    website VARCHAR(255) UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    publicationDate DATE,
    genre ENUM('FICCION', 'NO_FICCION', 'FANTASIA', 'CIENCIA_FICCION', 'MISTERIO', 'ROMANCE', 'TERROR', 'HISTORICO', 'BIOGRAFIA', 'CIENCIA', 'AUTOAYUDA', 'INFANTIL', 'JUVENIL', 'COMICS', 'EDUCACION') NOT NULL,
    totalCopies INT NOT NULL CHECK (total_copies >= 0),
    authorId INT NOT NULL,
    editorialId INT NOT NULL,
    FOREIGN KEY (authorId) REFERENCES Author(id) ON DELETE CASCADE,
    FOREIGN KEY (editorialId) REFERENCES Editorial(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Client (
    id INT AUTO_INCREMENT,
    nationalId VARCHAR(20) NOT NULL UNIQUE,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    birthDate DATE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE CHECK (email LIKE '%@%.%'),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Loan (
    id INT AUTO_INCREMENT,
    loanDate DATE NOT NULL,
    dueDate DATE NOT NULL CHECK (due_date > loan_date),
    returnDate DATE CHECK (return_date IS NULL OR return_date >= loan_date),
    clientId INT NOT NULL,
    bookId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (clientId) REFERENCES Client(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Book(id) ON DELETE CASCADE
);

CREATE TABLE User (
    userName VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL CHECK(LENGTH(password)>=8),
    PRIMARY KEY (userName)
);