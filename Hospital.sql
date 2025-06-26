-- create new database for hospital management system
create database hospitalSystem
go
-- use the database 
use hospitalSystem

-- create table for Patients
create table Patients (
patient_ID int primary key,
Fname nvarchar (50) not null,
Lname nvarchar (50) not null,
DOB date check (DOB <= getdate()),
gender nvarchar (10) check ( gender in ('Male','Female'))
);

-- create table for Patients contact 
create table Patients_contact_info (
patient_ID int,
contact_info nvarchar (20) not null,
foreign key (patient_ID) references Patients(patient_ID)
);

-- create table for Billing
create table Billing (
Bill_ID int primary key,
Total_cost DECIMAL(10,2),
services nvarchar (50),
Bill_date date, 
patient_ID int,
foreign key (patient_ID) references Patients(patient_ID)
);

-- create table for Medical Records
create table MedicalRecords (
Records_ID int primary key,
Diagnosis nvarchar (100),
treatment_plans nvarchar (100),
date date,
notes text,
patient_ID int,
foreign key (patient_ID) references Patients(patient_ID)
);

-- create table for Rooms
create table Rooms (
Room_number int primary key,
type nvarchar (50) check (type in ('ICU','General','Private')),
availability nvarchar (20) Default 1
);

-- create table for Admissions
create table Admissions (
Admissions_ID int primary key,
date_in date,
date_out date,
Room_number int,
patient_ID int,
foreign key (Room_number) references Rooms(Room_number),
foreign key (patient_ID) references Patients(patient_ID)
);

-- create table for Departments
create table Departments (
Dep_ID int primary key,
Dep_name nvarchar (50)
);

-- create table for Doctors
create table Doctors (
Doctor_ID int primary key,
Doctor_Name nvarchar (50) not null,
specialization nvarchar (50),
Dep_ID int,
foreign key (Dep_ID) references Departments(Dep_ID)
);

-- create table for Doctors contact 
create table Doctors_contact_info (
Doctor_ID int,
contact_info nvarchar (50) not null,
foreign key (Doctor_ID) references Doctors(Doctor_ID)
);

-- create table for Appointments
create table Appointments (
Appointment_ID int primary key,
time time,
date_in date,
date_out date,
patient_ID int,
Doctor_ID int,
foreign key (patient_ID) references Patients(patient_ID),
foreign key (Doctor_ID) references Doctors(Doctor_ID)
);

-- create table for Users
create table Users (
username nvarchar (50) primary key,
password nvarchar (50),
role nvarchar (50)
);

-- create table for User Staff
create table User_Staff  (
username nvarchar (50) primary key,
staff_ID int,
foreign key (staff_ID) references Staff(staff_ID),
foreign key (username) references Users(username)
);

-- create table for User Doctor
create table User_Doctor  (
username nvarchar (50) primary key,
Doctor_ID int,
foreign key (Doctor_ID) references Doctors(Doctor_ID),
foreign key (username) references Users(username)
);

-- create table for Staff
create table Staff (
staff_ID int primary key,
Staff_Fname nvarchar (50) not null,
Staff_Lname nvarchar (50) not null ,
salary DECIMAL(10,2),
shift nvarchar (20),
role nvarchar (20),
Dep_ID int,
foreign key (Dep_ID) references Departments(Dep_ID)
);

-- create table for Staff contact
create table Staff_contact_info (
staff_ID int,
contact_info nvarchar (50) not null,
foreign key (staff_ID) references Staff(staff_ID)
);
--------------------------------------------------------------------------------------------------

