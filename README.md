# 🎥 CineStream

CineStream app helps managing streaming platforms, media and users in the DB easily.

With CineStream, you can easily organize your media content, manage user access and integrate with multiple streaming platforms—all from a single user-friendly interface.

## Features

### Platform Management

- View all platforms in the database.
- Add or remove platforms.
- Manage users associated with each platform.
- Manage shows associated with each platform.

### Show Management

- View all shows in the database.
- Add, update, or delete shows.
- Manage platforms associated with each show.
- Manage users associated with each show.

### User Management

- View all users in the database.
- Add or remove users.
- Manage platforms associated with each user.
- Manage shows associated with each user.

## Getting Started

1. **Installation**: Clone the repository.

   ```bash
   git clone git@github.com:yelizsevinc/CineStream.git
   ```

2. **Prepare**: Ensure Docker is up and running:

   ```bash
   docker --version
   docker-compose --version
   ```

3. **Build and run**: Build and start the application using Docker Compose:

   ```bash
   docker-compose up -d
   ```

4. **Access**: Open your web browser and navigate to http://localhost:5050 to start using the application.

5. **Development**: To enable live reloading during development, run the application in watch mode after the DB is prepared by docker-compose:

   ```bash
   cd CineStream
   dotnet restore
   dotnet watch
   ```

## Tech Stack

- .NET 8.0
- Blazor WebAssembly
- Docker
- Entity Framework Core
- Azure Data Studio
- MSSQL
- Bootstrap 5
- Blazority
