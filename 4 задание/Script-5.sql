SHOW TABLES;

DESC profiles;

ALTER TABLE profiles ADD photo_id INT UNSIGNED AFTER user_id;


CREATE TABLE user_statuses (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(150) NOT NULL UNIQUE);

INSERT user_statuses (id, name)
VALUES (1, 'active'), (2, 'blocked'), (3, 'deleted');
ALTER TABLE users ADD status_id INT UNSIGNED NOT NULL DEFAULT 1 AFTER phone;

ALTER TABLE profiles ADD is_private BOOLEAN DEFAULT FALSE AFTER country;


ALTER TABLE messages ADD COLUMN media_id INT UNSIGNED AFTER body;

ALTER TABLE friendship ADD COLUMN declined_at DATETIME AFTER confirmed_at;

ALTER TABLE friendship DROP COLUMN requested_at;