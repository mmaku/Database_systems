INSERT INTO nations (name, short) VALUES ('Poland','POL');
INSERT INTO nations (name, short) VALUES ('Germany','GER');
INSERT INTO nations (name, short) VALUES ('Slovenia','SLO');
INSERT INTO nations (name, short) VALUES ('Austria','AUT');
INSERT INTO nations (name, short) VALUES ('Norway','NOR');
INSERT INTO nations (name, short) VALUES ('Slovakia','SVK');
INSERT INTO nations (name, short) VALUES ('The Unitet States of America','USA');
INSERT INTO nations (name, short) VALUES ('Sweden','SWE');
INSERT INTO nations (name, short) VALUES ('Finland','FIN');
INSERT INTO nations (name, short) VALUES ('Japan','JPN');
INSERT INTO nations (name, short) VALUES ('France','FRA');
INSERT INTO nations (name, short) VALUES ('Italy','ITA');
INSERT INTO nations (name, short) VALUES ('Czech Republic','CZE');
INSERT INTO nations (name, short) VALUES ('Russia', 'RUS');

INSERT INTO venues (venue, nation) VALUES ('Willingen','GER');
INSERT INTO venues (venue, nation) VALUES ('Zakopane','POL');
INSERT INTO venues (venue, nation) VALUES ('Vikersund','NOR');
INSERT INTO venues (venue, nation) VALUES ('Falun', 'SWE');
INSERT INTO venues (venue, nation) VALUES ('Artesina','ITA');
INSERT INTO venues (venue, nation) VALUES ('Oberstaufen','GER');
INSERT INTO venues (venue, nation) VALUES ('Zao','JPN');
INSERT INTO venues (venue, nation) VALUES ('Norefjell','NOR');
INSERT INTO venues (venue, nation) VALUES ('Karlov pod Pradedem','CZE');

INSERT INTO homologations (id_venue,discipline) VALUES (5,'SL');
INSERT INTO homologations (id_venue,discipline) VALUES (6,'SL');
INSERT INTO homologations (id_venue,discipline) VALUES (7,'SL');
INSERT INTO homologations (id_venue,discipline) VALUES (8,'GS');
INSERT INTO homologations (id_venue,discipline) VALUES (9,'SL');
INSERT INTO homologations (id_venue,discipline) VALUES (1,'SL');


INSERT INTO k_points (id_venue, k_point) VALUES (1,130);
INSERT INTO k_points (id_venue, k_point) VALUES (2,90);
INSERT INTO k_points (id_venue, k_point) VALUES (3,195);
INSERT INTO k_points (id_venue, k_point) VALUES (4,120);

INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Kamil','Stoch','1987-05-25',TRUE,'POL','KS Eve-nement Zakopane ','JP' );
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Severin', 'Freund','1988-05-11',TRUE,'GER','WSV DJK Rastbuechl', 'JP' );
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Gregor', 'Schlirenzauer','1990-01-07',TRUE,'AUT','SV Innsbruck-Bergisel-Tirol','JP' );
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Rune','Velta','1989-07-19', TRUE, 'NOR','Lommedalen IL','JP');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Roman','Koudelka','1989-07-09', TRUE, 'CZE', 'LSK Lomnice nad Popelkou ','JP');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Peter','Prevc','1992-09-20',TRUE,'SLO','SK Triglav Kranj','JP');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Anders','Fannemel','1994-01-06',TRUE,'NOR','Hornindal IL','JP');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Marinus', 'Kraus','1991-02-13',TRUE,'GER','WSV Oberaudorf','JP');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Alexander','Khoroshilov','1984-02-16',TRUE,'RUS','FSO of Russia', 'AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Stefano','Gross','1986-09-04',TRUE,'ITA','GRUPPO SCIATORI FIAMME GIALLE','AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Felix', 'Neureuther','1984-03-26',TRUE,'GER','SC Partenkirchen','AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Fritz','Dopfer','1987-08-24',TRUE,'GER','SC Garmisch','AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Linus','Strasser','1992-11-06',TRUE,'GER','TSV 1860 Muenchen','AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Giuliano','Razzoli','1984-12-18',TRUE,'ITA','C.S.ESERCITO','AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Henrik','Kristoffersen','1994-07-02',TRUE,'NOR','Raelingen Skiclub','AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Sylwester','Latusek','1996-05-01',TRUE,'POL','MKN Zryw Bielsko-Biala','AL');
INSERT INTO athletes (f_name, l_name, b_date, active, nation, club, sector) VALUES ('Jakub','Klusak','1992-05-18',TRUE,'POL','AZS Zakopane','AL');

INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Aleksander','Maze','1970-11-11',TRUE,'AUT','JP');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Marian','Winski','1976-03-06',TRUE,'POL','JP');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Jan','Maroszek','1980-12-15',TRUE,'POL','JP');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Anita','Randolle','1977-01-01',TRUE,'AUT','JP');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Ole','Ingvaldsen','1968-09-11',TRUE,'NOR','AL');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Magnus','Cologna','1972-09-18',TRUE,'SWE','AL');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Martin','Stock','1980-06-19',TRUE,'GER','JP');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Mikolaj','Razek','1983-10-25',TRUE,'CZE','AL');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Jarko','Maninen','1979-09-09',TRUE,'FIN','AL');
INSERT INTO referees (f_name,l_name,b_date,active,nation,sector) VALUES ('Pablo','Gunizo','1985-05-17',TRUE,'ITA','JP');

INSERT INTO calendar(id_venue,c_date,sector,discipline,id_referee,counted,world_cup) VALUES (5,'2015-01-31','AL','SL',10,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,discipline,id_referee,counted,world_cup) VALUES (6,'2015-02-01','AL','SL',5,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,discipline,id_referee,counted,world_cup) VALUES (7,'2015-01-30','AL','SL',6,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,discipline,id_referee,counted,world_cup) VALUES (8,'2015-01-27','AL','GS',9,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,discipline,id_referee,counted,world_cup) VALUES (9,'2015-01-20','AL','SL',8,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,id_referee,counted,world_cup) VALUES (1,'2015-01-31','JP',10,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,id_referee,counted,world_cup) VALUES (2,'2015-01-29','JP',1,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,id_referee,counted,world_cup) VALUES (3,'2015-01-20','JP',2,FALSE,TRUE);
INSERT INTO calendar(id_venue,c_date,sector,id_referee,counted,world_cup) VALUES (4,'2015-01-15','JP',3,FALSE,TRUE);

INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (5,16,42.27,50.11);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (5,17,40.94,49.32);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (2,13,40.67,46.58);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (2,12,42.42,46.45);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (2,14,42.23,45.49);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (3,9,40.11,40.92);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (3,11,41.01,41.55);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (4,12,40.25,41.01);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (4,10,42.22,42.66);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (1,15,41.54,42.08);
INSERT INTO results_alpine(id_competition,id_athlete,f_leg,s_leg) VALUES (1,13,41.99,42.24);

INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (6,1,147.5,142.5);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (6,6,139.0,144.0);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (6,2,135.5,146.0);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (7,1,126,129.5);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (7,4,125.5,128);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (7,3,124,124.5);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (8,1,220,223.5);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (8,6,219,222);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (8,4,215,224);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (9,2,110,117.5);
INSERT INTO results_jumping(id_competition,id_athlete,f_jump,s_jump) VALUES (9,8,111.5,112);



--wyzwalacz na dyscypliny
--trzeba zmienic ALTER TABLE homologations ADD CHECK (discipline IN ('SL','GS', 'SG', 'DH', 'SC','NH','LH','FH'));
--chcialam zrobic ciekawszy, zalezny od HS skoczni, ale wtedy trzeba by zmieniac tabele, wiec tylko taki prosty trigger

CREATE OR REPLACE FUNCTION discipline() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.sector='JP' AND NEW.discipline NOT IN ('NH','LH','FH') THEN     
           RAISE EXCEPTION 'In sector JP discipline must be SL, GS, SG, DH or SC';
    END IF;
    IF NEW.sector='AL' AND NEW.discipline NOT IN ('SL', 'GS', 'SG', 'DH', 'SC') THEN
           RAISE EXCEPTION 'In sector AL discipline must be NH, LH or FH')
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE 'plpsql';

DROP TRIGGER discipline ON calendar CASCADE;
CREATE TRIGGER discipline BEFORE INSERT OR UPDATE ON calendar
  FOR EACH ROW EXECUTE PROCEDURE discipline();
  
SELECT * FROM venues;
