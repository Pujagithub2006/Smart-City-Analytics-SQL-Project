CREATE TABLE city_area (
	area_id INT PRIMARY KEY,
	area_name VARCHAR(100),
	area_zone VARCHAR (50),
	population INT	
);

CREATE TABLE citizens (
	citizen_id INT PRIMARY KEY,
	citizen_name VARCHAR(100),
	age INT,
	gender VARCHAR(10) CHECK (gender IN ('male', 'female', 'other')),
	area_id INT,
	FOREIGN KEY(area_id) references city_area(area_id)	
);

CREATE TABLE transport_usage (
	ride_id INT PRIMARY KEY,
	citizen_id INT,
	ride_date DATE,
	fare DECIMAL (6, 2),
	ride_mode VARCHAR (20),
	FOREIGN KEY(citizen_id) REFERENCES citizens(citizen_id)
);

CREATE TABLE healthcare_visits (
	visit_id INT PRIMARY KEY,
	citizen_id INT,
	visit_date DATE,
	department VARCHAR(50),
	visit_cost DECIMAL(8, 2),
	FOREIGN KEY(citizen_id) REFERENCES citizens(citizen_id)	
);

CREATE TABLE electricity_usage (
	bill_id INT PRIMARY KEY,
	area_id INT,
	usage_date DATE,
	kwh DECIMAL (8,2),
	bill_amount DECIMAL (8,2),
	FOREIGN KEY(area_id) REFERENCES city_area(area_id)	
);

CREATE TABLE public_feedback (
	feedback_id INT PRIMARY KEY,
	citizen_id INT,
	feedback_date DATE,
	rating INT CHECK (rating BETWEEN 1 AND 5),
	city_department VARCHAR (50),
	comments TEXT,
	FOREIGN KEY(citizen_id) REFERENCES citizens(citizen_id)
);

INSERT INTO city_area VALUES 	
(1, 'Shivaji Nagar', 'West Zone', 87000),
(2, 'Kothrud', 'West Zone', 120000),
(3, 'Hinjewadi', 'North Zone', 95000),
(4, 'Kharadi', 'East Zone', 104000),
(5, 'Hadapsar', 'South Zone', 112000)

INSERT INTO citizens VALUES
(101, 'Amit Sharma', 34, 'Male', 1),
(102, 'Priya Desai', 28, 'Female', 2),
(103, 'Rahul Verma', 45, 'Male', 3),
(104, 'Sneha Patil', 32, 'Female', 4),
(105, 'Ankit Joshi', 50, 'Male', 5),
(106, 'Neha Kulkarni', 22, 'Female', 1),
(107, 'Ravi Mehta', 41, 'Male', 2),
(108, 'Kiran Naik', 29, 'Female', 3),
(109, 'Sunil Singh', 36, 'Male', 4),
(110, 'Anjali Rao', 31, 'Female', 5);

INSERT INTO transport_usage VALUES
(1001, 101, '2025-06-01', 15.00, 'Bus'),
(1002, 102, '2025-06-01', 22.50, 'Metro'),
(1003, 103, '2025-06-02', 35.00, 'Auto'),
(1004, 104, '2025-06-02', 40.00, 'Cab'),
(1005, 105, '2025-06-03', 12.00, 'Bus'),
(1006, 106, '2025-06-04', 18.75, 'Bike'),
(1007, 107, '2025-06-04', 26.00, 'Metro'),
(1008, 108, '2025-06-05', 15.00, 'Auto'),
(1009, 109, '2025-06-05', 22.00, 'Cab'),
(1010, 110, '2025-06-06', 10.00, 'Bus'),
(1011, 101, '2025-06-07', 20.00, 'Metro'),
(1012, 103, '2025-06-08', 25.00, 'Bike');

INSERT INTO healthcare_visits VALUES
(201, 101, '2025-05-15', 'General', 500.00),
(202, 102, '2025-05-16', 'ENT', 750.00),
(203, 103, '2025-05-17', 'Cardiology', 1500.00),
(204, 104, '2025-05-18', 'Orthopedics', 1200.00),
(205, 105, '2025-05-19', 'Pediatrics', 650.00),
(206, 106, '2025-05-20', 'General', 400.00),
(207, 107, '2025-05-21', 'ENT', 800.00),
(208, 108, '2025-05-22', 'General', 550.00),
(209, 109, '2025-05-23', 'Cardiology', 1600.00),
(210, 110, '2025-05-24', 'Orthopedics', 1100.00);

