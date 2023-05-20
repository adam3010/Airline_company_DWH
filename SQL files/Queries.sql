use airlineDW;


---Markrting department Questions--
--1) what flights the company’s frequent flyers take? --
SELECT F.Flight_number , F.Departing_airport , F.Arriving_airport
FROM Flights F , Travelers T , Marketing_Department M
WHERE F.Flight_number = M.Flight_number
AND M.Travelers_ID = T.Travelers_ID
AND T.Travelers_loyalty = 1 

--2) what fare basis they pay?--
SELECT T.Travelers_Name as 'Traveler Name' ,sum(Ti.Ticket_price) as 'Total fare they pay' , COUNT(Ti.Tickets_ID) as 'Number of tickets'
FROM Tickets Ti , Travelers T , Marketing_Department M
WHERE Ti.Tickets_ID = M.Tickets_ID
AND M.Tickets_ID = T.Travelers_ID
AND T.Travelers_loyalty = 1 
group by T.Travelers_Name

--3)what proportion of these frequent flyers have gold, platinum, aluminum, or titanium status?--
SELECT T.Travelers_Name as 'Traveler Name' , Ti.Tickets_class
FROM Tickets Ti , Travelers T , Marketing_Department M
WHERE Ti.Tickets_ID = M.Tickets_ID
AND M.Tickets_ID = T.Travelers_ID
AND T.Travelers_loyalty = 1 

--4)analyzing the company profit
SELECT RC.Reservation_Channels_type , COUNT(RC.Reservation_Channels_ID) as ' Number of reservations' , SUM(R.Total_profit) as 'Total Profit'
FROM Reservation R , Reservation_Channels RC
WHERE R.Reservation_Channels_ID = RC.Reservation_Channels_ID
GROUP BY RC.Reservation_Channels_type

--5) Analysis compiment 
SELECT P.problem_type , COUNT(C.Travelers_ID) AS 'NUMBER OF TRAVELERS COMPLAINTS'
FROM problems P , Customer_care C
WHERE P.problem_ID = C.problem_ID
GROUP BY P.problem_type
