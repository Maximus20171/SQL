-- Целосность БД. Связи между таблицами
DESC profiles ;

ALTER TABLE profiles
	ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE;
			
ALTER TABLE scores 
	ADD CONSTRAINT scores_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id)
			ON DELETE NO ACTION
			ON UPDATE CASCADE;
			
ALTER TABLE strategy 
	ADD CONSTRAINT strategy_scores_fk
		FOREIGN KEY (score_id) REFERENCES scores(id)
			ON DELETE NO ACTION
			ON UPDATE CASCADE;

ALTER TABLE strategy DROP FOREIGN KEY strategy_dopnik_avto_fk;
ALTER TABLE strategy 
	ADD CONSTRAINT strategy_dopnik_avto_fk
		FOREIGN KEY (dopnik_avto_id) REFERENCES dopnik_avto(id);
	
ALTER TABLE strategy DROP FOREIGN KEY strategy_dopnik_signal_fk;
ALTER TABLE strategy  
	ADD CONSTRAINT strategy_dopnik_signal_fk
		FOREIGN KEY (dopnik_signal_id) REFERENCES dopnik_signal(id);

-- ALTER TABLE interest DROP FOREIGN KEY strategy_scores_fk;
ALTER TABLE interest  
	ADD CONSTRAINT interest_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE blogs  
	ADD CONSTRAINT blogs_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id);
	
ALTER TABLE comments DROP FOREIGN KEY comments_blog_id_fk, comments_user_id_fk;
ALTER TABLE comments  
	ADD CONSTRAINT comments_blog_id_fk
		FOREIGN KEY (blog_id) REFERENCES blogs(id),
	ADD CONSTRAINT comments_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id);
	
ALTER TABLE messages  
	ADD CONSTRAINT messages_from_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users(id),
	ADD CONSTRAINT messages_to_user_id_fk
		FOREIGN KEY (to_user_id) REFERENCES users(id);
	
ALTER TABLE clients_strategy  
	ADD CONSTRAINT clients_strategy_user_id_fk
		FOREIGN KEY (users_id) REFERENCES users(id),
	ADD CONSTRAINT clients_strategy_strategy_fk
		FOREIGN KEY (strategy_id) REFERENCES strategy(id);
	
	
DESC strategy;
		
		
		
		