-- insert data to Patients table
INSERT INTO Patients (patient_ID, Fname, Lname, DOB, gender) VALUES
(1, 'Ali', 'Said', '1990-01-01', 'Male'),
(2, 'Sara', 'Nasser', '1985-05-10', 'Female'),
(3, 'Omar', 'Khaled', '1978-03-20', 'Male'),
(4, 'Layla', 'Ahmed', '1995-12-25', 'Female'),
(5, 'Nasser', 'Saleh', '2001-07-07', 'Male'),
(6, 'Fatima', 'Hassan', '1992-03-14', 'Female'),
(7, 'Khalid', 'Jabir', '1988-08-30', 'Male'),
(8, 'Noor', 'Yousef', '1999-11-02', 'Female'),
(9, 'Huda', 'Zayed', '1980-06-18', 'Female'),
(10, 'Ahmed', 'Naji', '1993-04-04', 'Male'),
(11, 'Salma', 'Amin', '1996-07-19', 'Female'),
(12, 'Yasir', 'Qasim', '1987-12-12', 'Male'),
(13, 'Rania', 'Basim', '1990-05-15', 'Female'),
(14, 'Mohammed', 'Tariq', '1982-02-28', 'Male'),
(15, 'Mona', 'Hussein', '1994-09-22', 'Female'),
(16, 'Ibrahim', 'Sami', '1989-10-10', 'Male'),
(17, 'Amal', 'Salem', '2000-01-30', 'Female'),
(18, 'Zaid', 'Omar', '1997-06-01', 'Male'),
(19, 'Dina', 'Fahad', '1986-03-11', 'Female'),
(20, 'Hassan', 'Rashid', '1991-08-08', 'Male');

-- view Patients table with data
use hospitalSystem
SELECT * FROM Patients;

-- insert data to Patients contact table
INSERT INTO Patients_contact_info (patient_ID, contact_info) VALUES
(1, '99887766'), (1, '91112233'),
(2, '91234567'),
(3, '90112233'), (3, '91118888'),
(4, '92334455'), (4, '92221111'),
(5, '94556677'),
(6, '96611223'),
(7, '97722334'),
(8, '98833445'),
(9, '99944556'),
(10, '91155667'),
(11, '92266778'),
(12, '93377889'),
(13, '94488990'),
(14, '95599001'),
(15, '96610112'),
(16, '97721223'),
(17, '98832334'),
(18, '99943445'),
(19, '91154556'),
(20, '92265667');

-- view Patients contact table with data
use hospitalSystem
SELECT * FROM Patients_contact_info;

