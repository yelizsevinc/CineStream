CREATE DATABASE CineStreamDB;
GO

USE CineStreamDB;
GO

CREATE TABLE Platforms (
    PlatformID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Details NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Shows (
    ShowID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    ReleaseDate DATE,
    Details NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Details NVARCHAR(MAX),
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

-- Insert Platforms
INSERT INTO Platforms (Name, Details) VALUES ('Netflix', 'Netflix is a streaming service that offers a wide variety of award-winning TV shows, movies, anime, documentaries, and more.');
INSERT INTO Platforms (Name, Details) VALUES ('HBO Max', 'HBO Max is a premium streaming app that combines all of HBO with even more must-see TV series, blockbuster movies, and exclusive Max Originals.');
INSERT INTO Platforms (Name, Details) VALUES ('YouTube', 'YouTube is a video sharing service where users can watch, like, share, comment and upload their own videos.');
INSERT INTO Platforms (Name, Details) VALUES ('Amazon Prime', 'Amazon Prime Video is a streaming service that offers a wide variety of TV shows, movies, and original content.');
GO

-- Insert Shows
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Game of Thrones', '2011-04-17', 'Game of Thrones is an American fantasy drama television series based on George R. R. Martins series of fantasy novels.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Lord of the Rings', '2001-12-19', 'The Lord of the Rings is a film series of three epic fantasy adventure films directed by Peter Jackson.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Outlander', '2014-08-09', 'Outlander is a historical drama television series based on the novel series of the same name by Diana Gabaldon.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Example Show on YouTube', '2022-01-01', 'This is an example show available on YouTube.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Stranger Things', '2016-07-15', 'Stranger Things is an American science fiction horror drama television series created by the Duffer Brothers.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Spartacus', '2010-01-22', 'Spartacus is a television series inspired by the historical figure of Spartacus, a Thracian gladiator who from 73 to 71 BC led a major slave uprising against the Roman Republic.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Breaking Bad', '2008-01-20', 'Breaking Bad is an American neo-Western crime drama television series created and produced by Vince Gilligan.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('The Witcher', '2019-12-20', 'The Witcher is a Polish-American fantasy drama streaming television series produced by Lauren Schmidt Hissrich.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('The Crown', '2016-11-04', 'The Crown is a historical drama television series about the reign of Queen Elizabeth II.');
INSERT INTO Shows (Title, ReleaseDate, Details) VALUES ('Black Mirror', '2011-12-04', 'Black Mirror is a British anthology television series created by Charlie Brooker.');
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

-- Stranger Things to Netflix
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'Netflix' AND Shows.Title = 'Stranger Things';

-- Spartacus to HBO Max
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'HBO Max' AND Shows.Title = 'Spartacus';

-- Breaking Bad to Netflix
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'Netflix' AND Shows.Title = 'Breaking Bad';

-- The Witcher to Netflix
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'Netflix' AND Shows.Title = 'The Witcher';

-- The Crown to Netflix
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'Netflix' AND Shows.Title = 'The Crown';

-- Black Mirror to Netflix
INSERT INTO PlatformShows (PlatformID, ShowID, AddedToPlatformDate)
    SELECT PlatformID, ShowID, GETDATE()
    FROM Platforms, Shows
    WHERE Platforms.Name = 'Netflix' AND Shows.Title = 'Black Mirror';
GO

-- Insert Users
INSERT INTO Users (Username, Email, Details) VALUES ('Alice', 'alice@example.com', 'Alice is a regular user who loves watching fantasy and drama shows.');
INSERT INTO Users (Username, Email, Details) VALUES ('Bob', 'bob@example.com', 'Bob is an avid fan of historical dramas and epic adventures.');
INSERT INTO Users (Username, Email, Details) VALUES ('Charlie', 'charlie@example.com', 'Charlie enjoys a variety of shows, especially those available on streaming platforms.');
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

-- Charlie subscribed to YouTube
INSERT INTO PlatformUsers (PlatformID, UserID, SubscriptionDate)
    SELECT PlatformID, UserID, GETDATE()
    FROM Platforms, Users
    WHERE Platforms.Name = 'YouTube' AND Users.Username = 'Charlie';
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
