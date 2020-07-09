-- 1. Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.
SELECT * FROM target_types;
SELECT * FROM likes ORDER BY user_id;
SELECT * FROM profiles;
SELECT * FROM friendship;
SELECT * FROM friendship_statuses;
SELECT * FROM posts;
SELECT * FROM media ORDER BY user_id;

-- DESC posts;


CREATE INDEX messages_from_user_id_to_user_id_idx ON messages (from_user_id, to_user_id);

CREATE INDEX profiles_country_idx ON profiles(country);

CREATE INDEX profile_city_idx ON profiles(city);

CREATE INDEX friendship_friend_id_status_id_idx ON friendship (friend_id, status_id);



