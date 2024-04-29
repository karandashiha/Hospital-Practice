Створюємо БД "Лікарня":

create database hospital;
_____________________________________________________
Робимо першу таблицю "Пацієнти":

create table hospital.patients(
id INTEGER NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  gender VARCHAR(50) NOT NULL,
  phone VARCHAR(180) NOT NULL,
  PRIMARY KEY (id)
);
_____________________________________________________
Робимо другу таблицю "Лікарі":

create table hospital.doctors(
id INTEGER NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  specialization VARCHAR(128) NOT NULL,
  phone VARCHAR(180) NOT NULL,
  PRIMARY KEY (id)
);
_____________________________________________________
Створюємо останню таблицю "Запис" завдяки які буде
здійснуватися запис пацієнтів до лікаря:

create table hospital.appointments(
id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
	FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

///////////////////////////////////////////////////

Заповнемо таблицю лікарів до яких можно буде
записатись:

insert into hospital.doctors (first_name, last_name, specialization, phone)
Values
("Alex","Miller","Cardiologist","788 555-9742"),
("Olivia","Green","Pediatrician","477 334-4788"),
("Oscar","Young","Neurologist","123 654-2756"),З
("Anna","Wilson","Psychologist","145 777-8914"),
("Emma","Hall","Radiologist","999 2138-0664"),
("Oliver","Thomas","Traumatologist","051 115-0541"),
("Jacob","Smith","Dentist","478 020-3342");
