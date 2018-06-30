ALTER TABLE nations ADD PRIMARY KEY (short);

ALTER TABLE venues ADD PRIMARY KEY (id_venue);
-- Maybe better:
-- ALTER TABLE venues ADD PRIMARY KEY (venue, nation);
-- ?

ALTER TABLE homologations ADD PRIMARY KEY (id_venue, discipline);

ALTER TABLE k_points ADD PRIMARY KEY (id_venue, k_point);

ALTER TABLE athletes ADD PRIMARY KEY (id_athlete);

ALTER TABLE referees ADD PRIMARY KEY (id_referee);

ALTER TABLE calendar ADD PRIMARY KEY(id_competition);

ALTER TABLE results_alpine ADD PRIMARY KEY (id_competition, id_athlete);
ALTER TABLE results_jumping ADD PRIMARY KEY (id_competition, id_athlete);

ALTER TABLE ranking_alpine ADD PRIMARY KEY (id_athlete);
ALTER TABLE ranking_jumping ADD PRIMARY KEY (id_athlete);