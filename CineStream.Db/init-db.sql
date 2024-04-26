DELETE DATABASE CineStreamDB;

CREATE DATABASE CineStreamDB;
GO

USE CineStreamDB;
GO

CREATE TABLE Platforms (
    PlatformID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Shows (
    ShowID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    ReleaseDate DATE,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE UserShows (
    UserShowID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    ShowID INT,
    Watched BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID) ON DELETE CASCADE
);
GO

CREATE TABLE PlatformUsers (
    PlatformUserID INT IDENTITY(1,1) PRIMARY KEY,
    PlatformID INT,
    UserID INT,
    SubscriptionDate DATE,
    FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
GO

CREATE TABLE PlatformShows (
    PlatformShowID INT IDENTITY(1,1) PRIMARY KEY,
    PlatformID INT,
    ShowID INT,
    AddedToPlatformDate DATE,
    FOREIGN KEY (PlatformID) REFERENCES Platforms(PlatformID) ON DELETE CASCADE,
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID) ON DELETE CASCADE
);
GO

-- Truncate all tables to reset data
TRUNCATE TABLE UserShows;
TRUNCATE TABLE PlatformUsers;
TRUNCATE TABLE PlatformShows;
TRUNCATE TABLE Users;
TRUNCATE TABLE Shows;
TRUNCATE TABLE Platforms;
GO

-- Insert Platforms
INSERT INTO Platforms (Name) VALUES ('Netflix');
INSERT INTO Platforms (Name) VALUES ('HBO Max');
INSERT INTO Platforms (Name) VALUES ('YouTube');
INSERT INTO Platforms (Name) VALUES ('Amazon Prime');
GO

-- Insert Shows
INSERT INTO Shows (Title, ReleaseDate) VALUES ('Game of Thrones', '2011-04-17');
INSERT INTO Shows (Title, ReleaseDate) VALUES ('Lord of the Rings', '2001-12-19');
INSERT INTO Shows (Title, ReleaseDate) VALUES ('Outlander', '2014-08-09');
INSERT INTO Shows (Title, ReleaseDate) VALUES ('Example Show on YouTube', '2022-01-01');
GO

-- Associate Shows with Platforms
-- Game of Thrones to HBO Max
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'HBO Max' AND Shows.Title = 'Game of Thrones';
    
-- Lord of the Rings to Amazon Prime
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'Amazon Prime' AND Shows.Title = 'Lord of the Rings';
    
-- Outlander to Netflix
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'Netflix' AND Shows.Title = 'Outlander';
    
-- Example Show on YouTube
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'YouTube' AND Shows.Title = 'Example Show on YouTube';
GO

-- Insert Users
INSERT INTO Users (Username, Email) VALUES ('Alice', 'alice@example.com');
INSERT INTO Users (Username, Email) VALUES ('Bob', 'bob@example.com');
INSERT INTO Users (Username, Email) VALUES ('Charlie', 'charlie@example.com');
GO

-- Associate Users with Platforms
-- Alice subscribed to Netflix and HBO Max
INSERT INTO PlatformUsers (PlatformID, UserID, SubscriptionDate)
    SELECT PlatformID, UserID, GETDATE()
    FROM Platforms, Users
    WHERE Platforms.Name = 'Netflix' AND Users.Username = 'Alice';

INSERT INTO PlatformUsers (PlatformID, UserID, SubscriptionDate)
    SELECT PlatformID, UserID, GETDATE()
    FROM Platforms, Users
    WHERE Platforms.Name = 'HBO Max' AND Users.Username = 'Alice';

-- Bob subscribed to Amazon Prime
INSERT INTO PlatformUsers (PlatformID, UserID, SubscriptionDate)
    SELECT PlatformID, UserID, GETDATE()
    FROM Platforms, Users
    WHERE Platforms.Name = 'Amazon Prime' AND Users.Username = 'Bob';

-- Charlie subscribed to Netflix
INSERT INTO PlatformUsers (PlatformID, UserID, SubscriptionDate)
    SELECT PlatformID, UserID, GETDATE()
    FROM Platforms, Users
    WHERE Platforms.Name = 'Netflix' AND Users.Username = 'Charlie';
GO

-- Insert UserShows
-- Alice watched Game of Thrones and Lord of the Rings
INSERT INTO UserShows (UserID, ShowID, Watched)
    SELECT UserID, ShowID, 1
    FROM Users, Shows
    WHERE Users.Username = 'Alice' AND Shows.Title = 'Game of Thrones';

INSERT INTO UserShows (UserID, ShowID, Watched)
    SELECT UserID, ShowID, 1
    FROM Users, Shows
    WHERE Users.Username = 'Alice' AND Shows.Title = 'Lord of the Rings';

-- Bob watched Outlander
INSERT INTO UserShows (UserID, ShowID, Watched)
    SELECT UserID, ShowID, 1
    FROM Users, Shows
    WHERE Users.Username = 'Bob' AND Shows.Title = 'Outlander';

-- Charlie watched Example Show on YouTube
INSERT INTO UserShows (UserID, ShowID, Watched)
    SELECT UserID, ShowID, 1
    FROM Users, Shows
    WHERE Users.Username = 'Charlie' AND Shows.Title = 'Example Show on YouTube';
GO
