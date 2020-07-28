-- Список 10ти самых доходных стратегий к тором можно подключиться
SELECT name, Profit, min_summa, prosadka, risk_profile FROM strategy WHERE avto_status =1 ORDER BY Profit DESC LIMIT 10;

-- Список yспешних управляющих  
SELECT name, Profit , prosadka , nik, begin_date, CONCAT(first_name, ' ',last_name) AS fio
	FROM strategy
		JOIN scores ON scores.id = strategy.score_id
		JOIN users ON scores.user_id = users.id
		JOIN profiles ON profiles.user_id=users.id
			WHERE  Profit >0
			ORDER BY Profit DESC;

-- сумма инвестиций в стратегии.
SELECT name AS 'strategy', Profit, SUM(scores.summa) AS 'summa', COUNT(users_id) AS 'investors'
	FROM clients_strategy
		LEFT JOIN strategy ON strategy_id = strategy.id 
		LEFT JOIN scores ON users_id = scores.user_id 
			GROUP BY name
			ORDER BY summa DESC;
		
-- ТОП-10 Самый популярный автор- БЛОГЕР
SELECT CONCAT(first_name, ' ',last_name) AS fio, COUNT( blogs.id) AS blogsNumber
	FROM strategy 
		JOIN scores ON scores.id = strategy.score_id 
		JOIN profiles ON scores.user_id =profiles.user_id
		JOIN blogs ON blogs.user_id = scores.user_id 
			WHERE blogs.user_id = scores.user_id and strategy.score_id = scores.id
			GROUP BY fio
			ORDER BY blogsNumber DESC 
			LIMIT 10;
		
		
		
			
		
	
			