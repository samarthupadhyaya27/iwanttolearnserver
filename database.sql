--CREATE TABLE users(
--	user_id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
--first_name VARCHAR(255) NOT NULL,
--last_name VARCHAR(255) NOT NULL,
--email varchar(255) NOT NULL UNIQUE,
--password VARCHAR(255) NOT NULL
--);

INSERT INTO users (first_name, last_name, email, password ) values
('Samarth', 'Upadhyaya', 'samarthupadhyaya27@gmail.com', 'testing');
