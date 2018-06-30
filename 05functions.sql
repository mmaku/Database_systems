CREATE OR REPLACE FUNCTION nfs(nation_ VARCHAR(3)) RETURNS TEXT AS $$ -- Nation From Shortcut
DECLARE
	out_ TEXT;
BEGIN
	SELECT short INTO out_ FROM nations WHERE short = UPPER(nation_);
	RETURN out_;
END;
$$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION sfn(short_ VARCHAR(30)) RETURNS TEXT AS $$ -- Shortcut From Nation
DECLARE
	out_ TEXT;
BEGIN
	SELECT short INTO out_ FROM nations WHERE nation = INITCAP(short_);
	RETURN out_;
END;
$$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION WC_points(id_athlete_ INTEGER) RETURNS INTEGER AS $$ -- World Cup points
DECLARE
	sector_ VARCHAR(2);
	points_ INTEGER;
BEGIN
	SELECT sector INTO sector_ FROM athletes WHERE id_athlete = id_athlete_;
	IF FOUND THEN
		CASE sector_
			WHEN 'AL' THEN
				RETURN points FROM ranking_alpine WHERE id_athlete = id_athlete_;
			WHEN 'JP' THEN
				RETURN points FROM ranking_jumping WHERE id_athlete = id_athlete_;
		END CASE;
	END IF;
	
	RAISE EXCEPTION 'Nonexistent ID --> %', id_athlete_
	USING HINT = 'Please check your athlete ID';
END;
$$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION add_WC_points(id_competiton_ INTEGER) RETURNS INTEGER AS $$ -- adding World Cup points
DECLARE
	points_ INTEGER[30] := ARRAY[100,80,60,50,45,40,36,32,29,26,24,22,20,18,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1];
	athlete_ INTEGER;
	was_counted_ BOOLEAN;
	WC_ BOOLEAN;
BEGIN
	SELECT counted, world_cup INTO was_counted_, WC_ FROM calendar WHERE id_competiton = id_competiton_;
	IF FOUND AND NOT was_counted_ AND WC_ THEN
		PERFORM * FROM results_alpine WHERE id_competiton = id_competiton_;
		IF FOUND THEN
			FOR i IN 1..30 LOOP
				SELECT id_athlete INTO athlete_ FROM(
					SELECT id_athlete, f_run + s_run AS sum_, rank() OVER (ORDER BY sum_ ASC) as position FROM results_alpine WHERE id_competiton = id_competiton_
				) AS ranked
				WHERE position = i;
				
				IF NOT FOUND THEN
					EXIT;
				END IF;
				
				UPDATE ranking_alpine SET points = points + points_[i];
			END LOOP;
			UPDATE calendar SET counted = TRUE;
		ELSE
			PERFORM * FROM results_jumping WHERE id_competiton = id_competiton_;
			IF FOUND THEN
				FOR i IN 1..30 LOOP
					SELECT id_athlete INTO athlete_ FROM(
						SELECT id_athlete, f_jump + s_jump AS sum_, rank() OVER (ORDER BY sum_ DESC) as position FROM results_jumping WHERE id_competiton = id_competiton_
					) AS ranked
					WHERE position = i;
					
					IF NOT FOUND THEN
						EXIT;
					END IF;
					
					UPDATE ranking_jumping SET points = points + points_[i];
				END LOOP;
				UPDATE calendar SET counted = TRUE;
		ELSE
			RAISE EXCEPTION 'Nonexistent ID in results --> %', id_competiton_
			USING HINT = 'Please add results!';
		END IF;
		END IF;
	ELSIF FOUND AND WC_ THEN
		RAISE EXCEPTION 'Already counted to WC, ID --> %', id_competiton_;
	ELSIF FOUND THEN
		RAISE EXCEPTION 'Not a World CUP, ID --> %', id_competiton_;
	ELSE
		RAISE EXCEPTION 'Nonexistent ID in calendar --> %', id_competiton_
		USING HINT = 'Such competition doesnt exists!';
		END IF;
END;
$$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION is_homologated(id_venue_ INTEGER, disc_ VARCHAR(2)) RETURNS BOOLEAN AS $$ -- checking homologation
BEGIN
	PERFORM * FROM homologations WHERE id_venue = id_venue_ AND discipline = disc_;
	IF NOT FOUND THEN
		RETURN FALSE;
	END IF;
	RETURN TRUE;
END;
$$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION has_jump(id_venue_ INTEGER) RETURNS BOOLEAN AS $$ -- checking jump
BEGIN
	PERFORM * FROM k_points WHERE id_venue = id_venue_;
	IF NOT FOUND THEN
		RETURN FALSE;
	END IF;
	RETURN TRUE;
END;
$$ LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION find_best(sector_ VARCHAR(2)) RETURNS INTEGER AS $$ 
	foo_ INTEGER;
BEGIN
	IF sector_ = 'AL' THEN
		SELECT INTO foo_ FROM ranking_alpine ORDER BY points DESC LIMIT 1;
	ELSIF sector_ = 'JP' THEN
		SELECT INTO foo_ FROM ranking_jumping ORDER BY points DESC LIMIT 1;
	END If;
	RETURN foo_;
END;
$$ LANGUAGE 'plpgsql';