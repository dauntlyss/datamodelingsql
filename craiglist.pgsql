
DROP DATABASE IF EXISTS craiglist_db;
CREATE DATABASE craiglist_db;
\c craiglist_db;

CREATE TABLE regions 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username VARCHAR(30) UNIQUE NOT NULL,
  password VARCHAR(30) NOT NULL,
  preferred_region INTEGER REFERENCES regions(id) ON DELETE SET NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(90) UNIQUE NOT NULL
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  location VARCHAR(50) NOT NULL,
  region_id INTEGER REFERENCES regions(id) ON DELETE SET NULL,
  category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
  post_content TEXT NOT NULL
);

INSERT INTO regions (name)
VALUES
('Seattle'),
('New York'),
('Los Angeles'),
('Miami'),
('Houston');

INSERT INTO users (username, password, preferred_region)
VALUES
('humpty09', 'yesterday1', 5),
('fingertrap4', 'googleme', 4),
('yodel503', 'horsecat', 3),
('doodle33', 'grumybum', 2),
('goldiel00x', 'holasoydora', 1);

INSERT INTO categories (name)
VALUES
('jobs'),
('housing'),
('community'),
('gigs'),
('services');

INSERT INTO posts (title, user_id, location, region_id, category_id, post_content)
VALUES
('Where the red fern grows', 1, 4, null, 1, 'Its a good book!'),
('Nightengale', 2, 'Downey', 3, 5, 'Its a great book!');