-- insert data to Departments table
INSERT INTO Departments (Dep_ID, Dep_name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Endocrinology'),
(4, 'Orthopedics'),
(5, 'Pediatrics'),
(6, 'Dermatology'),
(7, 'Oncology'),
(8, 'Gastroenterology'),
(9, 'Psychiatry'),
(10, 'Radiology'),
(11, 'Urology'),
(12, 'Ophthalmology'),
(13, 'ENT'),
(14, 'Nephrology'),
(15, 'Surgery'),
(16, 'Emergency'),
(17, 'Rehabilitation'),
(18, 'Pulmonology'),
(19, 'Hematology'),
(20, 'Immunology');

-- view Departments table with data
use hospitalSystem
SELECT * FROM Departments;

-- insert data to Doctors table
INSERT INTO Doctors (Doctor_ID, Doctor_Name, specialization, Dep_ID) VALUES
(1, 'Dr. Nasser', 'Cardiology', 1),
(2, 'Dr. Latifa', 'Neurology', 2),
(3, 'Dr. Khaled', 'Endocrinology', 3),
(4, 'Dr. Waleed', 'Orthopedics', 4),
(5, 'Dr. Huda', 'Pediatrics', 5),
(6, 'Dr. Sami', 'Dermatology', 6),
(7, 'Dr. Aisha', 'Oncology', 7),
(8, 'Dr. Bassam', 'Gastroenterology', 8),
(9, 'Dr. Maha', 'Psychiatry', 9),
(10, 'Dr. Salem', 'Radiology', 10),
(11, 'Dr. Heba', 'Urology', 11),
(12, 'Dr. Tariq', 'Ophthalmology', 12),
(13, 'Dr. Nour', 'ENT', 13),
(14, 'Dr. Ziad', 'Nephrology', 14),
(15, 'Dr. Laila', 'Surgery', 15),
(16, 'Dr. Omar', 'Emergency', 16),
(17, 'Dr. Manal', 'Rehabilitation', 17),
(18, 'Dr. Adnan', 'Pulmonology', 18),
(19, 'Dr. Reem', 'Hematology', 19),
(20, 'Dr. Fadi', 'Immunology', 20);

-- view Doctors table with data
use hospitalSystem
SELECT * FROM Doctors;

-- insert data to Doctors contact table
INSERT INTO Doctors_contact_info (Doctor_ID, contact_info) VALUES
(1, '91110000'), (1, '91110001'),
(2, '92220000'),
(3, '93330000'), (3, '93330001'),
(4, '94440000'),
(5, '95550000'),
(6, '96660000'),
(7, '97770000'),
(8, '98880000'),
(9, '99990000'),
(10, '91111111'),
(11, '92222222'),
(12, '93333333'),
(13, '94444444'),
(14, '95555555'),
(15, '96666666'),
(16, '97777777'),
(17, '98888888'),
(18, '99999999'),
(19, '90000000'),
(20, '90111111');

-- view Doctors contact table with data
use hospitalSystem
SELECT * FROM Doctors_contact_info;

-- insert data to Rooms table
INSERT INTO Rooms (Room_number, type, availability) VALUES
(101, 'ICU', 'Yes'),
(102, 'General', 'Yes'),
(103, 'Private', 'No'),
(104, 'ICU', 'Yes'),
(105, 'General', 'No'),
(106, 'Private', 'Yes'),
(107, 'ICU', 'Yes'),
(108, 'General', 'No'),
(109, 'Private', 'Yes'),
(110, 'ICU', 'No'),
(111, 'General', 'Yes'),
(112, 'Private', 'Yes'),
(113, 'ICU', 'No'),
(114, 'General', 'Yes'),
(115, 'Private', 'No'),
(116, 'ICU', 'Yes'),
(117, 'General', 'Yes'),
(118, 'Private', 'No'),
(119, 'ICU', 'Yes'),
(120, 'General', 'Yes');

-- view Rooms table with data
use hospitalSystem
SELECT * FROM Rooms;

-- insert data to Admissions table
INSERT INTO Admissions (Admissions_ID, date_in, date_out, Room_number, patient_ID) VALUES
(1, '2025-01-01', '2025-01-03', 101, 1),
(2, '2025-01-04', '2025-01-06', 102, 2),
(3, '2025-01-07', '2025-01-10', 103, 3),
(4, '2025-01-11', '2025-01-13', 104, 4),
(5, '2025-01-14', '2025-01-16', 105, 5),
(6, '2025-01-17', '2025-01-20', 106, 6),
(7, '2025-01-21', '2025-01-23', 107, 7),
(8, '2025-01-24', '2025-01-26', 108, 8),
(9, '2025-01-27', '2025-01-29', 109, 9),
(10, '2025-02-01', '2025-02-03', 110, 10),
(11, '2025-02-04', '2025-02-06', 111, 11),
(12, '2025-02-07', '2025-02-09', 112, 12),
(13, '2025-02-10', '2025-02-12', 113, 13),
(14, '2025-02-13', '2025-02-15', 114, 14),
(15, '2025-02-16', '2025-02-18', 115, 15),
(16, '2025-02-19', '2025-02-21', 116, 16),
(17, '2025-02-22', '2025-02-24', 117, 17),
(18, '2025-02-25', '2025-02-27', 118, 18),
(19, '2025-02-28', '2025-03-01', 119, 19),
(20, '2025-03-02', '2025-03-04', 120, 20);

-- view Admissions table with data
use hospitalSystem
SELECT * FROM Admissions;

-- insert data to Appointments table
INSERT INTO Appointments (Appointment_ID, time, date_in, date_out, patient_ID, Doctor_ID) VALUES
(1, '09:00:00', '2025-01-01', '2025-01-01', 1, 1),
(2, '10:00:00', '2025-01-02', '2025-01-02', 2, 2),
(3, '11:00:00', '2025-01-03', '2025-01-03', 3, 3),
(4, '12:00:00', '2025-01-04', '2025-01-04', 4, 4),
(5, '13:00:00', '2025-01-05', '2025-01-05', 5, 5),
(6, '14:00:00', '2025-01-06', '2025-01-06', 6, 6),
(7, '15:00:00', '2025-01-07', '2025-01-07', 7, 7),
(8, '16:00:00', '2025-01-08', '2025-01-08', 8, 8),
(9, '17:00:00', '2025-01-09', '2025-01-09', 9, 9),
(10, '08:30:00', '2025-01-10', '2025-01-10', 10, 10),
(11, '09:15:00', '2025-01-11', '2025-01-11', 11, 11),
(12, '10:45:00', '2025-01-12', '2025-01-12', 12, 12),
(13, '13:30:00', '2025-01-13', '2025-01-13', 13, 13),
(14, '14:15:00', '2025-01-14', '2025-01-14', 14, 14),
(15, '15:00:00', '2025-01-15', '2025-01-15', 15, 15),
(16, '08:00:00', '2025-01-16', '2025-01-16', 16, 16),
(17, '09:30:00', '2025-01-17', '2025-01-17', 17, 17),
(18, '10:30:00', '2025-01-18', '2025-01-18', 18, 18),
(19, '11:15:00', '2025-01-19', '2025-01-19', 19, 19),
(20, '13:45:00', '2025-01-20', '2025-01-20', 20, 20);

-- view Appointments table with data
use hospitalSystem
SELECT * FROM Appointments;

-- insert data to Medical Records table
INSERT INTO MedicalRecords (Records_ID, Diagnosis, treatment_plans, date, notes, patient_ID) VALUES
(1, 'Flu', 'Rest & fluids', '2025-01-01', 'Stable', 1),
(2, 'Migraine', 'Painkillers', '2025-01-02', 'Chronic', 2),
(3, 'Diabetes', 'Insulin', '2025-01-03', 'Monitor glucose', 3),
(4, 'Asthma', 'Inhalers', '2025-01-04', 'Mild attack', 4),
(5, 'Fracture', 'Cast', '2025-01-05', 'Healing', 5),
(6, 'Allergy', 'Antihistamines', '2025-01-06', 'Seasonal', 6),
(7, 'Infection', 'Antibiotics', '2025-01-07', 'Follow-up', 7),
(8, 'Hypertension', 'Diet control', '2025-01-08', 'Needs monitoring', 8),
(9, 'Anxiety', 'Therapy', '2025-01-09', 'Referred to psychiatry', 9),
(10, 'Ulcer', 'Antacids', '2025-01-10', 'Avoid spicy food', 10),
(11, 'Cold', 'Rest', '2025-01-11', 'No fever', 11),
(12, 'Burn', 'Cream + dressing', '2025-01-12', 'Minor 1st degree', 12),
(13, 'Sprain', 'Ice + rest', '2025-01-13', 'Swelling', 13),
(14, 'Eczema', 'Topical cream', '2025-01-14', 'Recurring', 14),
(15, 'Tonsillitis', 'Antibiotics', '2025-01-15', 'Severe pain', 15),
(16, 'Depression', 'Counseling', '2025-01-16', 'Weekly sessions', 16),
(17, 'COVID-19', 'Isolation + rest', '2025-01-17', 'Mild symptoms', 17),
(18, 'Kidney Stones', 'Surgery', '2025-01-18', 'Scheduled', 18),
(19, 'Liver disorder', 'Hepatitis treatment', '2025-01-19', 'Under observation', 19),
(20, 'Fever', 'Paracetamol', '2025-01-20', 'Resolved', 20);

-- view Medical Records table with data
use hospitalSystem
SELECT * FROM MedicalRecords;

-- insert data to Billing table
INSERT INTO Billing (Bill_ID, Total_cost, services, Bill_date, patient_ID) VALUES
(1, 250.00, 'Checkup', '2025-01-01', 1),
(2, 400.00, 'MRI', '2025-01-02', 2),
(3, 300.00, 'X-Ray', '2025-01-03', 3),
(4, 600.00, 'CT Scan', '2025-01-04', 4),
(5, 150.00, 'Blood Test', '2025-01-05', 5),
(6, 120.00, 'Injection', '2025-01-06', 6),
(7, 500.00, 'Ultrasound', '2025-01-07', 7),
(8, 350.00, 'ECG', '2025-01-08', 8),
(9, 200.00, 'Therapy', '2025-01-09', 9),
(10, 450.00, 'Consultation', '2025-01-10', 10),
(11, 220.00, 'Checkup', '2025-01-11', 11),
(12, 180.00, 'X-Ray', '2025-01-12', 12),
(13, 310.00, 'ENT Exam', '2025-01-13', 13),
(14, 600.00, 'Ortho Surgery', '2025-01-14', 14),
(15, 170.00, 'Skin Treatment', '2025-01-15', 15),
(16, 260.00, 'Vaccination', '2025-01-16', 16),
(17, 800.00, 'Emergency Service', '2025-01-17', 17),
(18, 190.00, 'Vision Test', '2025-01-18', 18),
(19, 240.00, 'Lab Work', '2025-01-19', 19),
(20, 280.00, 'Follow-up Visit', '2025-01-20', 20);

-- view Billing table with data
use hospitalSystem
SELECT * FROM Billing;

-- insert data to Staff table
INSERT INTO Staff (staff_ID, Staff_Fname, Staff_Lname, salary, shift, role, Dep_ID) VALUES
(1, 'Ahmed', 'Ali', 1000.00, 'Day', 'Nurse', 1),
(2, 'Fatima', 'Zayed', 1200.00, 'Night', 'Admin', 2),
(3, 'Salem', 'Khalid', 1100.00, 'Day', 'Nurse', 3),
(4, 'Zainab', 'Hani', 1050.00, 'Day', 'Technician', 4),
(5, 'Hamad', 'Nasser', 1150.00, 'Night', 'Clerk', 5),
(6, 'Rana', 'Saeed', 1020.00, 'Day', 'Nurse', 6),
(7, 'Talal', 'Rashid', 1180.00, 'Night', 'Technician', 7),
(8, 'Nadia', 'Younis', 980.00, 'Day', 'Admin', 8),
(9, 'Majid', 'Hassan', 1120.00, 'Night', 'Nurse', 9),
(10, 'Salwa', 'Fahad', 1080.00, 'Day', 'Clerk', 10),
(11, 'Ibrahim', 'Omar', 1150.00, 'Night', 'Technician', 11),
(12, 'Huda', 'Amir', 1075.00, 'Day', 'Nurse', 12),
(13, 'Faisal', 'Qasim', 1130.00, 'Night', 'Admin', 13),
(14, 'Amani', 'Sultan', 1090.00, 'Day', 'Receptionist', 14),
(15, 'Yousef', 'Hamdan', 1210.00, 'Night', 'Technician', 15),
(16, 'Leila', 'Zaher', 990.00, 'Day', 'Nurse', 16),
(17, 'Samir', 'Bader', 1040.00, 'Night', 'Clerk', 17),
(18, 'Noora', 'Salim', 1000.00, 'Day', 'Technician', 18),
(19, 'Jamal', 'Kareem', 980.00, 'Night', 'Admin', 19),
(20, 'Hind', 'Naji', 1100.00, 'Day', 'Nurse', 20);

-- view Staff table with data
use hospitalSystem
SELECT * FROM Staff;

-- insert data to Staff contact table
INSERT INTO Staff_contact_info (staff_ID, contact_info) VALUES
(1, '91110000'), (1, '99223344'),
(2, '91112221'),
(3, '91119988'), (3, '93334455'),
(4, '91115566'),
(5, '91113377'),
(6, '91112200'),
(7, '93335566'),
(8, '92226611'),
(9, '94447733'),
(10, '95558844'),
(11, '96669955'),
(12, '97770066'),
(13, '98881177'),
(14, '99992288'),
(15, '91103322'),
(16, '92204433'),
(17, '93305544'),
(18, '94406655'),
(19, '95507766'),
(20, '96608877');

-- view Staff contact table with data
use hospitalSystem
SELECT * FROM Staff_contact_info;

-- insert data to Users table
INSERT INTO Users (username, password, role) VALUES
('anasser', 'pass123', 'Doctor'),
('slatifa', 'pass456', 'Doctor'),
('akhaled', 'pass789', 'Doctor'),
('waleed1', 'pass234', 'Doctor'),
('huda.ped', 'pass345', 'Doctor'),
('ahmed_admin', 'staff01', 'Staff'),
('fatima_night', 'staff02', 'Staff'),
('s.khalid', 'staff03', 'Staff'),
('z.hani', 'staff04', 'Staff'),
('hamad_c', 'staff05', 'Staff'),
('rana.n', 'staff06', 'Staff'),
('t.rashid', 'staff07', 'Staff'),
('n.younis', 'staff08', 'Staff'),
('m.hassan', 'staff09', 'Staff'),
('salwa_f', 'staff10', 'Staff'),
('ibrahim.o', 'staff11', 'Staff'),
('huda.a', 'staff12', 'Staff'),
('f.qasim', 'staff13', 'Staff'),
('a.sultan', 'staff14', 'Staff'),
('y.hamdan', 'staff15', 'Staff');

-- view Users table with data
use hospitalSystem
SELECT * FROM Users;

-- insert data to User Doctor table
INSERT INTO User_Doctor (username, Doctor_ID) VALUES
('anasser', 1),
('slatifa', 2),
('akhaled', 3),
('waleed1', 4),
('huda.ped', 5);

-- view User Doctor table with data
use hospitalSystem
SELECT * FROM User_Doctor;

-- insert data to User Staff table
INSERT INTO User_Staff (username, staff_ID) VALUES
('ahmed_admin', 1),
('fatima_night', 2),
('s.khalid', 3),
('z.hani', 4),
('hamad_c', 5),
('rana.n', 6),
('t.rashid', 7),
('n.younis', 8),
('m.hassan', 9),
('salwa_f', 10),
('ibrahim.o', 11),
('huda.a', 12),
('f.qasim', 13),
('a.sultan', 14),
('y.hamdan', 15);

-- view User Staff table with data
use hospitalSystem
SELECT * FROM User_Staff;
------------------------------------------------------------------------------------------------

-- use DQL 
-- List all patients who visited a certain doctor
-- use distinct to ensures that each patient appears only once, even if they had multiple appointments with the same doctor
select distinct P.patient_ID, P.Fname, P.Lname
from Patients P
join Appointments A on P.patient_ID = A.patient_ID
-- Filters the result to show only the appointments with Doctor ID = 1.
where A.Doctor_ID = 1;

-- Count of appointments per department
select D.Dep_name as DepartmentName, COUNT(*) as AppointmentCount 
from Appointments A
join Doctors Doc on A.Doctor_ID  = Doc.Doctor_ID 
join Departments D on Doc.Dep_ID = D.Dep_ID
group by D.Dep_name;

-- Retrieve doctors who have more than 5 appointments in a month
select D.Doctor_ID, D.Doctor_Name, COUNT(A.Appointment_ID) AS AppointmentCount
from Doctors D
join Appointments A on D.Doctor_ID = A.Doctor_ID
-- Filters the results to only include appointments within January 2025: From January 1st to before February 1st (exclusive)
where A.date_in >= '2025-01-01' AND A.date_in < '2025-02-01'
group by D.Doctor_ID, D.Doctor_Name
having COUNT(A.Appointment_ID) > 5;

-- Use JOINs across 3–4 tables
select A.Appointment_ID, P.Fname + ' ' + P.Lname AS PatientName, D.Doctor_Name AS DoctorName, Dept.Dep_name AS DepartmentName, A.date_in AS AppointmentDate
from Appointments A
join Patients P ON A.patient_ID = P.patient_ID
join Doctors D ON A.Doctor_ID = D.Doctor_ID
join Departments Dept ON D.Dep_ID = Dept.Dep_ID;

-- Use GROUP BY, HAVING, and aggregate functions
select P.patient_ID, P.Fname + ' ' + P.Lname AS PatientName, AVG(B.Total_cost) AS AvgBill
from Patients P
join Billing B ON P.patient_ID = B.patient_ID
group by P.patient_ID, P.Fname, P.Lname
having AVG(B.Total_cost) > 700;

-- Use SUBQUERIES and EXISTS
select P.patient_ID, P.Fname + ' ' + P.Lname AS PatientName
from Patients p
where EXISTS (
    select 1 
    from Billing B
    where B.patient_ID = P.patient_ID
);
-------------------------------------------------------------------------------------------------------

-- Functions & Stored Procedures  
-- Scalar function to calculate patient age from DOB
create function dbo.fn_CalculateAge (@DOB DATE)
returns INT
as
begin
-- Calculates the difference in years between DOB and today
    return DATEDIFF(YEAR, @DOB, GETDATE()) -
     case
-- checks if the birthday hasn't happened yet this year
     when DATEADD(YEAR, DATEDIFF(YEAR, @DOB, GETDATE()), @DOB) > GETDATE() 
	 then 1 
	 else 0 
	 end;
end;



-- to Run the function
select dbo.fn_CalculateAge('2000-06-30') AS Age;

-- Stored procedure to admit a patient (insert to Admissions, update Room availability)
create procedure dbo.sp_AdmitPatient
    @PatientID INT,
    @RoomNumber INT
as
begin
begin transaction;
begin try 
-- Insert new admission record
insert into Admissions (Admissions_ID, date_in, Room_number, patient_ID)
values (
(select ISNULL(MAX(Admissions_ID), 0) + 1 from Admissions), 
GETDATE(), 
@RoomNumber, 
@PatientID
);
-- Update room availability to 'No'
UPDATE Rooms
set availability = 'No'
where Room_number = @RoomNumber;
commit TRANSACTION;
end try 
begin catch
ROLLBACK TRANSACTION;
throw;
end catch
end;

-- to Run the Procedure:
EXEC dbo.sp_AdmitPatient @PatientID = 5, @RoomNumber = 106;



-- Procedure to generate invoice (insert into Billing based on treatments)
create procedure dbo.sp_GenerateInvoice
@PatientID INT,
@Amount DECIMAL(10,2),
@ServiceName NVARCHAR(50)
as
begin
declare @NewBillID INT;
set @NewBillID = (SELECT ISNULL(MAX(Bill_ID), 0) + 1 FROM Billing);
-- Insert new to Billing
insert into Billing (Bill_ID, Total_cost, services, Bill_date, patient_ID)
values (@NewBillID, @Amount, @ServiceName, GETDATE(), @PatientID);
end;

-- to Run the Procedure
EXEC dbo.sp_GenerateInvoice @PatientID = 3, @Amount = 300.00, @ServiceName = 'Lab Test';



-- Procedure to assign doctor to department and shift
-- Add a Shift column to the Doctors table, This column will store the doctor's working shift
alter table Doctors
add Shift NVARCHAR(20);

-- Create a stored procedure to assign a department and shift to a doctor
create procedure dbo.sp_AssignDoctorToDepartmentAndShift
@DoctorID INT,
@DepartmentID INT,
@Shift NVARCHAR(20)
as
begin
UPDATE Doctors
set Dep_ID = @DepartmentID,
Shift = @Shift
where Doctor_ID = @DoctorID;
end;

-- -- to Run the Procedure
EXEC dbo.sp_AssignDoctorToDepartmentAndShift @DoctorID = 5, @DepartmentID = 2, @Shift = 'Night';
--------------------------------------------------------------------------------------------------------------

-- Triggers 
-- After insert on Appointments → auto log in MedicalRecords
-- for each new appointment, it inserts a default row into MedicalRecords
-- Creates a new trigger named trg_AfterInsertAppointment
create trigger trg_AfterInsertAppointment
on Appointments
after insert 
as
begin
-- Instructs SQL Server to insert a new row into the MedicalRecords table
insert into MedicalRecords (Diagnosis, treatment_plans, date, notes, patient_ID)
select 
        'Pending Diagnosis', 
        'To be decided', 
        GETDATE(), 
        'Auto-created after appointment', 
        patient_ID
from inserted;
end;



-- Before delete on Patients → prevent deletion if pending bills exist
-- Add Paid column to the Billing table
alter table Billing
add Paid BIT default 0;

-- Create the trigger to prevent deleting patients with unpaid bills
-- Creates a new trigger named trg_BeforeDeletePatient
create trigger trg_BeforeDeletePatient
on Patients
instead of delete
as
begin
if EXISTS (
-- Uses the deleted
        select 1 
        from Billing B 
        join deleted D ON B.patient_ID = D.patient_ID 
        where b.Paid = 0
    )
    begin
-- If unpaid bills exist, raise an error message.
-- Error level 16 means it's a general user error
        RAISERROR ('Cannot delete patient with unpaid bills.', 16, 1);
-- Cancels the delete operation by rolling back the transaction
        ROLLBACK TRANSACTION;
        return;
    end
    else
    begin
-- Deletes the patient
        delete from Patients 
        where patient_ID IN (SELECT patient_ID FROM deleted);
    end
end;



-- After update on Rooms → ensure no two patients occupy same room
-- Creates a trigger named trg_PreventRoomDoubleBooking
create trigger trg_PreventRoomDoubleBooking
-- This trigger is attached to the Admissions table, which handles room admissions
on Admissions
-- The trigger runs after any new row is inserted or an existing row is updated
after insert, UPDATE
as
begin
-- This checks if the following condition is true 
    if EXISTS (
        select 1
        from Admissions A
        join inserted I ON A.Room_number = I.Room_number
        where A.Admissions_ID <> I.Admissions_ID
-- check for date overlap between the new or updated admission and existing ones for the same room
          AND (
              (I.date_in BETWEEN A.date_in AND A.date_out)
              OR
              (I.date_out BETWEEN A.date_in AND A.date_out)
              OR
              (A.date_in BETWEEN I.date_in AND I.date_out)
          )
    )
begin
-- Shows an error messageو Cancels the insert or update
        RAISERROR ('This room is already occupied during the selected date range.', 16, 1);
        ROLLBACK TRANSACTION;
   end
end;
-------------------------------------------------------------------------------------------------

-- Security (DCL) 
-- Create at least two user roles: DoctorUser, AdminUser 
CREATE ROLE DoctorUser;
CREATE ROLE AdminUser;

-- GRANT SELECT for DoctorUser on Patients and Appointments only 
grant select on  Patients to DoctorUser;
grant select on Appointments to DoctorUser;

-- GRANT INSERT, UPDATE for AdminUser on all tables
grant insert, UPDATE ON Patients TO AdminUser;
grant insert, UPDATE ON Doctors TO AdminUser;
grant insert, UPDATE ON Departments TO AdminUser;
grant insert, UPDATE ON Appointments TO AdminUser;
grant insert, UPDATE ON Rooms TO AdminUser;
grant insert, UPDATE ON Admissions TO AdminUser;
grant insert, UPDATE ON Billing TO AdminUser;
grant insert, UPDATE ON MedicalRecords TO AdminUser;

-- REVOKE DELETE for Doctors
deny delete on Doctors to DoctorUser;
------------------------------------------------------------------------------------------------

-- Transactions (TCL) 
-- Simulate a transaction: admit a patient → insert record, update room, create billing → commit
begin Transaction;
begin try
-- Insert the admission record
declare @NewAdmissionID INT = (SELECT ISNULL(MAX(Admissions_ID), 0) + 1 FROM Admissions);
insert into Admissions (Admissions_ID, patient_ID, Room_number, date_in)
values (@NewAdmissionID, 1, 101, GETDATE());

-- Update the room to mark it as unavailable
UPDATE Rooms
set availability  = 'No'
where Room_number  = 101;

-- Insert a billing record for the patient
declare @NewBillID INT = (SELECT ISNULL(MAX(Bill_ID), 0) + 1 FROM Billing);
insert into Billing (Bill_ID, Total_cost, services, Bill_date, patient_ID)
values (@NewBillID, 500.00, 'Admission Charges', GETDATE(), 1);

-- 4. Commit the transaction if all steps succeed
commit;
print 'Transaction completed successfully.';

end try
begin catch
    
-- Add rollback logic in case of failure
-- Rollback the transaction if any error occurs
rollback;
print 'Transaction failed and was rolled back.';
-- Print the error message
print ERROR_MESSAGE();
end catch;
-----------------------------------------------------------------------------------------------------

-- Views 
-- vw_DoctorSchedule: Upcoming appointments per doctor 
create view vw_DoctorSchedule as
select D.Doctor_ID, D.Doctor_Name, A.Appointment_ID, A.date_in, A.time, P.Fname + ' ' + P.Lname AS Patient_Name
from Appointments A
join Doctors D ON A.Doctor_ID = D.Doctor_ID
join Patients P ON A.patient_ID = P.patient_ID
where A.date_in >= CAST(GETDATE() AS DATE);



-- vw_PatientSummary: Patient info with their latest visit
create view vw_PatientSummary as
select P.patient_ID, P.Fname + ' ' + P.Lname AS Patient_Name, P.DOB, P.gender, MR.date AS LastVisitDate, MR.Diagnosis, MR.treatment_plans
from Patients p
left join MedicalRecords MR ON MR.patient_ID = P.patient_ID
where MR.date = (
select MAX(MR2.date)
from MedicalRecords MR2
where MR2.patient_ID = P.patient_ID
);



-- vw_DepartmentStats: Number of doctors and patients per department
create view vw_DepartmentStats as
select D.Dep_ID, D.Dep_name, COUNT(DISTINCT Doc.Doctor_ID) AS Num_Doctors, COUNT(DISTINCT A.patient_ID) AS Num_Patients
FROM Departments D
left join Doctors Doc ON Doc.Dep_ID = d.Dep_ID
left join Appointments A ON A.Doctor_ID = Doc.Doctor_ID
group by D.Dep_ID, D.Dep_name;
----------------------------------------------------------------------------------------------------

      