INSERT INTO electricity_usage VALUES
(301, 1, '2025-06-01', 180.50, 1450.75),
(302, 2, '2025-06-01', 210.75, 1720.60),
(303, 3, '2025-06-02', 195.25, 1580.40),
(304, 4, '2025-06-02', 170.00, 1350.00),
(305, 5, '2025-06-03', 220.00, 1795.20),
(306, 1, '2025-06-04', 185.00, 1475.25),
(307, 2, '2025-06-05', 200.00, 1640.00),
(308, 3, '2025-06-06', 190.75, 1520.90),
(309, 4, '2025-06-07', 175.60, 1399.50),
(310, 5, '2025-06-08', 225.00, 1820.00);

INSERT INTO public_feedback VALUES
(401, 101, '2025-06-01', 4, 'Transport', 'Buses are clean and timely.'),
(402, 102, '2025-06-02', 5, 'Electricity', 'No power cuts in last month.'),
(403, 103, '2025-06-03', 3, 'Healthcare', 'Doctor was good but wait time long.'),
(404, 104, '2025-06-04', 2, 'Transport', 'Metro delays during peak hours.'),
(405, 105, '2025-06-05', 5, 'Electricity', 'Billing is transparent and timely.'),
(406, 106, '2025-06-06', 1, 'Healthcare', 'Staff was rude and unhelpful.'),
(407, 107, '2025-06-07', 4, 'Transport', 'New buses are very comfortable.'),
(408, 108, '2025-06-08', 5, 'Electricity', 'Very happy with the service.'),
(409, 109, '2025-06-09', 3, 'Healthcare', 'Facilities are decent.'),
(410, 110, '2025-06-10', 4, 'Transport', 'Bikes are affordable and fast.');


--Q1. List all citizens with their area name
SELECT
	c.citizen_name,
	a.area_name
FROM citizens c
JOIN city_area a ON c.area_id = a.area_id;

--Q2. Show citizen name, ride mode, and fare from transport usage.
SELECT 
	c.citizen_name,
	t.ride_mode,
	t.fare
FROM citizens c
JOIN transport_usage t ON c.citizen_id = t.citizen_id;

--Q3. How many citizens are there in each area?
SELECT 
	a.area_name,
	COUNT(c.citizen_id) AS total_citizens
FROM city_area a
JOIN citizens c ON c.area_id = a.area_id
GROUP BY a.area_name
ORDER BY total_citizens DESC;

--Q4. What is the total transport fare paid by each citizen?
SELECT
	c.citizen_name,
	SUM(t.fare) AS total_fare
FROM citizens c
JOIN transport_usage t ON c.citizen_id = t.citizen_id
GROUP BY c.citizen_name 
ORDER BY total_fare DESC;

--Q5. What is the average visit cost in each healthcare department?
SELECT 
	department, 
	ROUND(AVG(visit_cost), 2) AS avg_visit_cost
FROM healthcare_visits 
GROUP BY department
ORDER BY avg_visit_cost DESC;

--Q6. Find all citizens who gave a feedback rating less than 3.
SELECT 
	c.citizen_name,
	f.rating,
	f.city_department,
	f.comments
FROM citizens c
JOIN public_feedback f ON c.citizen_id = f.citizen_id
WHERE f.rating < 3;

--Q7. Show total number of feedbacks per department.
SELECT 
	city_department,
	COUNT(feedback_id) AS total_feedbacks
FROM public_feedback
GROUP BY city_department
ORDER BY total_feedbacks DESC;

--Q8. Find the average electricity bill for each area.
SELECT 
	a.area_name,
	ROUND(AVG(bill_amount), 2) AS avg_electricity_bill
FROM city_area a
JOIN electricity_usage e ON a.area_id = e.area_id
GROUP BY a.area_name
ORDER BY avg_electricity_bill DESC;

--Q9. Show all citizens who live in a specific zone (e.g., 'East Zone').
SELECT 
	c.citizen_name,
	a.area_zone
FROM citizens c
JOIN city_area a ON c.area_id = a.area_id
WHERE a.area_zone = 'East Zone';

--Q10. List healthcare visits that cost more than the average cost.
SELECT
	visit_id,
	visit_date,
	department,
	visit_cost,
	(SELECT ROUND(AVG(visit_cost), 2) FROM healthcare_visits) as avg_visit_cost
FROM healthcare_visits
WHERE visit_cost > (
	SELECT ROUND(AVG(visit_cost), 2)
	FROM healthcare_visits
);

