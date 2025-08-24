CREATE TABLE airline_delays (
    year INT,
    month INT,
    carrier VARCHAR(10),
    carrier_name VARCHAR(100),
    airport VARCHAR(10),
    airport_name VARCHAR(255),
    arr_flights INT,
    arr_del15 INT,
    carrier_ct FLOAT,
    weather_ct FLOAT,
    nas_ct FLOAT,
    security_ct FLOAT,
    late_aircraft_ct FLOAT,
    arr_cancelled INT,
    arr_diverted INT,
    arr_delay FLOAT,
    carrier_delay FLOAT,
    weather_delay FLOAT,
    nas_delay FLOAT,
    security_delay FLOAT,
    late_aircraft_delay FLOAT
);

-- 1. Most delayed routes (origin-destination pairs)

SELECT 
    airport_name,
    SUM(arr_delay) AS total_arrival_delay
FROM airline_delays
GROUP BY airport_name
ORDER BY total_arrival_delay DESC
LIMIT 10;

-- 2. Average delay per airline
SELECT 
    carrier_name,
    AVG(arr_delay) AS avg_arrival_delay
FROM airline_delays
GROUP BY carrier_name
ORDER BY avg_arrival_delay DESC;

-- 3.Total number of flights per airport
SELECT 
    airport_name,
    SUM(arr_flights) AS total_flights
FROM airline_delays
GROUP BY airport_name
ORDER BY total_flights DESC;

-- 4. Count how many delays are due to weather, carrier, security, etc.
SELECT 
    SUM(carrier_delay) AS carrier_delays,
    SUM(weather_delay) AS weather_delays,
    SUM(nas_delay) AS nas_delays,
    SUM(security_delay) AS security_delays,
    SUM(late_aircraft_delay) AS late_aircraft_delays
FROM airline_delays;

-- 5. Average departure and arrival delay per month
SELECT 
    month,
    AVG(arr_delay) AS avg_arrival_delay
FROM airline_delays
GROUP BY month
ORDER BY month;

-- 6. Top 5 airports with the highest number of delayed departures
SELECT 
    airport_name,
    SUM(arr_del15) AS delayed_arrivals
FROM airline_delays
GROUP BY airport_name
ORDER BY delayed_arrivals DESC
LIMIT 5;

-- 7. Cancellation rate per airline
SELECT 
    carrier_name,
    SUM(arr_cancelled) / SUM(arr_flights) * 100 AS cancellation_rate
FROM airline_delays
GROUP BY carrier_name
ORDER BY cancellation_rate DESC;

