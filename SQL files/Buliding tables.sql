--Create database airlineDW;--

use airlineDW;

create table Flights(
	Flight_number int Primary key,
	Flight_Duration int ,
	Departing_airport varchar(20),
	Arriving_airport varchar(20),
	Departing_time time,
	Arriving_time time,
	Departing_date date,
	Arriving_date date,
	Flight_distance Decimal(30,0)
)



create table promotions(
	promotions_code int Primary key,
	promotions_type varchar(50) ,
	promotions_startdate datetime,
	promotions_enddate datetime,
	promotions_value decimal(30)
)

create table Tickets(
	Tickets_ID int Primary key,
	Tickets_class varchar(20) ,
	upgrade_check bit,
	Seat_number int,
	Ticket_price int
)

create table Travelers(
	Travelers_ID int Primary key,
	Travelers_Name varchar(30),
	Travelers_address varchar(50),
	Travelers_state varchar(20),
	Travelers_gender varchar(20),
	Travelers_loyalty bit
)

create table Aircraft(
	Airplane_ID int primary key,
	Airplane_type varchar(30),
	Airplane_capacity int
)


create table problems(
	problem_ID int primary key,
	problem_severity int,
	problem_type varchar(30),
	problem_complaint varchar(70)
)

create table Reservation_Channels(
	Reservation_Channels_ID int primary key,
	Reservation_Channels_type varchar(20)
)

create table Date_Dim (
                Date_key INT PRIMARY KEY,
                FULL_DATE DATE,
                YEAR int,
                QUARTER int,
                MONTH int,
                WEEK_IN_YEAR int,
                DAY_IN_WEEK int,
                DAY_IN_MONTH int,
				DAY_NAME VARCHAR(50)
				)


create table Marketing_Department(
	Flight_number int,
	promotion_code int,
	Tickets_ID int,
	Travelers_ID int,
	upgraded_ticket bit,
	Date_key Int,
	FOREIGN KEY (Flight_number) REFERENCES Flights(Flight_number),
	FOREIGN KEY (promotion_code) REFERENCES promotions(promotions_code),
	FOREIGN KEY (Tickets_ID) REFERENCES Tickets(Tickets_ID),
	FOREIGN KEY (Travelers_ID) REFERENCES Travelers(Travelers_ID),
	FOREIGN KEY (Date_key) REFERENCES Date_Dim(Date_key)
)


create table Reservation(
	Flight_number int,
	Tickets_ID int,
	Travelers_ID int,
	Reservation_Channels_ID int,
	Airplane_ID int,
	Total_profit int,
	Date_key int,
	FOREIGN KEY (Flight_number) REFERENCES Flights(Flight_number),
	FOREIGN KEY (Tickets_ID) REFERENCES Tickets(Tickets_ID),
	FOREIGN KEY (Travelers_ID) REFERENCES Travelers(Travelers_ID),
	FOREIGN KEY (Date_key) REFERENCES Date_Dim(Date_key),
	FOREIGN KEY (Airplane_ID) REFERENCES Aircraft(Airplane_ID),
	FOREIGN KEY (Reservation_Channels_ID) REFERENCES Reservation_Channels(Reservation_Channels_ID),
)

create table Customer_care(
	Flight_number int,
	Travelers_ID int,
	problem_ID int,
	Airplane_ID int,
	Date_key int,
	FOREIGN KEY (Flight_number) REFERENCES Flights(Flight_number),
	FOREIGN KEY (Travelers_ID) REFERENCES Travelers(Travelers_ID),
	FOREIGN KEY (Airplane_ID) REFERENCES Aircraft(Airplane_ID),
	FOREIGN KEY (problem_ID) REFERENCES problems(problem_ID),
	FOREIGN KEY (Date_key) REFERENCES Date_Dim(Date_key)
)



Bulk insert Date_Dim
from 'D:\coureses\ITI\Data Analysis\DHW Project\Data\Date_dim.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=50,
    MAXERRORS=2);
