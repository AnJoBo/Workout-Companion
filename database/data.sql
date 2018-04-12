-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('admin', 'W3atL7lo6cUFgkOaGZgrKg==', 'E7cYwFbDHxnVSQxH87HmmNfGhUWVXzGCsp+0Tp7/uBewpitZvLdfhQll8bF16DgYcRWBnkZq8xDmep11ay884w49ygT4XOt7wZIk36bLN/DdLEhwB3gg0oWT56eFdGAwhTMQz3EzRojiRwligxQfJ7OlToDq/dXAxv6NqCYvpeI=', 'admin', 'admin@wocompanion.com', '', 'maleImg.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('Drew', 'BYqPlOrwJiqbF5iRzAFibg==', 'JjC1XL+IfZGJVx3qpaJ6zNGGAmVa/Kz5PB1ShS9bDu7jzb4r+l7XeNTg0MB3z77NPLwZ3vWPL3kZAnVDV3h9jSagjwuctX22ewdvKuFGO4WfICR2SV6igqCoAhXeMtNp77s61axRY0FkqVIZJiABXsalyPYunh5gepMjf76W/yk=', 'user', 'ajborkowski1031@gmail.com', '', 'maleImg.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('Bryan', 'AssXfSZq//vNoEq26JvajA==', 'OGh2V+t4sqhOr24IdPJP5DDu1glHVxlfRf2NmA/O6Oz/zFFs3AhleyVlOY6Juy4Xi99esvi2YRxZo5/zWfM8eH6TmLnPAkjyQQvhuJMZJuZESFjeIv2nG+brlxrLkv4jwCDQFK8jsQ9x/G9tGbTc41uoL3KRUUwlCEon9McNStE=', 'user', 'bpurakal@gmail.com', '', 'maleImg.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('Greg', '2MH6CTyuVGeMUaIdQ+682Q==', '9KiAFKtTG2Ayf5QiEgpz4aq2xn7spV7NglwtoRoqpBtlcxoEKH+Myre9ZqJTPZGByAXEASgC5q1Fo5WSqGybNC4a6Hxx6hxnenDsZ5BxCgNTDOIvhIRJlKap+oVOOWLqqjjH4u7iXn5eFSExDOoFl9h7RWom7YOldxVJdO8SgTk=', 'user', 'gregs@email.com', '', 'maleImg.png', 'maintain weight');

INSERT INTO app_user (user_name, password, salt, role, email, phone, picture, fitness_goal)
VALUES ('James', 'Jd4Gz2svLEgxxjzgo6fF7A==', 'eW2xShApr2mXBo790L9V7OG45wy/5oD94a9pNgE+ScT1W6RZbGvn8nABHlL5tnzb3IuL9Xrk/ieSUjfSVOZ5mVVFtm6beCV83h1BXS0tB+7dS+dH0AvKv3nM3P1tB2cGno/UZjUiGuEGojn7b4D02lj+yQAGKPMFLjoH56iVyHY=', 'user', 'james@email.com', '', 'maleImg.png', 'maintain weight');


INSERT INTO gym (name) VALUES ('SlimGym');
INSERT INTO gym (name) VALUES ('Elevated Gainz');

COMMIT;