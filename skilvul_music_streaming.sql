CREATE DATABASE Music_Streaming;


USE Music_Streaming;


CREATE TABLE `user`( 
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);


CREATE TABLE singer (
    singer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE track (
    track_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR (50) NOT NULL,
    singer_id INT NOT NULL,
    FOREIGN KEY (singer_id) REFERENCES singer(singer_id),
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id)  
);

CREATE TABLE album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    singer_id INT NOT NULL,
    FOREIGN KEY (singer_id) REFERENCES singer(singer_id)
);

CREATE TABLE playlist (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE playlist_track(
    playlist_id INT NOT NULL,
    CONSTRAINT fk_playlist_track_playlist FOREIGN KEY(playlist_id) REFERENCES playlist(playlist_id),

    track_id INT NOT NULL,
    CONSTRAINT fk_playlist_track_track FOREIGN KEY(track_id) REFERENCES track(track_id)
);

