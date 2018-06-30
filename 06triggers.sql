CREATE OR REPLACE FUNCTION proper_age() RETURNS TRIGGER AS $$
DECLARE
	age_ INTEGER;
BEGIN
	age_ := EXTRACT(YEAR FROM age(NEW.b_date ));
	IF(age_ < 15 ) THEN
		RAISE EXCEPTION 'Person age --> %', age_
		USING HINT = 'Only poeople over 15 could be added...';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER check_age_trigger ON athletes CASCADE;
CREATE TRIGGER check_age_trigger BEFORE INSERT OR UPDATE ON athletes 
	FOR EACH ROW EXECUTE PROCEDURE proper_age();

DROP TRIGGER check_age_trigger ON referees CASCADE;
CREATE TRIGGER check_age_trigger BEFORE INSERT OR UPDATE ON referees 
	FOR EACH ROW EXECUTE PROCEDURE proper_age();
 
 -----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION competition_possible() RETURNS TRIGGER AS $$
DECLARE
	nation_ VARCHAR(3);
	venue_ VARCHAR(30);
	name_ VARCHAR(47);	
BEGIN
	PERFORM * FROM venues WHERE id_venue = NEW.id_venue;
	IF NOT FOUND THEN
			RAISE EXCEPTION 'Nonexistent venue --> %', NEW.id_venue
			USING HINT = 'Venue must exist!';
	END IF;
	
	NEW.sector := UPPER(NEW.sector);
	NEW.discipline := UPPER(NEW.discipline);
	
	SELECT venue, nation INTO venue_, nation_ FROM venues WHERE id_venue = NEW.id_venue;
	name_ :=  NEW.id_venue || ', ' || venue_ || ', ' || nation_;
	
	CASE
		WHEN(NEW.sector = 'AL' AND NEW.discipline IS NOT NULL) THEN
			IF(is_homologated(NEW.id_venue, NEW.discipline)) THEN -- homologation required!
				RETURN NEW;
			ELSE
				RAISE EXCEPTION 'Nonexistent % homologation --> %', NEW.discipline ,name_
				USING HINT = 'Course must have proper homologation to race it!';
			END IF;
		WHEN(NEW.sector = 'JP' AND NEW.discipline IS NULL) THEN
		IF(has_jump(NEW.id_venue)) THEN -- jump has to exist!
				RETURN NEW;
			ELSE
				RAISE EXCEPTION 'Nonexistent jump --> %', name_
				USING HINT = 'Venue must have jump to jump it!';
			END IF;
		ELSE
			RAISE EXCEPTION 'Something went wrong...';
	END CASE;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER competition_possible_trigger ON calendar CASCADE;
CREATE TRIGGER competition_possible_trigger BEFORE INSERT OR UPDATE ON calendar 
	FOR EACH ROW EXECUTE PROCEDURE competition_possible();

-----------------------------------------------------------------------------------------------------------------------------
	
CREATE OR REPLACE FUNCTION check_nation() RETURNS TRIGGER AS $$
DECLARE
foo_ VARCHAR(30);
BEGIN
	SELECT short INTO foo_ FROM nations AS n WHERE LOWER(n.name) = LOWER(NEW.name);
	IF FOUND THEN
		RAISE EXCEPTION 'Nation alredy exists, name --> %', foo_;
	END IF; 
	SELECT name INTO foo_ FROM nations AS n WHERE LOWER(n.short) = LOWER(NEW.short);
	IF FOUND THEN
		RAISE EXCEPTION 'Nation alredy exists, shortcut --> %', foo_;
	END IF;
	NEW.short := UPPER(NEW.short);
	NEW.name := initcap(NEW.name);
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER check_nation_trigger ON nations CASCADE;
CREATE TRIGGER check_nation_trigger BEFORE INSERT OR UPDATE ON nations
	FOR EACH ROW EXECUTE PROCEDURE check_nation();

-----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION check_person() RETURNS TRIGGER AS $$
DECLARE
	foo_ INTEGER;
BEGIN
	IF TG_TABLE_NAME = 'athletes' THEN
		SELECT id_athlete INTO foo_ FROM athletes AS a WHERE 
			LOWER(a.f_name) = LOWER(NEW.f_name) AND LOWER(l_name) = LOWER(NEW.l_name) AND
			a.b_date = NEW.b_date AND a.sector = UPPER(NEW.sector);
		IF FOUND THEN
			RAISE EXCEPTION 'Athlete alredy exists, id_athlete --> %', foo_;
		END IF;
	ELSIF TG_TABLE_NAME = 'referees' THEN
		SELECT id_referee INTO foo_ FROM referees AS r WHERE 
			LOWER(r.f_name) = LOWER(NEW.f_name) AND LOWER(l_name) = LOWER(NEW.l_name) AND
			r.b_date = NEW.b_date AND r.sector = UPPER(NEW.sector);
		IF FOUND THEN
			RAISE EXCEPTION 'Referee alredy exists, id_athlete --> %', foo_;
		END IF;
	END IF;
	
	NEW.f_name := initcap(NEW.f_name);
	NEW.l_name := initcap(NEW.l_name);
	NEW.nation := UPPER(NEW.nation);
	NEW.sector := UPPER(NEW.sector);
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER check_person_trigger ON athletes CASCADE;
CREATE TRIGGER check_person_trigger BEFORE INSERT OR UPDATE ON athletes
	FOR EACH ROW EXECUTE PROCEDURE check_person();

DROP TRIGGER check_person_trigger ON referees CASCADE;
CREATE TRIGGER check_person_trigger BEFORE INSERT OR UPDATE ON referees
	FOR EACH ROW EXECUTE PROCEDURE check_person();
	
-----------------------------------------------------------------------------------------------------------------------------
	
CREATE OR REPLACE FUNCTION add_ranking() RETURNS TRIGGER AS $$
DECLARE
	foo_ INTEGER;
BEGIN
	IF(NEW.sector = 'AL') THEN
		INSERT INTO ranking_alpine(id_athlete) VALUES (NEW.id_athlete);
	ELSIF(NEW.sector = 'JP') THEN
		INSERT INTO ranking_jumping(id_athlete) VALUES (NEW.id_athlete);
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER add_ranking_trigger ON athletes CASCADE;
CREATE TRIGGER add_ranking_trigger AFTER INSERT OR UPDATE ON athletes
	FOR EACH ROW EXECUTE PROCEDURE add_ranking();