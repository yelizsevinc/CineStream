# CineStream

CineStream app helps managing streaming platforms, media and users in the DB.

## Features

### Platforms

- List all platforms in the database
- Add a new platform to the database
- Delete a platform from the database
- List and manage users of a platform in the database
- List and manage shows of a platform in the database

### Shows

- List all shows in the database
- Add a new show to the database
- Delete a show from the database
- Update and manage platforms of a show in the database
- Update and manage users of a show in the database

### Users

- List all users in the database
- Add a new user to the database
- Delete a user from the database
- List and manage platforms of a user in the database
- List and manage shows of a user in the database

## Tech Stack

- .NET 8.0
- Blazor WebAssembly
- Docker
- Entity Framework Core
- Azure Data Studio
- MSSQL
- Bootstrap 5
- Blazority

## Quick Start

1. Clone the repository: `git clone git@github.com:yelizsevinc/CineStream.git`
2. Navigate to the project directory: `cd CineStream`
3. Get Docker up and running: `docker --version`
4. Build and start the application using Docker Compose: `docker-compose up -d`
5. Access the application at `http://localhost:5050`

## Quick Start without Docker Compose

1. Clone the repository: `git clone git@github.com:yelizsevinc/CineStream.git`
2. Navigate to the project directory: `cd CineStream/CineStream`
3. Restore dependencies: `dotnet restore`
4. Start the application: `dotnet run`
