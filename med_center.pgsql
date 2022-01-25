
DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE med_centers 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL,
  specialty VARCHAR(30) NOT NULL,
  specialty_id UNIQUE NOT NULL,
  phone VARCHAR(10)
);

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL,
  specialty_id INTEGER REFERENCES med_centers(specialty_id) ON DELETE SET NULL,
  pager VARCHAR(10),
  on_call BOOLEAN DEFAULT false,
  center_id INTEGER REFERENCES med_centers ON DELETE SET NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(90) NOT NULL,
  birthdate DATE NOT NULL, 
  phone VARCHAR(10),
  new_patient BOOLEAN DEFAULT false
--   user_id INTEGER REFERENCES users ON DELETE SET NULL,
--   name VARCHAR(15) NOT NULL,
--   description TEXT,
--   subscribers INTEGER CHECK (subscribers > 0) DEFAULT 1,
--   is_private BOOLEAN DEFAULT false
);

CREATE TABLE diseases 
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL
);


-- INSERT INTO users  (username, password)
-- VALUES
-- ('graylady',  'askldjas'),
-- ('stevie-chicks', 'asdkljasl');

-- INSERT INTO subreddits (name, user_id)
-- VALUES
-- ('chickens', 2),
-- ('waterluvers', 1);

