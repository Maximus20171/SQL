DESC profiles;

ALTER TABLE profiles
	ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT profiles_photo_id_fk
		FOREIGN KEY (photo_id) REFERENCES media(id)
			ON DELETE SET NULL;

DESC media;

ALTER TABLE media
	ADD CONSTRAINT media_media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types(id); -- Удаление типов данных пока запрещенно. Поэтому не прописывал ON DELETE

DESC users;
SELECT * FROM communities_users;

ALTER TABLE users
	ADD CONSTRAINT user_user_statuses_fk
		FOREIGN KEY (status_id) REFERENCES user_statuses(id);   -- Удаление статусов запрещенно.

DESC communities_users;
SELECT * FROM communities;

ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_users_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE,
	ADD CONSTRAINT communities_users_communities_fk
		FOREIGN KEY (community_id) REFERENCES communities(id);

DESC messages;

ALTER TABLE messages
	ADD CONSTRAINT messages_from_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users(id),
	ADD CONSTRAINT messages_to_user_id_fk
		FOREIGN KEY (to_user_id) REFERENCES users(id),
	ADD CONSTRAINT messages_media_id_fk
		FOREIGN KEY (media_id) REFERENCES media(id);
	
DESC friendship;

ALTER TABLE friendship
	ADD CONSTRAINT friendship_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT friendship_friend_id_fk
		FOREIGN KEY (friend_id) REFERENCES users(id),
	ADD CONSTRAINT friendship_status_id_fk
		FOREIGN KEY (status_id) REFERENCES friendship_statuses(id);

SELECT * FROM likes;

ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT likes_target_id_fk
		FOREIGN KEY (target_id) REFERENCES posts(id),
	ADD CONSTRAINT likes_target_type_id_fk
		FOREIGN KEY (target_type_id) REFERENCES target_types(id);

DESC posts;
DESC communities;


ALTER TABLE posts
	ADD CONSTRAINT post_user_id_kf
		FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT post_community_id_kf
		FOREIGN KEY (community_id) REFERENCES communities(id),
	ADD CONSTRAINT post_media_id_kf
		FOREIGN KEY (media_id) REFERENCES media(id);
		
	



