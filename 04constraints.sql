ALTER TABLE venues ADD UNIQUE(venue, nation);

ALTER TABLE homologations ADD UNIQUE(id_venue, discipline);

ALTER TABLE k_points ADD UNIQUE(id_venue, k_point);

ALTER TABLE athletes ADD UNIQUE(f_name, l_name, b_date, sector);

ALTER TABLE referees ADD UNIQUE(f_name, l_name, b_date, sector);

-----------------------------------------------------------------------------------------------------------------------------

ALTER TABLE homologations ADD CHECK (discipline IN ('SL','GS', 'SG', 'DH', 'SC'));

ALTER TABLE athletes ADD CHECK (sector IN ('AL','JP'));

ALTER TABLE referees ADD CHECK (sector IN ('AL','JP'));

ALTER TABLE calendar ADD CHECK (sector IN ('AL','JP'));

ALTER TABLE calendar ADD CHECK (discipline IN ('SL','GS', 'SG', 'DH', 'SC'));

-- Może jakoś zwięźlej? /\