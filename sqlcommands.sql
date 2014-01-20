USE goonjDB; ALTER TABLE goonj_story MODIFY title VARCHAR(1000) CHARACTER SET UTF8;
USE goonjDB; ALTER TABLE goonj_story DROP COLUMN location_id;
USE goonjDB; ALTER TABLE goonj_story DROP FOREIGN KEY location_id_refs_location_id_85cf1c7e;
USE goonjDB; ALTER TABLE goonj_story ADD CONSTRAINT fk_StoryLocVil FOREIGN KEY (location_id) REFERENCES goonj_loc_village(id);