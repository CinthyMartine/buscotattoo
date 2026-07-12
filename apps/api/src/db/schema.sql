CREATE TABLE tattoo_artists (
id_artists SERIAL PRIMARY KEY,
name_artists VARCHAR(50) NOT NULL,
instagram_handle VARCHAR(50) NOT NULL UNIQUE,
description TEXT,
city VARCHAR(50) NOT NULL,
region VARCHAR(100) NOT NULL,
latitude DECIMAL(9,6),
longitude DECIMAL(9,6),
created_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE categories(
id_categories SERIAL PRIMARY KEY,
name_categories VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE artist_categories(
id_artists INT NOT NULL,
id_categories INT NOT NULL,
PRIMARY KEY (id_artists, id_categories),
FOREIGN KEY(id_artists) REFERENCES tattoo_artists(id_artists) ON DELETE CASCADE,
FOREIGN KEY(id_categories) REFERENCES categories(id_categories) ON DELETE CASCADE
);

CREATE TABLE reviews(
id_reviews SERIAL PRIMARY KEY,
id_artists INT NOT NULL,
author_name VARCHAR(50) NOT NULL,
rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
comment TEXT,
created_at DATE DEFAULT CURRENT_DATE,
FOREIGN KEY(id_artists) REFERENCES tattoo_artists(id_artists)ON DELETE CASCADE
);