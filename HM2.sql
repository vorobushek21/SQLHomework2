CREATE TABLE employee (
                          id BIGSERIAL NOT NULL PRIMARY KEY,
                          first_name VARCHAR(50) NOT NULL,
                          last_name VARCHAR(50) NOT NULL,
                          gender VARCHAR(6) NOT NULL,
                          age INT NOT NULL
);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES('Ivan', 'Kyznecov', 'Man', 34);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES('Lois', 'Ramirez', 'Woman', 22);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES('Jesse', 'Vargas', 'Man', 51);
SELECT * FROM employee;
UPDATE employee SET
                    first_name = 'Gosha',
                    last_name = 'Petuhov',
                    gender = 'Chad',
                    age = 99
WHERE id = 2;
SELECT * FROM employee;
INSERT INTO employee(first_name, last_name, gender, age)
VALUES('Stepan','Razin','Man',29);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES('Kirill','Kosoy','Man',17);
SELECT first_name as Имя,
       last_name as Фамилия
FROM employee;
UPDATE employee SET
                    first_name = 'Nastya',
                    last_name = 'Cherysheva',
                    gender = 'Woman',
                    age = 40
WHERE id = 2;
SELECT * FROM employee
WHERE age BETWEEN 30 AND 50;
SELECT * FROM employee
WHERE age <30 OR age >50;
SELECT * FROM employee
ORDER BY last_name DESC;
SELECT * FROM employee
WHERE NOT first_name LIKE '____';
UPDATE employee SET
                    first_name = 'Jesse',
                    last_name = 'Cherysheva',
                    gender = 'Woman',
                    age = 40
WHERE id = 2;
UPDATE employee SET
    first_name = 'Ivan'
WHERE id = 4;
SELECT * FROM employee;
UPDATE employee SET
    gender = 'Woman'
WHERE id = 3;
SELECT first_name as Имя,
       SUM(age) as Суммарный_возраст
FROM employee
GROUP BY first_name;
SELECT first_name,
       age
FROM employee
WHERE age = (SELECT MIN(age) FROM employee);
SELECT first_name,
       MAX(age)
FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY MAX(age);

CREATE TABLE city(
                     city_id BIGSERIAL NOT NULL PRIMARY KEY,
                     city_name VARCHAR(50) NOT NULL
);

ALTER TABLE employee ADD city_id INT;
ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES  city(city_id);

INSERT INTO city (city_name)
VALUES ('Нижний Новгород'), ('Питер'), ('Астрахань'), ('Крым'), ('Сочи'), ('Москва');

UPDATE employee SET city_id = '1' WHERE id = 1;
UPDATE employee SET city_id = '3' WHERE id = 5;
UPDATE employee SET city_id = '4' WHERE id = 4;
UPDATE employee SET city_id = '2' WHERE id = 3;
UPDATE employee SET city_id = '4' WHERE id = 6;
UPDATE employee SET city_id = '1' WHERE id = 7;
UPDATE employee SET city_id = '5' WHERE id = 8;

SELECT employee.first_name, employee.last_name, city.city_name
FROM employee
         JOIN city ON employee.city_id = city.city_id;

SELECT city.city_name, employee.first_name, employee.last_name
FROM city
         LEFT JOIN employee ON employee.city_id = city.city_id;

SELECT employee.first_name, city.city_name
FROM employee
         FULL OUTER JOIN city ON employee.city_id = city.city_id;

SELECT employee.first_name, city.city_name
FROM employee
         CROSS JOIN city;

SELECT city_name
FROM city
         LEFT JOIN employee ON employee.city_id = city.city_id
WHERE employee.city_id IS NULL;
