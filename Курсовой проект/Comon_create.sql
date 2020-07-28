-- Создание БД comon.ru

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  nik VARCHAR(100) NOT NULL UNIQUE COMMENT "НИК пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  Avatar VARCHAR(100) COMMENT "Аватар",
  password VARCHAR(100) NOT NULL COMMENT "passsword",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время регистрации пользователя",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя",
	first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
	second_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
	last_name VARCHAR(100) NOT NULL COMMENT "Отчесво пользователя",
	birthday DATE COMMENT "Дата рождения",
	gender CHAR(1) NOT NULL COMMENT "Пол",
    phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
	aboute_my VARCHAR(255) COMMENT "о себе",
	aboute_work VARCHAR(100) COMMENT "род занятий",
	aboute_stock VARCHAR(100) COMMENT "о фондовом рынке",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
	) COMMENT "Профили";
	
DROP TABLE IF EXISTS interest;
CREATE TABLE interest (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	name ENUM ('Начать торговать', 'Технический аналаз', 'Фундаментальный анализ', 'Российские акции', 'Срочный рынок', 'Зарубежные рынки', 'Форекс', 'Интрадей', 'Инвестиционный портфель', 'Скальпинг', 'Механические торговые системы', 'Торговые роботы') COMMENT "интерес",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
	) COMMENT "интересы";

DROP TABLE IF EXISTS scores;
CREATE TABLE scores (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	score_type ENUM('Фондовый счет', 'Срочный счет', 'Единый счет', 'MMA') COMMENT "тип счета",
	trading_code VARCHAR(50) NOT NULL UNIQUE COMMENT "Торговый код счета",
	show_score BOOLEAN NOT NULL DEFAULT TRUE COMMENT "публичность счета",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время подключения счета",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
	) COMMENT "Торговые счета";

DROP TABLE IF EXISTS dopnik_avto;
CREATE TABLE dopnik_avto (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	Name CHAR(1) NOT NULL COMMENT "Буква допника", -- обзначаются буквами латинского алфавита https://comon.ru/info/codex/default.aspx?id=149
	percent FLOAT UNSIGNED NOT NULL COMMENT "Процент по доп соглашению"
	) COMMENT "Список доп соглашений автоследования";
	
DROP TABLE IF EXISTS dopnik_signal;
CREATE TABLE dopnik_signal (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	Name CHAR(1) NOT NULL COMMENT "Буква допника", -- обзначаются буквами латинского алфавита https://comon.ru/info/codex/default.aspx?id=149
	price INT UNSIGNED NOT NULL COMMENT "Стоимость сигнала"
	) COMMENT "Список доп соглашений сигналов";
	
DROP TABLE IF EXISTS strategy;
CREATE TABLE strategy (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя - автора стратегии",
	name VARCHAR(100) NOT NULL UNIQUE COMMENT "название стратегии",
	score_id INT UNSIGNED NOT NULL COMMENT "Ссылка на счет",
	text_message BLOB COMMENT "описание стратегии",
	statistics JSON COMMENT "Статистика по стратегии",  -- возможно сдесь сделует укзазать ссылку на файл
	min_summa INT UNSIGNED NOT NULL COMMENT "Минимальная рекоменованная сумма",
	Profit FLOAT NOT NULL DEFAULT 0 COMMENT "доходность за весь срок",
	prosadka FLOAT NOT NULL DEFAULT 0 COMMENT "Дата начала работы стратегии",
	ita FLOAT NOT NULL DEFAULT 0 COMMENT "Индекс частоты сделок", -- расчитаывается исходя из оборота по счету. Можно сделать расчетный на реальных данных
	dopnik_avto_id INT UNSIGNED NOT NULL COMMENT "Ссылка на таблицу допников на автоследования",
	avto_status BOOLEAN NOT NULL DEFAULT TRUE COMMENT "Активна ли стратегия для подключения автоследования",
	dopnik_signal_id INT UNSIGNED NOT NULL COMMENT "Ссылка на таблицу допников на сигналы",
	signal_status BOOLEAN NOT NULL DEFAULT TRUE COMMENT "Активна ли стратегия для подключения сигналов",
	risk_profile ENUM('Консервативный', 'Умеренный', 'Агрессивный') COMMENT "Риск профиль",
	begin_date DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Дата начала работы стратегии",  -- нужна только дата
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"	
	) COMMENT "Список доп соглашений сигналов";

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя - отправитель",
	to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя - получатель",
	text_message VARCHAR(255) COMMENT "сообщение",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
	) COMMENT "Сообщения";
	
DROP TABLE IF EXISTS blogs;
CREATE TABLE blogs (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	name VARCHAR(100) NOT NULL COMMENT "Название стратьи",
	text_blog BLOB(1000) COMMENT "описание стратегии",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя - автора блога",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
  	) COMMENT "Блог";
  

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	blog_id INT UNSIGNED NOT NULL COMMENT "Ссылка на блог",
	user_id INT UNSIGNED NOT NULL COMMENT 'автор комментария',
	text_message TEXT COMMENT "комметарий"
	-- нужна ссылка на коммент
	) COMMENT "Комментарий";
	
DROP TABLE IF EXISTS clients_strategy;
CREATE TABLE clients_strategy (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	strategy_id INT UNSIGNED NOT NULL COMMENT "Ссылка на стратегию",
	users_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя - автора стратегии",
	koef INT DEFAULT 100 COMMENT "коэфициент участия",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
  	) COMMENT "Таблица клиентов подключенных на стратегии";

-- Здесь собраны исправления/добавления которые выяснились во время работы
ALTER TABLE strategy DROP COLUMN user_id;  -- лишняя колонка. Задвоение информации.
ALTER TABLE scores ADD summa INT;  -- Добавление колонки "сумма на счету"
ALTER TABLE clients_strategy MODIFY COLUMN users_id INT UNSIGNED DEFAULT 0; -- Может быть 0 подписчиков на стратегию. И даже будет изначально


	
	