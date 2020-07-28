-- Правка данных и их исправление. Данные залиты на сайте fulldb.info

SELECT * FROM users;
UPDATE users 
    SET updated_at = NOW() where updated_at<created_at;
UPDATE users
	SET Avatar = CONCAT('/image/avatar/', nik , '.img');
	
SELECT * FROM profiles;
UPDATE profiles 
    SET updated_at = NOW() where updated_at<created_at;

SELECT * FROM interest ORDER BY user_id;
UPDATE interest
    SET user_id = 100 where user_id=0;
UPDATE interest 
    SET updated_at = NOW() where updated_at<created_at;

SELECT * FROM scores ORDER BY user_id;
UPDATE scores
    SET trading_code = UPPER(trading_code);
UPDATE scores
    SET updated_at = NOW() where updated_at<created_at;
   
-- счета стратегий не могут быть скрытыми.
UPDATE scores 
	SET show_score = 1
	WHERE scores.id IN (SELECT score_id FROM strategy);

-- Заполнял сумму на счету
UPDATE scores
	SET summa =summa*RAND() *20+5
	WHERE summa <40000;

   
SELECT * FROM strategy;
UPDATE strategy 
	SET statistics = CONCAT('/STATISTICS/', name , '/.chl');
UPDATE strategy 
	SET min_summa = min_summa *1000;  -- увеличил пароговую сумму
-- Стратегии слишком древние получилось. 
-- Несколько раз повоторяем строчку ниже пока дата начала работы стратегии не станет больше 2005г
-- SELECT begin_date, name FROM strategy WHERE begin_date < '2005-01-01'; - для проверки.
UPDATE strategy 
	SET begin_date = ADDDATE(begin_date , INTERVAL 10 YEAR) WHERE begin_date < '2005-01-01';
UPDATE strategy 
	SET Profit = ROUND((RAND()*(YEAR(NOW())-YEAR(begin_date))*30+100-20),2) WHERE (YEAR(NOW())-YEAR(begin_date )) > 5;
UPDATE strategy 
	SET Profit = ROUND((RAND()*(YEAR(NOW())-YEAR(begin_date))*10-15),2) WHERE (YEAR(NOW())-YEAR(begin_date )) <= 5;
UPDATE strategy 
	SET prosadka= ROUND((RAND()*(YEAR(NOW())-YEAR(begin_date))*2-35),2) WHERE (YEAR(NOW())-YEAR(begin_date )) > 5;
UPDATE strategy 
	SET prosadka= ROUND((RAND()*(YEAR(NOW())-YEAR(begin_date))*10-30),2) WHERE (YEAR(NOW())-YEAR(begin_date )) <= 5;
UPDATE strategy 
	SET ita = ROUND((ita/10)+RAND()*5, 2) WHERE risk_profile = 'Агрессивный';
UPDATE strategy 
	SET ita = ROUND((ita/10)+RAND()*2, 2) WHERE risk_profile = 'Умеренный';
UPDATE strategy 
	SET ita = ROUND((ita/10)+RAND()*1, 2) WHERE risk_profile = 'Консервативный';
UPDATE strategy
	SET dopnik_avto_id = 6 WHERE dopnik_avto_id =0;
UPDATE strategy
	SET dopnik_signal_id = 6 WHERE dopnik_avto_id =0;


SELECT * FROM messages;
SELECT * FROM messages WHERE from_user_id = to_user_id;
UPDATE messages 
    SET updated_at = NOW() where updated_at<created_at;

SELECT * FROM blogs;
UPDATE blogs 
    SET updated_at = NOW() where updated_at<created_at;
  
SELECT * FROM comments;
SELECT * FROM clients_strategy ORDER BY strategy_id;
UPDATE clients_strategy
    SET updated_at = NOW() where updated_at<created_at;
UPDATE clients_strategy
    SET koef = 100 WHERE id >0 and id <94;
UPDATE clients_strategy
    SET koef = 50 WHERE id IN (15,36,23,56,55);
UPDATE clients_strategy
    SET koef = 0 WHERE id IN (10,6,40,60);

   
DESC clients_strategy;
   
-- Авторы стратегий не могут подключаться к другим стратегиям. Поэтому находим из и заменяем на случ другого клиента. Прогоняем несколько раз пока не остануться НЕ остануться не авторы.
UPDATE clients_strategy 
	SET users_id =100
	WHERE users_id IN (SELECT scores.user_id FROM strategy JOIN scores ON scores.id = strategy.score_id);
UPDATE clients_strategy 
	SET users_id =RAND()*99+1
	WHERE users_id=100;

-- Обнуляем клиентов подключенных на стратегию у которых нет счетов
UPDATE clients_strategy 
	SET users_id =NULL 
	WHERE users_id NOT IN (SELECT user_id FROM scores);

