create database travel_booking;
use travel_booking;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL, -- Sử dụng bcrypt để mã hóa mật khẩu
    Email VARCHAR(100) NOT NULL UNIQUE,
    FullName VARCHAR(100),
    DateOfBirth DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);

CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    LocationID INT,
    StartDateTime DATETIME NOT NULL,
    EndDateTime DATETIME NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_Location FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE TicketTypes (
    TypeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ScheduleID INT,
    NumTickets INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    BookingDateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_User FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_Schedule FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);

CREATE TABLE Images (
    ImageID INT PRIMARY KEY AUTO_INCREMENT,
    ScheduleID INT,
    URL VARCHAR(255) NOT NULL,
    Description TEXT,
    CONSTRAINT fk_ScheduleImage FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ScheduleID INT,
    Rating INT NOT NULL,
    Comment TEXT,
    ReviewDateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_UserReview FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT fk_ScheduleReview FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);

ALTER TABLE Bookings ADD CONSTRAINT fk_UserBooking FOREIGN KEY (UserID) REFERENCES Users(UserID);
ALTER TABLE Bookings ADD CONSTRAINT fk_ScheduleBooking FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID);
ALTER TABLE Reviews ADD CONSTRAINT fk_UserReview FOREIGN KEY (UserID) REFERENCES Users(UserID);
ALTER TABLE Reviews ADD CONSTRAINT fk_ScheduleReview FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID);
ALTER TABLE Images ADD CONSTRAINT fk_ScheduleImage FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID);
