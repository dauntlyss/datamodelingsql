
DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE med_centers 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  specialty VARCHAR(30) NOT NULL,
  specialty_id SERIAL UNIQUE NOT NULL,
  phone VARCHAR(12)
);

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL,
  specialty INTEGER REFERENCES med_centers(specialty_id) ON DELETE SET NULL,
  pager VARCHAR(12),
  on_call BOOLEAN DEFAULT false,
  center_id INTEGER REFERENCES med_centers ON DELETE SET NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(90) NOT NULL,
  birthdate DATE NOT NULL, 
  phone VARCHAR(12),
  new_patient BOOLEAN DEFAULT false
);

CREATE TABLE diseases 
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  pt_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  doc_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
  diagnosis1_id INTEGER REFERENCES diseases(id) ON DELETE SET NULL,
  diagnosis2_id INTEGER REFERENCES diseases(id) ON DELETE SET NULL,
  center_id INTEGER REFERENCES med_centers ON DELETE SET NULL,
  visit_date DATE
);

INSERT INTO med_centers (name, specialty, phone)
VALUES
('Army Medical Center',	'General', '555-555-5555'),
('St Francis Clinic', 'Geriatric', '555-555-5556'),
('Ears Ears Ears', 'ENT', '555-555-5557');

INSERT INTO doctors (name, specialty, pager, on_call, center_id)
VALUES
('Dr. Doe',	1, '555-555-5555', true, 1),
('Dr. Crenshaw', 3, '555-555-5554', false, 3),
('Dr. Harris', 2, '555-555-5553', true, 2),
('Dr. Halim', 3, '555-555-5552', false, 3),
('Dr. Khlo', 2, '555-555-5551', false, 2);

INSERT INTO patients (name, birthdate, phone, new_patient)
VALUES
('Jane Doe', '01-30-1991', '555-555-5555', true),
('Emily Rogan', '01-30-1991', '555-255-5556', false),
('Jane Holden', '01-30-1991', '555-535-5553', true),
('Emily Georrge', '01-30-1991', '555-555-5545', false),
('Danny Franks', '01-30-1991', '555-555-5557', true);

INSERT INTO diseases (name)
VALUES
('GERD'),
('Acid Reflux'),
('Hearing Loss'),
('Cold/Flu'),
('Migraine');

INSERT INTO visits (pt_id, doc_id, diagnosis1_id, diagnosis2_id, center_id, visit_date)
VALUES
(2, 1, 4, null, 1, '1-1-2021'),
(2, 3, 3, null, 3, '1-2-2021');
