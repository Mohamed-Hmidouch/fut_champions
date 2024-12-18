use futchampions;
-- nationality
CREATE TABLE nationality (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nationality VARCHAR(10) NOT NULL,
    flag VARCHAR(60) NOT NULL
);

-- club
CREATE TABLE club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    club_name VARCHAR(30) NOT NULL,
    logo VARCHAR(60) NOT NULL
);

-- players
CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_player VARCHAR(10) NOT NULL,
    photo VARCHAR(100) NOT NULL,
    position VARCHAR(5) NOT NULL,
    deleted_players VARCHAR(5),
    rating INT,
    nationality_id INT,
    club_id INT,
    FOREIGN KEY (nationality_id) REFERENCES nationality(id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

--players_fields
CREATE TABLE players_fields (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pace INT,
    shooting INT,
    passing INT,
    dribbling INT,
    defending INT,
    physical INT,
    players_id INT,
    FOREIGN KEY (players_id) REFERENCES players(id)
);

-- Table: gk_fields
CREATE TABLE gk_fields (
    id INT AUTO_INCREMENT PRIMARY KEY,
    diving INT,
    handling INT,
    kicking INT,
    reflexes INT,
    speed INT,
    positioning INT,
    players_id INT,
    FOREIGN KEY (players_id) REFERENCES players(id)
);

alter table
add statu varchar(10);

INSERT INTO club (club_name, logo) VALUES
('Inter Miami', 'https://cdn.sofifa.net/meta/team/239235/120.png'),
('Al Nassr', 'https://cdn.sofifa.net/meta/team/2506/120.png'),
('Manchester City', 'https://cdn.sofifa.net/players/239/085/25_120.png'),
('Real Madrid', 'https://cdn.sofifa.net/meta/team/3468/120.png'),
('Al-Hilal', 'https://cdn.sofifa.net/meta/team/7011/120.png'),
('Liverpool', 'https://cdn.sofifa.net/meta/team/8/120.png'),
('Bayern Munich', 'https://cdn.sofifa.net/meta/team/503/120.png'),
('Atletico Madrid', 'https://cdn.sofifa.net/meta/team/7980/120.png'),
('Al-Ittihad', 'https://cdn.sofifa.net/meta/team/476/120.png'),
('Manchester United', 'https://cdn.sofifa.net/meta/team/14/120.png');

INSERT INTO nationality (nationality, flag)
VALUES
( 'Argentina', 'https://cdn.sofifa.net/flags/ar.png'),
( 'Portugal', 'https://cdn.sofifa.net/flags/pt.png'),
( 'Belgium', 'https://cdn.sofifa.net/flags/be.png'),
( 'France', 'https://cdn.sofifa.net/flags/fr.png'),
( 'Netherlands', 'https://cdn.sofifa.net/flags/nl.png'),
( 'Germany', 'https://cdn.sofifa.net/flags/de.png'),
( 'Egypt', 'https://cdn.sofifa.net/flags/eg.png'),
( 'Croatia', 'https://cdn.sofifa.net/flags/hr.png'),
( 'Morocco', 'https://cdn.sofifa.net/flags/ma.png'),
( 'Norway', 'https://cdn.sofifa.net/flags/no.png'),
('Canada', 'https://cdn.sofifa.net/flags/ca.png');
use futchampions;
select * from players inner join club on players.id = club.id
inner join nationality on nationality.id = players.id;
;

alter table players
add name_player varchar(30);

INSERT INTO players (name_player,photo,position,rating,nationality_id,club_id)
VALUES
('messi','https://cdn.sofifa.net/players/158/023/25_120.png','RW',93,1,1),
('Cristiano Ronaldo','https://cdn.sofifa.net/players/020/801/25_120.png','ST',99,2,2),
('Kevin De Bruyne','https://cdn.sofifa.net/players/192/985/25_120.png','CM',87,3,3),
('Antonio Rudiger','https://cdn.sofifa.net/players/205/452/25_120.png','CB',88,6,4),
('Jan Oblak','https://cdn.sofifa.net/players/200/389/25_120.png','GK',86,7,8);

SELECT 
    name_player,
    photo,
    nationality.nationality,
    nationality.flag,
    club.logo,
    club.club_name,
    players_field.pace,
    players_field.shooting,
    players_field.passing,
    players_field.dribbling,
    players_field.defending,
    players_field.physical,
    gk_field.diving,
    gk_field.handling,
    gk_field.kicking,
    gk_field.reflexes,
    gk_field.speed,
    gk_field.positioning
FROM 
    players 
LEFT JOIN nationality ON players.nationality_id = nationality.id
UNION 
SELECT 
    name_player,
    photo,
    nationality.nationality,
    nationality.flag,
    club.logo,
    club.club_name,
    players_field.pace,
    players_field.shooting,
    players_field.passing,
    players_field.dribbling,
    players_field.defending,
    players_field.physical,
    gk_field.diving,
    gk_field.handling,
    gk_field.kicking,
    gk_field.reflexes,
    gk_field.speed,
    gk_field.positioning
FROM 
    nationality 
LEFT JOIN players ON nationality.id = players.nationality_id
WHERE 
    players.id IS NULL
INSERT INTO  players_field(pace,shooting,passing,dribbling,defending,physical,players_id)
VALUES
(88,86,78,99,58,90,1),
(70,86,78,59,98,78,2),
(78,67,70,86,87,45,3),
(77,89,76,94,18,59,4),
(98,78,28,97,67,98,5)
;



