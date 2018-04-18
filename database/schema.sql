-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS gym;
DROP TABLE IF EXISTS checkin_checkout;
DROP TABLE IF EXISTS workout;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS workout_user;

CREATE TABLE app_user (
  user_id serial NOT NULL,
  user_name varchar(32) NOT NULL,
  password varchar(32) NOT NULL,
  salt varchar(255) NOT NULL,
  role varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  phone varchar(255),
  picture varchar(255) NOT NULL,
  fitness_goal varchar(255) NOT NULL,
  CONSTRAINT pk_app_user PRIMARY KEY (user_id)
);

CREATE TABLE gym (
  gym_id serial NOT NULL,
  name varchar(255) NOT NULL,
  CONSTRAINT pk_app_gym PRIMARY KEY (gym_id)
);

CREATE TABLE checkin_checkout (
  user_id integer NOT NULL,
  gym_id integer NOT NULL,
  check_in date NOT NULL,
  check_out date,
  CONSTRAINT fk_gym_id FOREIGN KEY (gym_id) REFERENCES gym(gym_id),
  CONSTRAINT fk_user_id FOREIGN key (user_id) REFERENCES app_user(user_id)
);

 CREATE TABLE workout (
  workout_id SERIAL NOT NULL, 
  workout_name varchar(255)  NOT NULL,
  workout_image varChar(255) NOT NULL, 
  workout_description TEXT NOT NULL,
  equipment_id integer NOT NULL, 
  CONSTRAINT pk_workout_id PRIMARY KEY (workout_id)
 );

CREATE TABLE equipment (
  equipment_id SERIAL NOT NULL,
  equipment_name varchar(255) NOT NULL,
  workout_id integer NOT NULL, 
  CONSTRAINT pk_equipment_id PRIMARY KEY (equipment_id),
  CONSTRAINT fk_workout_id FOREIGN KEY (workout_id) REFERENCES workout(workout_id)
);

 CREATE TABLE workout_user(
  reps1 integer,
  reps2 integer,
  reps3 integer,
  reps4 integer,
  number_of_sets integer,
  weight integer, 
  workout_id integer NOT NULL, 
  user_id integer NOT NULL, 
  equipment_id integer NOT NULL, 
  workout_date date,
   CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES app_user(user_id),
   CONSTRAINT fk_workout_id FOREIGN KEY (workout_id) REFERENCES workout(workout_id),
   CONSTRAINT fk_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
 );

COMMIT;