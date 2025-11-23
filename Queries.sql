-- Top 10 countries with their long-term economic growth in terms of GDP Growth rate

SELECT 
  country_name,
  year,
  AVG(gdp_growth_annual_percent) AS avg_growth_rate
FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
WHERE gdp_growth_annual_percent IS NOT NULL
 AND country_name in (
  SELECT 
    country_name
  FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
  GROUP BY country_name
  ORDER BY SUM(gdp_current_usd) DESC
  LIMIT 10
 )
GROUP BY country_name,year
ORDER BY year DESC, avg_growth_rate DESC;


-- Tax trends in top 10 major economies

SELECT
  country_name,
  year,
  tax_revenue_percent_gdp
FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
WHERE tax_revenue_percent_gdp IS NOT NULL
  AND country_name in (
  SELECT 
    country_name
  FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
  GROUP BY country_name
  ORDER BY SUM(gdp_current_usd) DESC
  LIMIT 10
 )
ORDER BY year DESC,tax_revenue_percent_gdp DESC;


-- Average Unemployment rate by country by year

SELECT
  country_name,
  year,
  AVG(unemployment_rate_percent) AS unemployment_rate_percent
FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
WHERE unemployment_rate_percent IS NOT NULL
  AND country_name in (
  SELECT 
    country_name
  FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
  GROUP BY country_name
  ORDER BY SUM(gdp_current_usd) DESC
  LIMIT 10
 )
GROUP BY country_name,year
ORDER BY year DESC, unemployment_rate_percent DESC;


-- Inflation Rate for top 10 major economies by year

SELECT
  country_name,
  year,
  inflation_cpi_percent
FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
WHERE inflation_cpi_percent IS NOT NULL
  AND country_name in (
  SELECT 
    country_name
  FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
  GROUP BY country_name
  ORDER BY SUM(gdp_current_usd) DESC
  LIMIT 10
 )
GROUP BY country_name, year, inflation_cpi_percent
ORDER BY year ASC, inflation_cpi_percent DESC;


-- Countries by Average GDP per capita over 2010 to 2023 

SELECT
  country_name,
  AVG(gdp_per_capita_usd) AS gdp_per_capita_usd
FROM `fa25-i535-suraiyer-wbindicator.world_bank_data.economic_indicators_cleaned`
WHERE gdp_per_capita_usd IS NOT NULL
GROUP BY country_name
ORDER BY gdp_per_capita_usd DESC;



























