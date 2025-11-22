USE flight_delay;

SELECT origin, dest,
       AVG(arr_delay) AS avg_arrival_delay
FROM flight_data_2024_sample
WHERE arr_delay IS NOT NULL
GROUP BY origin, dest
ORDER BY avg_arrival_delay DESC
LIMIT 10;
SELECT op_unique_carrier AS airline,
       AVG(dep_delay) AS avg_departure_delay,
       AVG(arr_delay) AS avg_arrival_delay
FROM flight_data_2024_sample
GROUP BY op_unique_carrier
ORDER BY avg_arrival_delay DESC;
SELECT origin AS airport,
       COUNT(*) AS total_departures
FROM flight_data_2024_sample
GROUP BY origin
ORDER BY total_departures DESC;
SELECT dest AS airport,
       COUNT(*) AS total_arrivals
FROM flight_data_2024_sample
GROUP BY dest
ORDER BY total_arrivals DESC;
SELECT 
  SUM(CASE WHEN weather_delay > 0 THEN 1 ELSE 0 END) AS weather_delays,
  SUM(CASE WHEN carrier_delay > 0 THEN 1 ELSE 0 END) AS carrier_delays,
  SUM(CASE WHEN security_delay > 0 THEN 1 ELSE 0 END) AS security_delays
FROM flight_data_2024_sample;
SELECT 
  month,
  AVG(dep_delay) AS avg_dep_delay,
  AVG(arr_delay) AS avg_arr_delay
FROM flight_data_2024_sample
GROUP BY month
ORDER BY month;
SELECT origin AS airport,
       COUNT(*) AS delayed_flights
FROM flight_data_2024_sample
WHERE dep_delay > 0
GROUP BY origin
ORDER BY delayed_flights DESC
LIMIT 5;
SELECT op_unique_carrier AS airline,
       COUNT(*) AS total_flights,
       SUM(CASE WHEN cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_flights,
       (SUM(CASE WHEN cancelled = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 
       AS cancellation_rate_percent
FROM flight_data_2024_sample
GROUP BY op_unique_carrier
ORDER BY cancellation_rate_percent DESC;
