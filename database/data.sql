-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('admin', 'W3atL7lo6cUFgkOaGZgrKg==', 'E7cYwFbDHxnVSQxH87HmmNfGhUWVXzGCsp+0Tp7/uBewpitZvLdfhQll8bF16DgYcRWBnkZq8xDmep11ay884w49ygT4XOt7wZIk36bLN/DdLEhwB3gg0oWT56eFdGAwhTMQz3EzRojiRwligxQfJ7OlToDq/dXAxv6NqCYvpeI=', 'admin', 'admin@wocompanion.com', '', 'm06.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('Drew', 'BYqPlOrwJiqbF5iRzAFibg==', 'JjC1XL+IfZGJVx3qpaJ6zNGGAmVa/Kz5PB1ShS9bDu7jzb4r+l7XeNTg0MB3z77NPLwZ3vWPL3kZAnVDV3h9jSagjwuctX22ewdvKuFGO4WfICR2SV6igqCoAhXeMtNp77s61axRY0FkqVIZJiABXsalyPYunh5gepMjf76W/yk=', 'user', 'ajborkowski1031@gmail.com', '', 'm05.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('Bryan', 'AssXfSZq//vNoEq26JvajA==', 'OGh2V+t4sqhOr24IdPJP5DDu1glHVxlfRf2NmA/O6Oz/zFFs3AhleyVlOY6Juy4Xi99esvi2YRxZo5/zWfM8eH6TmLnPAkjyQQvhuJMZJuZESFjeIv2nG+brlxrLkv4jwCDQFK8jsQ9x/G9tGbTc41uoL3KRUUwlCEon9McNStE=', 'user', 'bpurakal@gmail.com', '', 'm05.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('Greg', '2MH6CTyuVGeMUaIdQ+682Q==', '9KiAFKtTG2Ayf5QiEgpz4aq2xn7spV7NglwtoRoqpBtlcxoEKH+Myre9ZqJTPZGByAXEASgC5q1Fo5WSqGybNC4a6Hxx6hxnenDsZ5BxCgNTDOIvhIRJlKap+oVOOWLqqjjH4u7iXn5eFSExDOoFl9h7RWom7YOldxVJdO8SgTk=', 'user', 'gregs@email.com', '', 'm04.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('James', 'Jd4Gz2svLEgxxjzgo6fF7A==', 'eW2xShApr2mXBo790L9V7OG45wy/5oD94a9pNgE+ScT1W6RZbGvn8nABHlL5tnzb3IuL9Xrk/ieSUjfSVOZ5mVVFtm6beCV83h1BXS0tB+7dS+dH0AvKv3nM3P1tB2cGno/UZjUiGuEGojn7b4D02lj+yQAGKPMFLjoH56iVyHY=', 'user', 'james@email.com', '', 'm00.png', 'maintain weight');


INSERT INTO gym (name) VALUES ('SlimGym');
INSERT INTO gym (name) VALUES ('Elevated Gainz');


INSERT INTO WORKOUT (workout_name, workout_image, workout_description, equipment_id)
VALUES ('Bench Press', 'benchpress', 'The person performing the exercise lies on their back on a bench with a weight grasped in both hands. They push the weight upwards until their arms are extended, not allowing the elbows to lock. They then lower the weight to chest level. This is one repetition (rep).', 4);

INSERT INTO WORKOUT (workout_name, workout_image, workout_description, equipment_id)
VALUES ('Dumbbell Row', 'dumbbellrow', 'Pull the weight toward your hip, keeping your elbow in close as you flex your back, bend your arm and bring your shoulder upward. At the top, your elbow should be pointed toward the ceiling as you squeeze your shoulder blades together. Lower the dumbbell under control along the same path. Complete your reps for one side, then switch arms and do the same amount of reps for the other — that’s one set.', 4);

INSERT INTO WORKOUT (workout_name, workout_image, workout_description, equipment_id)
VALUES ('Squat', 'squat', 'You Squat by bending your hips and knees while the bar rests on your upper-back. Squat down until your hips are below your knees. Keep your knees out and lower back neutral. Then Squat back up. Lock your hips and knees at the top.', 2);

INSERT INTO WORKOUT (workout_name, workout_image, workout_description, equipment_id)
VALUES ('Pullup', 'pullup', 'Proper Pullup form starts hanging on a pullup bar. Grip the bar shoulder-width apart with straight arms. Pull yourself up by pulling your elbows to the floor. Keep pulling until your chin passes the bar. Lower yourself all the way down until your arms are straight. Then pull yourself up again.', 2);

INSERT INTO WORKOUT (workout_name, workout_image, workout_description, equipment_id)
VALUES ('Kettlebell Swing', 'kbswing', 'The kettlebell is swung from just below the groin to somewhere between the upper abdomen and shoulders, with arms straight or slightly bent, the degree of flexion depends on the trajectory of the kettlebell. The key to a good kettlebell swing is effectively thrusting the hips, not bending too much at the knees and sending the weight forwards, as opposed to squatting the weight up, or lifting up with the arms.', 3);

INSERT INTO WORKOUT (workout_name, workout_image, workout_description, equipment_id)
VALUES ('Russian Twist', 'russianTwist', 'Lie down on the floor placing your feet either under something that will not move or by having a partner hold them. Your legs should be bent at the knees. Elevate your upper body so that it creates an imaginary V-shape with your thighs.', 3);


INSERT INTO EQUIPMENT (equipment_name, workout_id) 
VALUES ('None', 1);

INSERT INTO EQUIPMENT (equipment_name, workout_id) 
VALUES ('Power Rack', 2);

INSERT INTO EQUIPMENT (equipment_name, workout_id) 
VALUES ('Kettle Bell', 3);

INSERT INTO EQUIPMENT (equipment_name, workout_id) 
VALUES ('Flat Bench', 4);

INSERT INTO WORKOUT_USER (reps1, reps2, reps3, reps4, number_of_sets, weight, workout_id, user_id, equipment_id)
VALUES (4, 4, 5, 5, 5, 100, 1, 1, 1);

INSERT INTO WORKOUT_USER (reps1, reps2, reps3, reps4, number_of_sets, weight, workout_id, user_id, equipment_id)
VALUES (3, 3, 3, 2, 4, 100, 1, 1, 1);

 COMMIT;