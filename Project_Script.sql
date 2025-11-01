--SQL Script

--Total milk production in 2023
SELECT SUM(Value) FROM milk_production
WHERE YEAR = 2023;

-- States having cheese production in Apr 2023
SELECT State_ANSI, SUM(Value) FROM cheese_production
WHERE YEAR = 2023 AND Period = "APR"
GROUP BY State_ANSI
ORDER BY SUM(Value) DESC;

-- Total cofee production in 2011
SELECT SUM(Value) FROM coffee_production
WHERE YEAR = 2011;

-- Average honey production in 2022
SELECT AVG(Value) FROM honey_production
WHERE YEAR = 2022;

--State ANSI code for Florida
SELECT State, State_ANSI  FROM state_lookup
WHERE State = "FLORIDA";

-- State-wise cheese production in APR 2023
SELECT state_lookup.State  , SUM(cheese_production.Value)
FROM cheese_production INNER JOIN state_lookup ON cheese_production.State_ANSI = state_lookup.State_ANSI 
WHERE cheese_production."Year" = 2023 AND cheese_production.Period = "APR"
GROUP BY state_lookup.State
;

-- Total yogurt production states in 2022 having cheese production in 2023
SELECT SUM(Value) FROM yogurt_production
WHERE yogurt_production."Year" = 2022 
AND State_ANSI IN (
SELECT State_ANSI FROM cheese_production 
WHERE cheese_production."Year" = 2023
);

-- States not having any milk production in 2023
SELECT State
FROM state_lookup
WHERE State_ANSI NOT IN (
SELECT State_ANSI FROM milk_production
WHERE year = 2023
);

-- State-wise cheese production in APR 2023
SELECT state_lookup.State  , SUM(cheese_production.Value)
FROM cheese_production INNER JOIN state_lookup ON cheese_production.State_ANSI = state_lookup.State_ANSI 
WHERE cheese_production."Year" = 2023 AND cheese_production.Period = "APR"
GROUP BY state_lookup.State
;

-- Average cofee production from years having honey production more than 100 million
SELECT Avg(Value) FROM coffee_production
WHERE YEAR IN (
SELECT Year FROM honey_production 
GROUP BY Year
HAVING SUM(Value) > 100000000
);







