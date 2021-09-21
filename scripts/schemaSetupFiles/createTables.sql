DO $$ BEGIN RAISE NOTICE 'Creating tables'; END $$;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE users(
	user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE roadmaps(
    map_Id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    author_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    CONSTRAINT fk_author
        FOREIGN KEY(author_id) 
            REFERENCES users(user_id)
            ON DELETE CASCADE
);