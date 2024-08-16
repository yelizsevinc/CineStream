# Use the official .NET SDK image to build the app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy the solution file and restore dependencies
COPY *.sln .
COPY CineStream/*.csproj ./CineStream/
COPY CineStream.Client/*.csproj ./CineStream.Client/
ENV DOTNET_NUGET_SIGNATURE_VERIFICATION=false
RUN dotnet restore

# Copy the entire project files and build the app
COPY . .
WORKDIR /app/CineStream
RUN dotnet publish -c Release -o out

# Use the official .NET runtime image to run the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/CineStream/out ./
EXPOSE 5050
ENTRYPOINT ["dotnet", "CineStream.dll"]
