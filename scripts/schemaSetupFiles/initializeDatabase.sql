DO $$ BEGIN RAISE NOTICE 'Initializing users'; END $$;

INSERT INTO users (first_name, last_name, email, password ) values
    ('Samarth', 'Upadhyaya', 'samarthupadhyaya27@gmail.com', 'testing');