--Q11. Count how many distinct citizens have used transport services.
SELECT 
	COUNT(DISTINCT(citizen_id)) as total_unique_transport_users
FROM transport_usage

--Q12. Find departments that received more than 2 feedbacks with an average rating less than 3.
SELECT 
	city_department,
	COUNT(*) AS total_feedbacks,
	ROUND(AVG(rating), 2) as average_rating
FROM public_feedback
GROUP BY city_department
HAVING COUNT(*) > 2 AND ROUND(AVG(rating), 2) < 3;

--Q13. Show citizens who have never used transport services.
SELECT 
	citizen_id,
	citizen_name
FROM citizens
WHERE citizen_id NOT IN (
	SELECT DISTINCT citizen_id from transport_usage
);

--Q14. Show each citizen’s feedback sentiment: Good if rating ≥ 4, Neutral if 3, Poor if < 3
SELECT 
	c.citizen_id,
	c.citizen_name,
	f.rating,
	CASE 
		WHEN f.rating >= 4 THEN 'Good'
		WHEN f.rating = 3 THEN 'Neutral'
		ELSE 'Poor'
	END AS feedback_sentiment
FROM citizens c
JOIN public_feedback f ON c.citizen_id = f.citizen_id;

--Q15. Find the top 3 citizens who spent the most on healthcare.
SELECT 
	c.citizen_name,
	SUM(h.visit_cost) as total_healthcare_cost
FROM citizens c
JOIN healthcare_visits h ON c.citizen_id = h.citizen_id
GROUP BY c.citizen_name
ORDER BY total_healthcare_cost DESC
LIMIT 3;

--CTE Questions
--Q1. Total feedback count and average rating per department where avg rating < 3.
WITH dept_feedback_stats AS (
	SELECT 
		city_department,
		COUNT(*) AS total_feedbacks,
		ROUND(AVG(rating), 2) as average_rating
	FROM public_feedback
	GROUP BY city_department
)
SELECT * 
FROM dept_feedback_stats 
WHERE average_rating < 3;

--Q2. Total ride fare and average fare per citizen who spent more than ₹200
WITH fare_stats AS (
	SELECT 
		c.citizen_name,
		SUM(t.fare) AS total_fare,
		ROUND(AVG(t.fare), 2) AS average_fare
	FROM citizens c
	JOIN transport_usage t ON c.citizen_id = t.citizen_id
	GROUP BY c.citizen_name
)
SELECT * 
FROM fare_stats
WHERE total_fare > 200
ORDER BY total_fare DESC;

--Q3. Citizens who gave feedback and visited healthcare in the same week
WITH feedback_stats AS (
	SELECT 
		citizen_id,
		comments,
		EXTRACT(WEEK FROM feedback_date) AS week
	FROM public_feedback
),
healthcare_stats AS (
	SELECT 
		citizen_id,
		visit_date,
		EXTRACT(WEEK FROM visit_date) AS week	
	FROM healthcare_visits
)

SELECT c.citizen_name
FROM feedback_stats fs
JOIN healthcare_stats hs ON fs.citizen_id = hs.citizen_id AND fs.week = hs.week
JOIN citizens c ON fs.citizen_id = c.citizen_id;

--Q4. Areas where avg electricity bill > overall city average
WITH avg_elec_bill_stats AS (
	SELECT
		area_id,
		ROUND(AVG(bill_amount), 2) AS avg_elec_bill
	FROM electricity_usage
	GROUP BY area_id
),
city_avg_stats AS (
	SELECT ROUND(AVG(bill_amount), 2) AS ov_city_avg FROM electricity_usage 	
)

SELECT 
	a.area_id,
	a.area_name,
	aebs.avg_elec_bill,
	cas.ov_city_avg
FROM avg_elec_bill_stats aebs
JOIN city_area a ON aebs.area_id = a.area_id
CROSS JOIN city_avg_stats cas
WHERE aebs.avg_elec_bill > cas.ov_city_avg

--Q5. Citizens whose healthcare + transport cost > ₹1000
WITH healthcare_cost_stats AS (
	SELECT 
		citizen_id,
		SUM(visit_cost) AS total_healthcare_cost
	FROM healthcare_visits
	GROUP BY citizen_id
),
transport_cost_stats AS (
	SELECT
		citizen_id,
		SUM(fare) AS total_transport_cost
	FROM transport_usage
	GROUP BY citizen_id
),
combined_spending AS (
	SELECT 
		h.citizen_id,
		COALESCE(h.total_healthcare_cost, 0) + COALESCE(t.total_transport_cost, 0) AS total_spent
	FROM healthcare_cost_stats h
	FULL OUTER JOIN transport_cost_stats t ON h.citizen_id = t.citizen_id		
)

