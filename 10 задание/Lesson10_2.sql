-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах
-- самый молодой пользователь в группе
-- самый старший пользователь в группе
-- общее количество пользователей в группе
-- всего пользователей в системе
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

SELECT DISTINCT 
	communities.name AS 'Name',
	COUNT(communities_users.user_id) OVER() /LAST_VALUE(communities_users.community_id) OVER () 'Avarage',
	FIRST_VALUE (profiles.birthday) OVER (PARTITION BY communities_users.community_id ORDER BY profiles.birthday) AS 'Old',
	FIRST_VALUE (profiles.birthday) OVER (PARTITION BY communities_users.community_id ORDER BY profiles.birthday DESC) AS 'Young',
	COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id) AS 'In_group',
	COUNT(communities_users.user_id) OVER() AS 'All',
	COUNT(communities_users.user_id) OVER(PARTITION BY communities_users.community_id)/COUNT(communities_users.user_id) OVER()*100 AS '%%'
	FROM communities_users
		JOIN communities
			ON communities_users.community_id= communities.id
		JOIN profiles
			ON communities_users.user_id= profiles.user_id;



