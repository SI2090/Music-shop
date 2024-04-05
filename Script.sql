CREATE TABLE IF NOT EXISTS Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255),
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(255),
    release_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

CREATE TABLE IF NOT EXISTS Compilations (
    compilation_id INT PRIMARY KEY,
    compilation_name VARCHAR(255),
    release_year INT
);

CREATE TABLE IF NOT EXISTS Tracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(255),
    duration INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Artists_Compilations (
    artist_id INT,
    compilation_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (compilation_id) REFERENCES Compilations(compilation_id),
    PRIMARY KEY (artist_id, compilation_id)
);