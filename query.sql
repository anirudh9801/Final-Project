
CREATE DATABASE hospital;

USE hospital;

CREATE TABLE patient_enrollment (
    UHID varchar(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender ENUM('MALE', 'FEMALE', 'OTHER'),
    userName VARCHAR(50),
    Phone_no VARCHAR(50),
    email VARCHAR(200),
	status VARCHAR(50),
    cause VARCHAR(500),
    Address varchar(1000),
    medHistory Varchar(1000)
    
);
use hospital;
CREATE TABLE Authentication (
    Authid INT AUTO_INCREMENT PRIMARY KEY,
    UHID VARCHAR(50),
    username VARCHAR(50),
    Passcode VARCHAR(200),
    email VARCHAR(50),
	otp VARCHAR(20)
);



