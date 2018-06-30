DROP TABLE nations CASCADE;
DROP TABLE venues CASCADE;
DROP TABLE homologations CASCADE;
DROP TABLE k_points CASCADE;
DROP TABLE athletes CASCADE;
DROP TABLE referees CASCADE;
DROP TABLE calendar CASCADE;

DROP TABLE results_alpine CASCADE;
DROP TABLE results_jumping CASCADE;

DROP TABLE ranking_alpine CASCADE;
DROP TABLE ranking_jumping CASCADE;

-----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE nations
(
    name VARCHAR(30) UNIQUE NOT NULL,
    short VARCHAR(3) UNIQUE NOT NULL
);

CREATE TABLE venues
(
    id_venue SERIAL NOT NULL,
    venue VARCHAR(30) NOT NULL,
    nation VARCHAR(3) NOT NULL
);

CREATE TABLE homologations
(
    id_venue INTEGER NOT NULL,
    discipline VARCHAR(2) NOT NULL
);

CREATE TABLE k_points
(
    id_venue INTEGER NOT NULL,
    k_point VARCHAR(4) NOT NULL
);

CREATE TABLE athletes
(
    id_athlete SERIAL NOT NULL,
    f_name VARCHAR(25) NOT NULL,
    l_name VARCHAR(30) NOT NULL,
    b_date DATE NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    nation VARCHAR(3) NOT NULL,
    club VARCHAR(40),
    sector VARCHAR(2) NOT NULL
);

CREATE TABLE referees
(
    id_referee SERIAL NOT NULL,
    f_name VARCHAR(25) NOT NULL,
    l_name VARCHAR(30) NOT NULL,
    b_date DATE NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    nation VARCHAR(3) NOT NULL,
    sector VARCHAR(2) NOT NULL
);

CREATE TABLE calendar
(
    id_competition SERIAL NOT NULL,
    id_venue INTEGER NOT NULL,
    c_date DATE NOT NULL,
	sector VARCHAR(2) NOT NULL,
    discipline VARCHAR(2),
    id_referee INTEGER NOT NULL,
    world_cup BOOLEAN NOT NULL DEFAULT FALSE,
	counted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE results_alpine
(
    id_competition INTEGER NOT NULL,
    id_athlete INTEGER NOT NULL,
    f_leg NUMERIC(6,2) NOT NULL,
    s_leg NUMERIC(6,2) DEFAULT NULL
);

CREATE TABLE results_jumping
(
    id_competition INTEGER NOT NULL,
    id_athlete INTEGER NOT NULL,
    f_jump NUMERIC(6,2) NOT NULL,
    s_jump NUMERIC(6,2) DEFAULT NULL
);

CREATE TABLE ranking_alpine
(
    id_athlete INTEGER UNIQUE NOT NULL,
    points INTEGER DEFAULT 0
); 

CREATE TABLE ranking_jumping
(
    id_athlete INTEGER UNIQUE NOT NULL,
    points INTEGER DEFAULT 0
);