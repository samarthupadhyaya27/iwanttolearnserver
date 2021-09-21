DO $$ BEGIN RAISE NOTICE 'Initializing users'; END $$;

INSERT INTO users (first_name, last_name, email, password ) values
    ('Samarth', 'Upadhyaya', 'samarthupadhyaya27@gmail.com', 'testing'),
    ('Victor', 'Wen', 'vicwen02@g.ucla.edu', 'superstrongpasswordhash');

INSERT INTO roadmaps (author_id, title) VALUES
    ((SELECT user_id FROM users WHERE first_name = 'Victor'), 'Beginner to Pro with PostgreSQL'),
    ((SELECT user_id FROM users WHERE first_name = 'Victor'), 'Typing Typescript'),
    ((SELECT user_id FROM users WHERE first_name = 'Victor'), 'NodeJS for advanced programmers');