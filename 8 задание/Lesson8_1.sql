
-- 1. Кто больше поставил лайков?
-- вариант 6го задания
SELECT COUNT(*), (SELECT gender FROM profiles WHERE user_id = likes.user_id)  AS m_f FROM likes GROUP BY m_f;

-- через JOIN
SELECT gender, COUNT(*) AS namber
	FROM likes
		JOIN profiles
			ON profiles.user_id = likes.user_id
			GROUP BY gender
			ORDER BY namber DESC;


-- 2. Подсчитать общее количество лайков десяти самым молодым пользователям (сколько лайков получили 10 самых молодых пользователей)
-- Вариант 6ого задания.
SELECT 
	TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age,
	(SELECT COUNT(*) FROM likes WHERE target_id = profiles.user_id) AS 'likes',
	birthday,
	(SELECT CONCAT(first_name,' ', last_name) FROM users WHERE users.id=profiles.user_id) AS FIO
FROM profiles 
ORDER BY age 
LIMIT 10;

-- через JOIN
SELECT 
	-- profiles.user_id,
	TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age,
	birthday, CONCAT(first_name,' ', last_name) AS FIO,
	COUNT(target_id) AS 'likes'
	FROM profiles
		LEFT JOIN likes
			ON profiles.user_id = likes.target_id
		JOIN users
			ON users.id=profiles.user_id
				GROUP BY profiles.user_id
				ORDER BY age 
				LIMIT 10;
	

-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.     
SELECT 
  CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) + 
	(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
	(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity 
	  FROM users
	  ORDER BY overall_activity
	  LIMIT 10;

-- через JOIN 
SELECT
	CONCAT(first_name, ' ', last_name) AS user,
	COUNT(likes.user_id) + COUNT(media.user_id)+ COUNT(messages.from_user_id) AS overall_activity 
	FROM users
	LEFT JOIN likes
		ON likes.user_id = users.id
	LEFT JOIN media
		ON media.user_id = users.id
	LEFT JOIN messages
		ON messages.from_user_id = users.id
			GROUP BY users.id
			ORDER BY overall_activity
	  		LIMIT 10;



