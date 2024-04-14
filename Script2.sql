CREATE TABLE IF NOT EXISTS Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ArtistGenres (
    artist_id INT,
    genre_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(255),
    release_year INT,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(255),
    duration INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    CHECK (duration <= 600)
);

CREATE TABLE IF NOT EXISTS Compilations (
    compilation_id INT PRIMARY KEY,
    compilation_name VARCHAR(255),
    release_year INT
);

CREATE TABLE IF NOT EXISTS CompilationTracks (
    compilation_id INT,
    track_id INT,
    FOREIGN KEY (compilation_id) REFERENCES Compilations(compilation_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id),
    PRIMARY KEY (compilation_id, track_id)
);