SELECT 
	c.citizen_id,
	c.citizen_name,
	cs.total_spent
FROM citizens c 
JOIN combined_spending cs ON c.citizen_id = cs.citizen_id
WHERE cs.total_spent > 1000
ORDER BY cs.total_spent DESC;

--Use of Window Functions
--Q1. Assign a unique visit number to each citizen’s healthcare visits in order of visit_date.
SELECT 
	c.citizen_name,
	h.visit_date,
	h.department,
	h.visit_cost,
	ROW_NUMBER() OVER (
		PARTITION BY c.citizen_name 
		ORDER BY h.visit_date
	) AS visit_number
FROM citizens c
JOIN healthcare_visits h ON c.citizen_id = h.citizen_id;

--Q2. Rank citizens by total transport fare spent (highest to lowest). Show both RANK and DENSE_RANK.
WITH total_trans_fare AS (
	SELECT
		citizen_id,
		SUM(fare) AS total_spent
	FROM transport_usage
	GROUP BY citizen_id
)

SELECT 
	c.citizen_name,
	ttf.total_spent,
	RANK() OVER (
		ORDER BY ttf.total_spent DESC
	) AS trans_fare_rank,
	DENSE_RANK() OVER (
		ORDER BY ttf.total_spent DESC
	) AS trans_fare_dense_rank
FROM citizens c
JOIN total_trans_fare ttf ON c.citizen_id = ttf.citizen_id;

--Q3. For each citizen, show their ride date, fare, and previous ride's fare.
SELECT
	c.citizen_name,
	t.ride_date,
	t.fare AS current_fare,
	LAG(t.fare) OVER(
		PARTITION BY c.citizen_name 
		ORDER BY t.ride_date DESC
	) AS previous_fare
FROM citizens c
JOIN transport_usage t ON c.citizen_id = t.citizen_id;

--Q4. Show each citizen's current ride fare and the next ride’s fare.
SELECT
	c.citizen_name,
	t.fare AS current_fare,
	LEAD(t.fare) OVER(
		PARTITION BY c.citizen_name 
		ORDER BY t.ride_fare DESC
	) AS previous_fare
FROM citizens c
JOIN transport_usage t ON c.citizen_id = t.citizen_id;

--Q5. Show running total of electricity units consumed (kWh) per area, ordered by usage date.
SELECT 
	a.area_name,
	e.usage_date,
	SUM(e.kwh) OVER(
		PARTITION BY a.area_name
		ORDER BY e.usage_date DESC
	) AS running_total_elec_units
FROM city_area a
JOIN electricity_usage e ON a.area_id = e.area_id;

--Questions with use of both CTEs and Windows Functions
--Q1. For each citizen, show their most recent 2 healthcare visits along with total visits they've made.
WITH visits_stats AS (
	SELECT 
		citizen_id,
		visit_date,
		department,
		visit_cost,
		ROW_NUMBER() OVER (
			PARTITION BY citizen_id
			ORDER BY visit_date DESC
		) AS recent_visits,
		COUNT(*) OVER (
			PARTITION BY citizen_id
		) AS total_visits
	FROM healthcare_visits
)

SELECT 
	c.citizen_name,
	vs.visit_date,
	vs.department,
	vs.visit_cost,
	vs.total_visits
FROM citizens c
JOIN visits_stats vs ON c.citizen_id = vs.citizen_id
WHERE vs.recent_visits <= 2 
ORDER BY vs.visit_date DESC

--Q2. For each area, find the week with the highest electricity usage and compare it to the overall weekly average.
WITH elec_usage AS (
	SELECT 
		area_id,
		SUM(kwh) as total_usage,
		EXTRACT(WEEK FROM usage_date) AS week_num
	FROM electricity_usage 
	GROUP BY area_id, EXTRACT(WEEK FROM usage_date)
		 
),
ranked_and_avg_usage AS (
	SELECT 
		area_id,
		week_num,
		total_usage,
		RANK() OVER(
			PARTITION BY area_id
			ORDER BY total_usage DESC
		) AS ranked_usage,
		ROUND(AVG(total_usage), 2) as city_avg
	FROM elec_usage
)

SELECT 
	a.area_name,
	ru.week_num,
	ru.total_usage,
	ru.city_avg
FROM ranked_and_avg_usage ru
JOIN city_area a ON ru.area_id = a.area_id


		

	

	

	

	
	







