ALTER TABLE venues ADD FOREIGN KEY (nation) REFERENCES nations(short) 
 ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE homologations ADD FOREIGN KEY (id_venue) REFERENCES venues(id_venue) 
 ON DELETE CASCADE;

 -- Does make sense? Maybe better add something on SERIAL?

ALTER TABLE k_points ADD FOREIGN KEY (id_venue) REFERENCES venues(id_venue) 
 ON DELETE CASCADE;
 
ALTER TABLE athletes ADD FOREIGN KEY (nation) REFERENCES nations(short) 
 ON DELETE RESTRICT;

ALTER TABLE referees ADD FOREIGN KEY (nation) REFERENCES nations(short) 
 ON DELETE RESTRICT;
 
ALTER TABLE calendar ADD FOREIGN KEY (id_venue) REFERENCES venues(id_venue) 
 ON DELETE RESTRICT;
 
ALTER TABLE calendar ADD FOREIGN KEY (id_referee) REFERENCES referees(id_referee) 
 ON DELETE RESTRICT;
 
ALTER TABLE results_alpine ADD FOREIGN KEY (id_athlete) REFERENCES athletes(id_athlete) 
 ON DELETE CASCADE;

ALTER TABLE results_alpine ADD FOREIGN KEY (id_competition) REFERENCES calendar(id_competition) 
 ON DELETE CASCADE;
 
ALTER TABLE ranking_jumping ADD FOREIGN KEY (id_athlete) REFERENCES athletes(id_athlete) 
 ON DELETE CASCADE;
 
 ALTER TABLE results_jumping ADD FOREIGN KEY (id_competition) REFERENCES calendar(id_competition) 
 ON DELETE CASCADE;