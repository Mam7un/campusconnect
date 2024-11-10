CREATE DATABASE campusconnect;
use campusconnect;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    role ENUM('student', 'faculty', 'admin') NOT NULL,
    department VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Notes (
   note_id INT PRIMARY KEY,
   title VARCHAR(20) NOT NULL,
   description VARCHAR(100),
   department VARCHAR(20) NOT NULL,
   section VARCHAR(20) NOT NULL,
   uploaded_by INT,
   filepath VARCHAR(100),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (uploaded_by) REFERENCES Users(user_id)
);
CREATE TABLE books_ref (
   book_id INT PRIMARY KEY,
   title VARCHAR(20),
   author VARCHAR(20),
   department VARCHAR(20),
   added_by INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (added_by) REFERENCES Users(user_id)
);
CREATE TABLE lostandfound (
   item_id INT PRIMARY KEY NOT NULL,
   item_name VARCHAR(20) NOT NULL,
   status ENUM('lost', 'found') NOT NULL,
   description VARCHAR(100),
   location VARCHAR(50),
   date DATE,
   reported_by INT,
   contact_info VARCHAR(50),
   FOREIGN KEY (reported_by) REFERENCES Users(user_id)
);
CREATE TABLE Help (
   request_id INT PRIMARY KEY,
   user_id INT,
   subject VARCHAR(20),
   status ENUM('open', 'closed') DEFAULT 'open',
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Dashboard (
   announcement_id INT PRIMARY KEY,
   title VARCHAR(20),
   content VARCHAR(100),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   posted_by INT,
   FOREIGN KEY (posted_by) REFERENCES Users(user_id)
);
DESCRIBE help;

