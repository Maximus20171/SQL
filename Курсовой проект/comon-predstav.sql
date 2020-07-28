CREATE VIEW best_strategys AS
SELECT 
	name AS 'Название',
	Profit,
	prosadka,
	risk_profile,
	users.nik,
	COUNT(clients_strategy.users_id) AS investors
FROM strategy 
	LEFT JOIN scores ON scores.id = strategy.score_id 
	LEFT JOIN users ON users.id = scores.user_id
	JOIN clients_strategy ON strategy_id = strategy.id 
		GROUP BY name 
		ORDER by Profit DESC ,investors DESC;

	
CREATE VIEW blogs_and_comments AS
SELECT 
	name,
	users.nik AS avtor_blog,
	text_blog AS blog,
	comments.text_message AS comment,
	(SELECT users.nik FROM users WHERE comments.user_id=users.id) AS comment_avtor
FROM blogs 
	LEFT JOIN comments ON comments.blog_id =blogs.id 
	LEFT JOIN users ON users.id = blogs.user_id;
	
	