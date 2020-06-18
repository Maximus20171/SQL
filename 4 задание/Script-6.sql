SHOW TABLES;

SELECT * FROM users LIMIT 10;

UPDATE users SET status_id = 2 WHERE id IN (13, 22, 29, 34);
UPDATE users SET status_id = 3 WHERE id IN (33, 8, 5, 30, 90);

UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

SELECT * FROM user_statuses;

SELECT * FROM profiles LIMIT 99;

UPDATE profiles SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

UPDATE profiles SET photo_id = FLOOR(1 + RAND() * 100);

UPDATE profiles SET is_private = TRUE WHERE user_id > FLOOR(1 + RAND() * 100);

SELECT * FROM messages LIMIT 10;

UPDATE messages SET media_id = FLOOR(1 + RAND() * 100) WHERE from_user_id > FLOOR(1 + RAND() * 100);

DESC media;

SELECT * FROM media LIMIT 10;

UPDATE media SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpeg'), ('avi'), ('mpeg'), ('png');
SELECT * FROM extensions;


UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');
 
 UPDATE media SET filename = CONCAT('https://dropbox/vk/',
  (SELECT last_name FROM users WHERE id = user_id),
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);
 
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

ALTER TABLE media MODIFY COLUMN metadata JSON;

DESC friendship;
SELECT * FROM friendship LIMIT 10;

UPDATE friendship SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

UPDATE friendship SET friend_id = friend_id + 1 WHERE user_id = friend_id;

SELECT * FROM friendship_statuses;

TRUNCATE friendship_statuses;

INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
 
UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3); 

SELECT * FROM communities;

UPDATE communities SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

SELECT * FROM communities_users;

UPDATE friendship SET declined_at = (SELECT updated_at FROM users ORDER BY RAND() LIMIT 1);


