
-- 3. Кто больше поставил лайков?
SELECT COUNT(*), (SELECT gender FROM profiles WHERE user_id = likes.user_id)  AS m_f FROM likes GROUP BY m_f;


-- 4. 
SELECT 
	TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age,
	(SELECT COUNT(*) FROM likes WHERE user_id = profiles.user_id) AS 'likes',
	birthday,
	(SELECT CONCAT(first_name,' ', last_name) FROM users WHERE users.id=profiles.user_id) AS FIO
FROM profiles 
ORDER BY age 
LIMIT 10;

-- 5
-- Сортирую просто по дате последнего входя и создания аккаунта. Тем меньше был человек в сети, тем меньше активность.

SELECT
	first_name,
	last_name,
	created_at,
	updated_at,
	updated_at-created_at AS namber_of_second
FROM users
ORDER BY namber_of_second
LIMIT 10;



