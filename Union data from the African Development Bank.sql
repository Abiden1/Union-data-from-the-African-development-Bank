/*LEFT JOIN*/
SELECT 
*
FROM 
united_nations.Geographic_location AS geo
LEFT JOIN
united_nations.Economic_Indicators AS econ
ON geo.Country_name = econ.Country_name
LEFT JOIN
united_nations.Basic_Services AS svc
ON geo.Country_name = svc.Country_name
AND
econ.Time_period = svc.Time_period
WHERE 
Pct_unemployment IS NOT NULL;

/*join tabl*/
/*Obtain Time_period and Pct_unemployment columns for each country by combining the Geographic_Location and Economic_Indicators tables based on the Country_nam*/
SELECT
	loc.Country_name,
	eco.Time_period,
	eco.Pct_unemployment
FROM
	united_nations.Geographic_Location AS loc
LEFT JOIN
	united_nations.Economic_Indicators AS eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Central and Southern Asia%';


/*Impute NULL values¶
To enhance the completeness of our summary, we'll address missing unemployment rate values. 
If any unemployment rate is absent, we'll replace it with the regional data, which is 19.59 in this case. We will then save this column as Pct_unemployment_imputed.*/
SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 19.59) AS Pct_unemployment_imputed
FROM
	united_nations.Geographic_Location AS loc
LEFT JOIN
	united_nations.Economic_Indicators AS eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Central and Southern Asia%';


/*  Repeat for other regions
We can now repeat this process for various regions. We will use the UNION operator to combine the SELECT statements.*/
SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 19.59) as Pct_unemployment_imputed
FROM
	united_nations.Geographic_Location as loc
LEFT JOIN
	united_nations.Economic_Indicators as eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Central and Southern Asia%'

UNION

SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 22.64) as Pct_unemployment_imputed
FROM
	united_nations.Geographic_Location as loc
LEFT JOIN
	united_nations.Economic_Indicators as eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Eastern and South-Eastern Asia%'

UNION

SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 24.43) as Pct_unemployment_imputed
FROM united_nations.Geographic_Location as loc
LEFT JOIN
	united_nations.Economic_Indicators as eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Europe and Northern America%'

UNION

SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 24.23) as Pct_unemployment_imputed
FROM united_nations.Geographic_Location as loc
LEFT JOIN
	united_nations.Economic_Indicators as eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Latin America and the Caribbean%'

UNION

SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 17.84) as Pct_unemployment_imputed
FROM
	united_nations.Geographic_Location as loc
LEFT JOIN
	united_nations.Economic_Indicators as eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Northern Africa and Western Asia%'

UNION

SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 4.98) as Pct_unemployment_imputed
FROM
	united_nations.Geographic_Location as loc
LEFT JOIN
	united_nations.Economic_Indicators as eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Oceania%'

UNION

SELECT
	loc.Country_name,
	eco.Time_period,
	IFNULL(eco.Pct_unemployment, 33.65) as Pct_unemployment_imputed
FROM
	united_nations.Geographic_Location as loc
LEFT JOIN united_nations.Economic_Indicators as eco
	ON eco.Country_name = loc.Country_name
WHERE REGION LIKE '%Sub-Saharan Africa%';
