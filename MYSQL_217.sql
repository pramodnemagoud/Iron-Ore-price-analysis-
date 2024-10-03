use project_217;
select * from row_dataset;
-- DESCRIBE provides a detailed description of the table structure, including column names, data types, and other attributes.
DESCRIBE row_dataset;
	
select count(*) from Data_set;

-- View all the columns datatype in the table
select column_name, data_type
from information_schema.columns
where table_name = 'row_dataset'
and table_schema = 'project_217';

/*data_type LIKE 'int%' will match columns of type INT, INTEGER, etc.
data_type LIKE 'decimal%' will match columns of type DECIMAL.
data_type LIKE 'float%' will match columns of type FLOAT.
data_type LIKE 'double%' will match columns of type DOUBLE */

-- View only numerical columns datatype in the table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'row_dataset'
  AND table_schema = 'project_217'
  AND (data_type LIKE 'int%' OR data_type LIKE 'decimal%' OR data_type LIKE 'float%' OR data_type LIKE 'double%');


CREATE TABLE dataset AS
SELECT *
FROM row_dataset;

##############################################
####### ALL BUSINESS MOMENTs ##########

####### FIRST MOMENT BUSINESS DECISION ##########

######### MEASURE OF CENTRAL TENDENCY ###########

######### MEAN ###########
SELECT 
    AVG(Iron_Ore_Price) AS Avg_Iron_Ore_Price,
    AVG(Global_Demand) AS Avg_Global_Demand,
    AVG(Global_Supply) AS Avg_Global_Supply,
    AVG(Freight_Rate) AS Avg_Freight_Rate,
    AVG(Stockpile) AS Avg_Stockpile,
    AVG(Production_Volume) AS Avg_Production_Volume,
    AVG(Production_Cost) AS Avg_Production_Cost,
    AVG(Exchange_Rate_USD) AS Avg_Exchange_Rate_USD,
    AVG(Interest_Rate) AS Avg_Interest_Rate,
    AVG(Inflation_Rate) AS Avg_Inflation_Rate,
    AVG(GDP_Growth_Importer) AS Avg_GDP_Growth_Importer,
    AVG(Tariffs) AS Avg_Tariffs,
    AVG(Steel_Production) AS Avg_Steel_Production,
    AVG(Carbon_Emissions) AS Avg_Carbon_Emissions,
    AVG(Aluminum_Price) AS Avg_Aluminum_Price,
    AVG(Copper_Price) AS Avg_Copper_Price,
    AVG(Nickel_Price) AS Avg_Nickel_Price
FROM dataset;

######## MEADIAN #########

### 1. **Median for Iron_Ore_Price**

SELECT `Iron_Ore_Price` AS median_Iron_Ore_Price
FROM (
    SELECT `Iron_Ore_Price`, 
           ROW_NUMBER() OVER (ORDER BY `Iron_Ore_Price`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 2. **Median for Global_Demand**

SELECT `Global_Demand` AS median_Global_Demand
FROM (
    SELECT `Global_Demand`, 
           ROW_NUMBER() OVER (ORDER BY `Global_Demand`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

### 3. **Median for Global_Supply**

SELECT `Global_Supply` AS median_Global_Supply
FROM (
    SELECT `Global_Supply`, 
           ROW_NUMBER() OVER (ORDER BY `Global_Supply`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 4. **Median for Freight_Rate**

SELECT `Freight_Rate` AS median_Freight_Rate
FROM (
    SELECT `Freight_Rate`, 
           ROW_NUMBER() OVER (ORDER BY `Freight_Rate`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 5. **Median for Stockpile**

SELECT `Stockpile` AS median_Stockpile
FROM (
    SELECT `Stockpile`, 
           ROW_NUMBER() OVER (ORDER BY `Stockpile`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 6. **Median for Production_Volume**

SELECT `Production_Volume` AS median_Production_Volume
FROM (
    SELECT `Production_Volume`, 
           ROW_NUMBER() OVER (ORDER BY `Production_Volume`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;
 

### 7. **Median for Production_Cost**
 
SELECT `Production_Cost` AS median_Production_Cost
FROM (
    SELECT `Production_Cost`, 
           ROW_NUMBER() OVER (ORDER BY `Production_Cost`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 8. **Median for Exchange_Rate_USD**

SELECT `Exchange_Rate_USD` AS median_Exchange_Rate_USD
FROM (
    SELECT `Exchange_Rate_USD`, 
           ROW_NUMBER() OVER (ORDER BY `Exchange_Rate_USD`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 9. **Median for Interest_Rate**

SELECT `Interest_Rate` AS median_Interest_Rate
FROM (
    SELECT `Interest_Rate`, 
           ROW_NUMBER() OVER (ORDER BY `Interest_Rate`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 10. **Median for Inflation_Rate**

SELECT `Inflation_Rate` AS median_Inflation_Rate
FROM (
    SELECT `Inflation_Rate`, 
           ROW_NUMBER() OVER (ORDER BY `Inflation_Rate`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 11. **Median for GDP_Growth_Importer**

SELECT `GDP_Growth_Importer` AS median_GDP_Growth_Importer
FROM (
    SELECT `GDP_Growth_Importer`, 
           ROW_NUMBER() OVER (ORDER BY `GDP_Growth_Importer`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 12. **Median for Tariffs**

SELECT `Tariffs` AS median_Tariffs
FROM (
    SELECT `Tariffs`, 
           ROW_NUMBER() OVER (ORDER BY `Tariffs`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

### 13. **Median for Steel_Production**

SELECT `Steel_Production` AS median_Steel_Production
FROM (
    SELECT `Steel_Production`, 
           ROW_NUMBER() OVER (ORDER BY `Steel_Production`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;


### 14. **Median for Carbon_Emissions**

SELECT `Carbon_Emissions` AS median_Carbon_Emissions
FROM (
    SELECT `Carbon_Emissions`, 
           ROW_NUMBER() OVER (ORDER BY `Carbon_Emissions`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

### 15. **Median for Aluminum_Price**
 
SELECT `Aluminum_Price` AS median_Aluminum_Price
FROM (
    SELECT `Aluminum_Price`, 
           ROW_NUMBER() OVER (ORDER BY `Aluminum_Price`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;
 

### 16. **Median for Copper_Price**

SELECT `Copper_Price` AS median_Copper_Price
FROM (
    SELECT `Copper_Price`, 
           ROW_NUMBER() OVER (ORDER BY `Copper_Price`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;
 

### 17.  Median for Nickel_Price

SELECT `Nickel_Price` AS median_Nickel_Price
FROM (
    SELECT `Nickel_Price`, 
           ROW_NUMBER() OVER (ORDER BY `Nickel_Price`) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM dataset
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;
 
###### MODE###########
-- Mode for Iron_Ore_Price
SELECT `Iron_Ore_Price` AS Mode_Iron_Ore_Price
FROM dataset
GROUP BY `Iron_Ore_Price`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Global_Demand
SELECT `Global_Demand` AS Mode_Global_Demand
FROM dataset
GROUP BY `Global_Demand`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Global_Supply
SELECT `Global_Supply` AS Mode_Global_Supply
FROM dataset
GROUP BY `Global_Supply`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Freight_Rate
SELECT `Freight_Rate` AS Mode_Freight_Rate
FROM dataset
GROUP BY `Freight_Rate`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Stockpile
SELECT `Stockpile` AS Mode_Stockpile
FROM dataset
GROUP BY `Stockpile`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Production_Volume
SELECT `Production_Volume` AS Mode_Production_Volume
FROM dataset
GROUP BY `Production_Volume`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Production_Cost
SELECT `Production_Cost` AS Mode_Production_Cost
FROM dataset
GROUP BY `Production_Cost`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Exchange_Rate_USD
SELECT `Exchange_Rate_USD` AS Mode_Exchange_Rate_USD
FROM dataset
GROUP BY `Exchange_Rate_USD`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Interest_Rate
SELECT `Interest_Rate` AS Mode_Interest_Rate
FROM dataset
GROUP BY `Interest_Rate`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Inflation_Rate
SELECT `Inflation_Rate` AS Mode_Inflation_Rate
FROM dataset
GROUP BY `Inflation_Rate`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for GDP_Growth_Importer
SELECT `GDP_Growth_Importer` AS Mode_GDP_Growth_Importer
FROM dataset
GROUP BY `GDP_Growth_Importer`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Tariffs
SELECT `Tariffs` AS Mode_Tariffs
FROM dataset
GROUP BY `Tariffs`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Steel_Production
SELECT `Steel_Production` AS Mode_Steel_Production
FROM dataset
GROUP BY `Steel_Production`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Carbon_Emissions
SELECT `Carbon_Emissions` AS Mode_Carbon_Emissions
FROM dataset
GROUP BY `Carbon_Emissions`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Aluminum_Price
SELECT `Aluminum_Price` AS Mode_Aluminum_Price
FROM dataset
GROUP BY `Aluminum_Price`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Copper_Price
SELECT `Copper_Price` AS Mode_Copper_Price
FROM dataset
GROUP BY `Copper_Price`
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Mode for Nickel_Price
SELECT `Nickel_Price` AS Mode_Nickel_Price
FROM dataset
GROUP BY `Nickel_Price`
ORDER BY COUNT(*) DESC
LIMIT 1;
############ SECOND MOMENT BUSINESS DECISION ##########

############ MEASURE OF DISPERSION #############


###### VARIANCE AND STANDARD DEVIATION ###########
-- Variance and Standard Deviation for Iron_Ore_Price
SELECT 
    VAR_POP(`Iron_Ore_Price`) AS Variance_Iron_Ore_Price,
    STDDEV_POP(`Iron_Ore_Price`) AS StdDev_Iron_Ore_Price
FROM dataset;

-- Variance and Standard Deviation for Global_Demand
SELECT 
    VAR_POP(`Global_Demand`) AS Variance_Global_Demand,
    STDDEV_POP(`Global_Demand`) AS StdDev_Global_Demand
FROM dataset;

-- Variance and Standard Deviation for Global_Supply
SELECT 
    VAR_POP(`Global_Supply`) AS Variance_Global_Supply,
    STDDEV_POP(`Global_Supply`) AS StdDev_Global_Supply
FROM dataset;

-- Variance and Standard Deviation for Freight_Rate
SELECT 
    VAR_POP(`Freight_Rate`) AS Variance_Freight_Rate,
    STDDEV_POP(`Freight_Rate`) AS StdDev_Freight_Rate
FROM dataset;

-- Variance and Standard Deviation for Stockpile
SELECT 
    VAR_POP(`Stockpile`) AS Variance_Stockpile,
    STDDEV_POP(`Stockpile`) AS StdDev_Stockpile
FROM dataset;

-- Variance and Standard Deviation for Production_Volume
SELECT 
    VAR_POP(`Production_Volume`) AS Variance_Production_Volume,
    STDDEV_POP(`Production_Volume`) AS StdDev_Production_Volume
FROM dataset;

-- Variance and Standard Deviation for Production_Cost
SELECT 
    VAR_POP(`Production_Cost`) AS Variance_Production_Cost,
    STDDEV_POP(`Production_Cost`) AS StdDev_Production_Cost
FROM dataset;

-- Variance and Standard Deviation for Exchange_Rate_USD
SELECT 
    VAR_POP(`Exchange_Rate_USD`) AS Variance_Exchange_Rate_USD,
    STDDEV_POP(`Exchange_Rate_USD`) AS StdDev_Exchange_Rate_USD
FROM dataset;

-- Variance and Standard Deviation for Interest_Rate
SELECT 
    VAR_POP(`Interest_Rate`) AS Variance_Interest_Rate,
    STDDEV_POP(`Interest_Rate`) AS StdDev_Interest_Rate
FROM dataset;

-- Variance and Standard Deviation for Inflation_Rate
SELECT 
    VAR_POP(`Inflation_Rate`) AS Variance_Inflation_Rate,
    STDDEV_POP(`Inflation_Rate`) AS StdDev_Inflation_Rate
FROM dataset;

-- Variance and Standard Deviation for GDP_Growth_Importer
SELECT 
    VAR_POP(`GDP_Growth_Importer`) AS Variance_GDP_Growth_Importer,
    STDDEV_POP(`GDP_Growth_Importer`) AS StdDev_GDP_Growth_Importer
FROM dataset;

-- Variance and Standard Deviation for Tariffs
SELECT 
    VAR_POP(`Tariffs`) AS Variance_Tariffs,
    STDDEV_POP(`Tariffs`) AS StdDev_Tariffs
FROM dataset;

-- Variance and Standard Deviation for Steel_Production
SELECT 
    VAR_POP(`Steel_Production`) AS Variance_Steel_Production,
    STDDEV_POP(`Steel_Production`) AS StdDev_Steel_Production
FROM dataset;

-- Variance and Standard Deviation for Carbon_Emissions
SELECT 
    VAR_POP(`Carbon_Emissions`) AS Variance_Carbon_Emissions,
    STDDEV_POP(`Carbon_Emissions`) AS StdDev_Carbon_Emissions
FROM dataset;

-- Variance and Standard Deviation for Aluminum_Price
SELECT 
    VAR_POP(`Aluminum_Price`) AS Variance_Aluminum_Price,
    STDDEV_POP(`Aluminum_Price`) AS StdDev_Aluminum_Price
FROM dataset;

-- Variance and Standard Deviation for Copper_Price
SELECT 
    VAR_POP(`Copper_Price`) AS Variance_Copper_Price,
    STDDEV_POP(`Copper_Price`) AS StdDev_Copper_Price
FROM dataset;

-- Variance and Standard Deviation for Nickel_Price
SELECT 
    VAR_POP(`Nickel_Price`) AS Variance_Nickel_Price,
    STDDEV_POP(`Nickel_Price`) AS StdDev_Nickel_Price
FROM dataset;

####### RANGE ##########
 /*The range is calculated as MAX(column_name) - MIN(column_name), 
   which gives the difference between the highest and lowest values in the column.*/
-- Range for Iron_Ore_Price
SELECT 
    MAX(`Iron_Ore_Price`) - MIN(`Iron_Ore_Price`) AS Range_Iron_Ore_Price
FROM dataset;

-- Range for Global_Demand
SELECT 
    MAX(`Global_Demand`) - MIN(`Global_Demand`) AS Range_Global_Demand
FROM dataset;

-- Range for Global_Supply
SELECT 
    MAX(`Global_Supply`) - MIN(`Global_Supply`) AS Range_Global_Supply
FROM dataset;

-- Range for Freight_Rate
SELECT 
    MAX(`Freight_Rate`) - MIN(`Freight_Rate`) AS Range_Freight_Rate
FROM dataset;

-- Range for Stockpile
SELECT 
    MAX(`Stockpile`) - MIN(`Stockpile`) AS Range_Stockpile
FROM dataset;

-- Range for Production_Volume
SELECT 
    MAX(`Production_Volume`) - MIN(`Production_Volume`) AS Range_Production_Volume
FROM dataset;

-- Range for Production_Cost
SELECT 
    MAX(`Production_Cost`) - MIN(`Production_Cost`) AS Range_Production_Cost
FROM dataset;

-- Range for Exchange_Rate_USD
SELECT 
    MAX(`Exchange_Rate_USD`) - MIN(`Exchange_Rate_USD`) AS Range_Exchange_Rate_USD
FROM dataset;

-- Range for Interest_Rate
SELECT 
    MAX(`Interest_Rate`) - MIN(`Interest_Rate`) AS Range_Interest_Rate
FROM dataset;

-- Range for Inflation_Rate
SELECT 
    MAX(`Inflation_Rate`) - MIN(`Inflation_Rate`) AS Range_Inflation_Rate
FROM dataset;

-- Range for GDP_Growth_Importer
SELECT 
    MAX(`GDP_Growth_Importer`) - MIN(`GDP_Growth_Importer`) AS Range_GDP_Growth_Importer
FROM dataset;

-- Range for Tariffs
SELECT 
    MAX(`Tariffs`) - MIN(`Tariffs`) AS Range_Tariffs
FROM dataset;

-- Range for Steel_Production
SELECT 
    MAX(`Steel_Production`) - MIN(`Steel_Production`) AS Range_Steel_Production
FROM dataset;

-- Range for Carbon_Emissions
SELECT 
    MAX(`Carbon_Emissions`) - MIN(`Carbon_Emissions`) AS Range_Carbon_Emissions
FROM dataset;

-- Range for Aluminum_Price
SELECT 
    MAX(`Aluminum_Price`) - MIN(`Aluminum_Price`) AS Range_Aluminum_Price
FROM dataset;

-- Range for Copper_Price
SELECT 
    MAX(`Copper_Price`) - MIN(`Copper_Price`) AS Range_Copper_Price
FROM dataset;

-- Range for Nickel_Price
SELECT 
    MAX(`Nickel_Price`) - MIN(`Nickel_Price`) AS Range_Nickel_Price
FROM dataset;


############## THIRD MOMENT BUSINESS DECISION # MEASURE OF ASSEMETRY #############
############## FOURTH MOMENT BUSINESS DECISION # MEASURE OF PEAKNESS #############
/*
3.Skewness Calculation: It measures the asymmetry of the distribution. A positive skew indicates a long right tail,
 while a negative skew indicates a long left tail. The formula involves the third moment of the distribution divided 
 by the cube of the standard deviation.

4.Kurtosis Calculation: It measures the "tailedness" of the distribution. 
A kurtosis greater than 0 indicates a heavier tail compared to a normal distribution, 
while less than 0 indicates a lighter tail. The formula involves the fourth moment of the distribution 
divided by the fourth power of the standard deviation, subtracting 3 to make the normal distribution have a kurtosis of 0.*/
SELECT 
    -- Skewness and Kurtosis for Iron_Ore_Price
    (SUM(POW(`Iron_Ore_Price` - (SELECT AVG(`Iron_Ore_Price`) FROM dataset), 3)) / COUNT(`Iron_Ore_Price`)) / 
    (POW(STDDEV(`Iron_Ore_Price`), 3)) AS Skewness_Iron_Ore_Price,
    
    (SUM(POW(`Iron_Ore_Price` - (SELECT AVG(`Iron_Ore_Price`) FROM dataset), 4)) / COUNT(`Iron_Ore_Price`)) / 
    (POW(STDDEV(`Iron_Ore_Price`), 4)) - 3 AS Kurtosis_Iron_Ore_Price,

    -- Skewness and Kurtosis for Global_Demand
    (SUM(POW(`Global_Demand` - (SELECT AVG(`Global_Demand`) FROM dataset), 3)) / COUNT(`Global_Demand`)) / 
    (POW(STDDEV(`Global_Demand`), 3)) AS Skewness_Global_Demand,

    (SUM(POW(`Global_Demand` - (SELECT AVG(`Global_Demand`) FROM dataset), 4)) / COUNT(`Global_Demand`)) / 
    (POW(STDDEV(`Global_Demand`), 4)) - 3 AS Kurtosis_Global_Demand,

    -- Skewness and Kurtosis for Global_Supply
    (SUM(POW(`Global_Supply` - (SELECT AVG(`Global_Supply`) FROM dataset), 3)) / COUNT(`Global_Supply`)) / 
    (POW(STDDEV(`Global_Supply`), 3)) AS Skewness_Global_Supply,

    (SUM(POW(`Global_Supply` - (SELECT AVG(`Global_Supply`) FROM dataset), 4)) / COUNT(`Global_Supply`)) / 
    (POW(STDDEV(`Global_Supply`), 4)) - 3 AS Kurtosis_Global_Supply,

    -- Skewness and Kurtosis for Freight_Rate
    (SUM(POW(`Freight_Rate` - (SELECT AVG(`Freight_Rate`) FROM dataset), 3)) / COUNT(`Freight_Rate`)) / 
    (POW(STDDEV(`Freight_Rate`), 3)) AS Skewness_Freight_Rate,

    (SUM(POW(`Freight_Rate` - (SELECT AVG(`Freight_Rate`) FROM dataset), 4)) / COUNT(`Freight_Rate`)) / 
    (POW(STDDEV(`Freight_Rate`), 4)) - 3 AS Kurtosis_Freight_Rate,

    -- Skewness and Kurtosis for Stockpile
    (SUM(POW(`Stockpile` - (SELECT AVG(`Stockpile`) FROM dataset), 3)) / COUNT(`Stockpile`)) / 
    (POW(STDDEV(`Stockpile`), 3)) AS Skewness_Stockpile,

    (SUM(POW(`Stockpile` - (SELECT AVG(`Stockpile`) FROM dataset), 4)) / COUNT(`Stockpile`)) / 
    (POW(STDDEV(`Stockpile`), 4)) - 3 AS Kurtosis_Stockpile,

    -- Skewness and Kurtosis for Production_Volume
    (SUM(POW(`Production_Volume` - (SELECT AVG(`Production_Volume`) FROM dataset), 3)) / COUNT(`Production_Volume`)) / 
    (POW(STDDEV(`Production_Volume`), 3)) AS Skewness_Production_Volume,

    (SUM(POW(`Production_Volume` - (SELECT AVG(`Production_Volume`) FROM dataset), 4)) / COUNT(`Production_Volume`)) / 
    (POW(STDDEV(`Production_Volume`), 4)) - 3 AS Kurtosis_Production_Volume,

    -- Skewness and Kurtosis for Production_Cost
    (SUM(POW(`Production_Cost` - (SELECT AVG(`Production_Cost`) FROM dataset), 3)) / COUNT(`Production_Cost`)) / 
    (POW(STDDEV(`Production_Cost`), 3)) AS Skewness_Production_Cost,

    (SUM(POW(`Production_Cost` - (SELECT AVG(`Production_Cost`) FROM dataset), 4)) / COUNT(`Production_Cost`)) / 
    (POW(STDDEV(`Production_Cost`), 4)) - 3 AS Kurtosis_Production_Cost,

    -- Skewness and Kurtosis for Exchange_Rate_USD
    (SUM(POW(`Exchange_Rate_USD` - (SELECT AVG(`Exchange_Rate_USD`) FROM dataset), 3)) / COUNT(`Exchange_Rate_USD`)) / 
    (POW(STDDEV(`Exchange_Rate_USD`), 3)) AS Skewness_Exchange_Rate_USD,

    (SUM(POW(`Exchange_Rate_USD` - (SELECT AVG(`Exchange_Rate_USD`) FROM dataset), 4)) / COUNT(`Exchange_Rate_USD`)) / 
    (POW(STDDEV(`Exchange_Rate_USD`), 4)) - 3 AS Kurtosis_Exchange_Rate_USD,

    -- Skewness and Kurtosis for Interest_Rate
    (SUM(POW(`Interest_Rate` - (SELECT AVG(`Interest_Rate`) FROM dataset), 3)) / COUNT(`Interest_Rate`)) / 
    (POW(STDDEV(`Interest_Rate`), 3)) AS Skewness_Interest_Rate,

    (SUM(POW(`Interest_Rate` - (SELECT AVG(`Interest_Rate`) FROM dataset), 4)) / COUNT(`Interest_Rate`)) / 
    (POW(STDDEV(`Interest_Rate`), 4)) - 3 AS Kurtosis_Interest_Rate,

    -- Skewness and Kurtosis for Inflation_Rate
    (SUM(POW(`Inflation_Rate` - (SELECT AVG(`Inflation_Rate`) FROM dataset), 3)) / COUNT(`Inflation_Rate`)) / 
    (POW(STDDEV(`Inflation_Rate`), 3)) AS Skewness_Inflation_Rate,

    (SUM(POW(`Inflation_Rate` - (SELECT AVG(`Inflation_Rate`) FROM dataset), 4)) / COUNT(`Inflation_Rate`)) / 
    (POW(STDDEV(`Inflation_Rate`), 4)) - 3 AS Kurtosis_Inflation_Rate,

    -- Skewness and Kurtosis for GDP_Growth_Importer
    (SUM(POW(`GDP_Growth_Importer` - (SELECT AVG(`GDP_Growth_Importer`) FROM dataset), 3)) / COUNT(`GDP_Growth_Importer`)) / 
    (POW(STDDEV(`GDP_Growth_Importer`), 3)) AS Skewness_GDP_Growth_Importer,

    (SUM(POW(`GDP_Growth_Importer` - (SELECT AVG(`GDP_Growth_Importer`) FROM dataset), 4)) / COUNT(`GDP_Growth_Importer`)) / 
    (POW(STDDEV(`GDP_Growth_Importer`), 4)) - 3 AS Kurtosis_GDP_Growth_Importer,

    -- Skewness and Kurtosis for Tariffs
    (SUM(POW(`Tariffs` - (SELECT AVG(`Tariffs`) FROM dataset), 3)) / COUNT(`Tariffs`)) / 
    (POW(STDDEV(`Tariffs`), 3)) AS Skewness_Tariffs,

    (SUM(POW(`Tariffs` - (SELECT AVG(`Tariffs`) FROM dataset), 4)) / COUNT(`Tariffs`)) / 
    (POW(STDDEV(`Tariffs`), 4)) - 3 AS Kurtosis_Tariffs,

    -- Skewness and Kurtosis for Steel_Production
    (SUM(POW(`Steel_Production` - (SELECT AVG(`Steel_Production`) FROM dataset), 3)) / COUNT(`Steel_Production`)) / 
    (POW(STDDEV(`Steel_Production`), 3)) AS Skewness_Steel_Production,

    (SUM(POW(`Steel_Production` - (SELECT AVG(`Steel_Production`) FROM dataset), 4)) / COUNT(`Steel_Production`)) / 
    (POW(STDDEV(`Steel_Production`), 4)) - 3 AS Kurtosis_Steel_Production,

    -- Skewness and Kurtosis for Carbon_Emissions
    (SUM(POW(`Carbon_Emissions` - (SELECT AVG(`Carbon_Emissions`) FROM dataset), 3)) / COUNT(`Carbon_Emissions`)) / 
    (POW(STDDEV(`Carbon_Emissions`), 3)) AS Skewness_Carbon_Emissions,

    (SUM(POW(`Carbon_Emissions` - (SELECT AVG(`Carbon_Emissions`) FROM dataset), 4)) / COUNT(`Carbon_Emissions`)) / 
    (POW(STDDEV(`Carbon_Emissions`), 4)) - 3 AS Kurtosis_Carbon_Emissions,

    -- Skewness and Kurtosis for Aluminum_Price
    (SUM(POW(`Aluminum_Price` - (SELECT AVG(`Aluminum_Price`) FROM dataset), 3)) / COUNT(`Aluminum_Price`)) / 
    (POW(STDDEV(`Aluminum_Price`), 3)) AS Skewness_Aluminum_Price,

    (SUM(POW(`Aluminum_Price` - (SELECT AVG(`Aluminum_Price`) FROM dataset), 4)) / COUNT(`Aluminum_Price`)) / 
    (POW(STDDEV(`Aluminum_Price`), 4)) - 3 AS Kurtosis_Aluminum_Price,

    -- Skewness and Kurtosis for Copper_Price
    (SUM(POW(`Copper_Price` - (SELECT AVG(`Copper_Price`) FROM dataset), 3)) / COUNT(`Copper_Price`)) / 
    (POW(STDDEV(`Copper_Price`), 3)) AS Skewness_Copper_Price,

    (SUM(POW(`Copper_Price` - (SELECT AVG(`Copper_Price`) FROM dataset), 4)) / COUNT(`Copper_Price`)) / 
    (POW(STDDEV(`Copper_Price`), 4)) - 3 AS Kurtosis_Copper_Price,

    -- Skewness and Kurtosis for Nickel_Price
    (SUM(POW(`Nickel_Price` - (SELECT AVG(`Nickel_Price`) FROM dataset), 3)) / COUNT(`Nickel_Price`)) / 
    (POW(STDDEV(`Nickel_Price`), 3)) AS Skewness_Nickel_Price,

    (SUM(POW(`Nickel_Price` - (SELECT AVG(`Nickel_Price`) FROM dataset), 4)) / COUNT(`Nickel_Price`)) / 
    (POW(STDDEV(`Nickel_Price`), 4)) - 3 AS Kurtosis_Nickel_Price

FROM dataset;



#####################################################################################################
#                	Duplicate Rows Identification       
######################################################################################################
SELECT 
    Date, Iron_Ore_Price, Global_Demand, Global_Supply, Freight_Rate, 
    Stockpile, Production_Volume, Production_Cost, Ore_Grade, Mining_Location, 
    Exchange_Rate_USD, Interest_Rate, Inflation_Rate, GDP_Growth_Importer, 
    Tariffs, Steel_Production, Carbon_Emissions, Aluminum_Price, Copper_Price, Nickel_Price,
    COUNT(*) AS count
FROM 
    dataset
GROUP BY 
    Date, Iron_Ore_Price, Global_Demand, Global_Supply, Freight_Rate, 
    Stockpile, Production_Volume, Production_Cost, Ore_Grade, Mining_Location, 
    Exchange_Rate_USD, Interest_Rate, Inflation_Rate, GDP_Growth_Importer, 
    Tariffs, Steel_Production, Carbon_Emissions, Aluminum_Price, Copper_Price, Nickel_Price
HAVING 
    COUNT(*) > 1; # NO DUPLICATE ROWS FOUND





-- ---------------------------------------------------------------------------------------------------
# 				IDENTIFYING MISSING VALUES 		
#######################################################################################################
SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS missing_Date,
    SUM(CASE WHEN Iron_Ore_Price IS NULL THEN 1 ELSE 0 END) AS missing_Iron_Ore_Price,
    SUM(CASE WHEN Global_Demand IS NULL THEN 1 ELSE 0 END) AS missing_Global_Demand,
    SUM(CASE WHEN Global_Supply IS NULL THEN 1 ELSE 0 END) AS missing_Global_Supply,
    SUM(CASE WHEN Freight_Rate IS NULL THEN 1 ELSE 0 END) AS missing_Freight_Rate,
    SUM(CASE WHEN Stockpile IS NULL THEN 1 ELSE 0 END) AS missing_Stockpile,
    SUM(CASE WHEN Production_Volume IS NULL THEN 1 ELSE 0 END) AS missing_Production_Volume,
    SUM(CASE WHEN Production_Cost IS NULL THEN 1 ELSE 0 END) AS missing_Production_Cost,
    SUM(CASE WHEN Ore_Grade IS NULL THEN 1 ELSE 0 END) AS missing_Ore_Grade,
    SUM(CASE WHEN Mining_Location IS NULL THEN 1 ELSE 0 END) AS missing_Mining_Location,
    SUM(CASE WHEN Exchange_Rate_USD IS NULL THEN 1 ELSE 0 END) AS missing_Exchange_Rate_USD,
    SUM(CASE WHEN Interest_Rate IS NULL THEN 1 ELSE 0 END) AS missing_Interest_Rate,
    SUM(CASE WHEN Inflation_Rate IS NULL THEN 1 ELSE 0 END) AS missing_Inflation_Rate,
    SUM(CASE WHEN GDP_Growth_Importer IS NULL THEN 1 ELSE 0 END) AS missing_GDP_Growth_Importer,
    SUM(CASE WHEN Tariffs IS NULL THEN 1 ELSE 0 END) AS missing_Tariffs,
    SUM(CASE WHEN Steel_Production IS NULL THEN 1 ELSE 0 END) AS missing_Steel_Production,
    SUM(CASE WHEN Carbon_Emissions IS NULL THEN 1 ELSE 0 END) AS missing_Carbon_Emissions,
    SUM(CASE WHEN Aluminum_Price IS NULL THEN 1 ELSE 0 END) AS missing_Aluminum_Price,
    SUM(CASE WHEN Copper_Price IS NULL THEN 1 ELSE 0 END) AS missing_Copper_Price,
    SUM(CASE WHEN Nickel_Price IS NULL THEN 1 ELSE 0 END) AS missing_Nickel_Price
FROM 
    dataset;
    

/*-- update the missing values by using a subquery that calculates the median for each column. Here’s how to do it for each specified column:
-- Updated Approach to Calculate and Update Missing Values with Median
To calculate the median without running into syntax issues, you can follow these steps:

Count the total number of non-null values.
Use a subquery to get the median value based on the count.*/

SET SQL_SAFE_UPDATES = 0;
-- . Iron_Ore_Price

UPDATE dataset
SET Iron_Ore_Price = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Iron_Ore_Price AS middle_values
        FROM dataset
        WHERE Iron_Ore_Price IS NOT NULL
        ORDER BY Iron_Ore_Price
        LIMIT 2
    ) AS median_values
) 
WHERE Iron_Ore_Price IS NULL;
-- 2. Global_Demand

UPDATE dataset
SET Global_Demand = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Global_Demand AS middle_values
        FROM dataset
        WHERE Global_Demand IS NOT NULL
        ORDER BY Global_Demand
        LIMIT 2
    ) AS median_values
) 
WHERE Global_Demand IS NULL;
#3. Global_Supply

UPDATE dataset
SET Global_Supply = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Global_Supply AS middle_values
        FROM dataset
        WHERE Global_Supply IS NOT NULL
        ORDER BY Global_Supply
        LIMIT 2
    ) AS median_values
) 
WHERE Global_Supply IS NULL;
-- 4. Freight_Rate

UPDATE dataset
SET Freight_Rate = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Freight_Rate AS middle_values
        FROM dataset
        WHERE Freight_Rate IS NOT NULL
        ORDER BY Freight_Rate
        LIMIT 2
    ) AS median_values
) 
WHERE Freight_Rate IS NULL;
#5. Stockpile

UPDATE dataset
SET Stockpile = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Stockpile AS middle_values
        FROM dataset
        WHERE Stockpile IS NOT NULL
        ORDER BY Stockpile
        LIMIT 2
    ) AS median_values
) 
WHERE Stockpile IS NULL;
#6. Production_Volume

UPDATE dataset
SET Production_Volume = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Production_Volume AS middle_values
        FROM dataset
        WHERE Production_Volume IS NOT NULL
        ORDER BY Production_Volume
        LIMIT 2
    ) AS median_values
) 
WHERE Production_Volume IS NULL;
#7. Production_Cost

UPDATE dataset
SET Production_Cost = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Production_Cost AS middle_values
        FROM dataset
        WHERE Production_Cost IS NOT NULL
        ORDER BY Production_Cost
        LIMIT 2
    ) AS median_values
) 
WHERE Production_Cost IS NULL;
#8. Exchange_Rate_USD

UPDATE dataset
SET Exchange_Rate_USD = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Exchange_Rate_USD AS middle_values
        FROM dataset
        WHERE Exchange_Rate_USD IS NOT NULL
        ORDER BY Exchange_Rate_USD
        LIMIT 2
    ) AS median_values
) 
WHERE Exchange_Rate_USD IS NULL;
#9. Interest_Rate

UPDATE dataset
SET Interest_Rate = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Interest_Rate AS middle_values
        FROM dataset
        WHERE Interest_Rate IS NOT NULL
        ORDER BY Interest_Rate
        LIMIT 2
    ) AS median_values
) 
WHERE Interest_Rate IS NULL;
#10. Inflation_Rate

UPDATE dataset
SET Inflation_Rate = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Inflation_Rate AS middle_values
        FROM dataset
        WHERE Inflation_Rate IS NOT NULL
        ORDER BY Inflation_Rate
        LIMIT 2
    ) AS median_values
) 
WHERE Inflation_Rate IS NULL;
#11. GDP_Growth_Importer

UPDATE dataset
SET GDP_Growth_Importer = (
    SELECT AVG(middle_values)
    FROM (
        SELECT GDP_Growth_Importer AS middle_values
        FROM dataset
        WHERE GDP_Growth_Importer IS NOT NULL
        ORDER BY GDP_Growth_Importer
        LIMIT 2
    ) AS median_values
) 
WHERE GDP_Growth_Importer IS NULL;
#12. Tariffs

UPDATE dataset
SET Tariffs = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Tariffs AS middle_values
        FROM dataset
        WHERE Tariffs IS NOT NULL
        ORDER BY Tariffs
        LIMIT 2
    ) AS median_values
) 
WHERE Tariffs IS NULL;
#13. Steel_Production

UPDATE dataset
SET Steel_Production = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Steel_Production AS middle_values
        FROM dataset
        WHERE Steel_Production IS NOT NULL
        ORDER BY Steel_Production
        LIMIT 2
    ) AS median_values
) 
WHERE Steel_Production IS NULL;
#14. Carbon_Emissions

UPDATE dataset
SET Carbon_Emissions = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Carbon_Emissions AS middle_values
        FROM dataset
        WHERE Carbon_Emissions IS NOT NULL
        ORDER BY Carbon_Emissions
        LIMIT 2
    ) AS median_values
) 
WHERE Carbon_Emissions IS NULL;
#15. Aluminum_Price

UPDATE dataset
SET Aluminum_Price = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Aluminum_Price AS middle_values
        FROM dataset
        WHERE Aluminum_Price IS NOT NULL
        ORDER BY Aluminum_Price
        LIMIT 2
    ) AS median_values
) 
WHERE Aluminum_Price IS NULL;

-- 16. Copper_Price

UPDATE dataset
SET Copper_Price = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Copper_Price AS middle_values
        FROM dataset
        WHERE Copper_Price IS NOT NULL
        ORDER BY Copper_Price
        LIMIT 2
    ) AS median_values
) 
WHERE Copper_Price IS NULL;

-- 17. Nickel_Price

UPDATE dataset
SET Nickel_Price = (
    SELECT AVG(middle_values)
    FROM (
        SELECT Nickel_Price AS middle_values
        FROM dataset
        WHERE Nickel_Price IS NOT NULL
        ORDER BY Nickel_Price
        LIMIT 2
    ) AS median_values
) 
WHERE Nickel_Price IS NULL;

    
    
    
    -- ----------------------------------------------------------------------------------------------------------
# 									Outliers Detection AND Outliers Treatment
###########################################################################################################

SET SQL_SAFE_UPDATES = 0;
-- Iron_Ore_Price
WITH Ordered AS (
    SELECT Iron_Ore_Price, ROW_NUMBER() OVER (ORDER BY Iron_Ore_Price) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Iron_Ore_Price, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Iron_Ore_Price ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Iron_Ore_Price ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Iron_Ore_Price < (Q1 - 1.5 * IQR) OR Iron_Ore_Price > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Iron_Ore_Price = (Q1 + Q3) / 2  -- Replacing with median
WHERE Iron_Ore_Price < (Q1 - 1.5 * IQR) OR Iron_Ore_Price > (Q3 + 1.5 * IQR);

-- ------------------------------------------------------------------------
WITH Ordered AS (
    SELECT Global_Demand, ROW_NUMBER() OVER (ORDER BY Global_Demand) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Global_Demand, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Global_Demand ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Global_Demand ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Global_Demand < (Q1 - 1.5 * IQR) OR Global_Demand > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Global_Demand = (Q1 + Q3) / 2  -- Replacing with median
WHERE Global_Demand < (Q1 - 1.5 * IQR) OR Global_Demand > (Q3 + 1.5 * IQR);

--   ------------------------------------------------------------------
WITH Ordered AS (
    SELECT Global_Supply, ROW_NUMBER() OVER (ORDER BY Global_Supply) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Global_Supply, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Global_Supply ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Global_Supply ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Global_Supply < (Q1 - 1.5 * IQR) OR Global_Supply > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Global_Supply = (Q1 + Q3) / 2  -- Replacing with median
WHERE Global_Supply < (Q1 - 1.5 * IQR) OR Global_Supply > (Q3 + 1.5 * IQR);

-- ------------------------------------------------------------------------------
WITH Ordered AS (
    SELECT Freight_Rate, ROW_NUMBER() OVER (ORDER BY Freight_Rate) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Freight_Rate, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Freight_Rate ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Freight_Rate ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Freight_Rate < (Q1 - 1.5 * IQR) OR Freight_Rate > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Freight_Rate = (Q1 + Q3) / 2  -- Replacing with median
WHERE Freight_Rate < (Q1 - 1.5 * IQR) OR Freight_Rate > (Q3 + 1.5 * IQR);

--   ------------------------------------------------------------------
WITH Ordered AS (
    SELECT Stockpile, ROW_NUMBER() OVER (ORDER BY Stockpile) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Stockpile, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Stockpile ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Stockpile ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Stockpile < (Q1 - 1.5 * IQR) OR Stockpile > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Stockpile = (Q1 + Q3) / 2  -- Replacing with median
WHERE Stockpile < (Q1 - 1.5 * IQR) OR Stockpile > (Q3 + 1.5 * IQR);

-- ----------------------------------------------------------------
WITH Ordered AS (
    SELECT Production_Volume, ROW_NUMBER() OVER (ORDER BY Production_Volume) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Production_Volume, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Production_Volume ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Production_Volume ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Production_Volume < (Q1 - 1.5 * IQR) OR Production_Volume > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Production_Volume = (Q1 + Q3) / 2  -- Replacing with median
WHERE Production_Volume < (Q1 - 1.5 * IQR) OR Production_Volume > (Q3 + 1.5 * IQR);

##################################
WITH Ordered AS (
    SELECT Production_Cost, ROW_NUMBER() OVER (ORDER BY Production_Cost) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Production_Cost, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Production_Cost ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Production_Cost ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Production_Cost < (Q1 - 1.5 * IQR) OR Production_Cost > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Production_Cost = (Q1 + Q3) / 2  -- Replacing with median
WHERE Production_Cost < (Q1 - 1.5 * IQR) OR Production_Cost > (Q3 + 1.5 * IQR);

###################################
WITH Ordered AS (
    SELECT Exchange_Rate_USD, ROW_NUMBER() OVER (ORDER BY Exchange_Rate_USD) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Exchange_Rate_USD, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Exchange_Rate_USD ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Exchange_Rate_USD ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Exchange_Rate_USD < (Q1 - 1.5 * IQR) OR Exchange_Rate_USD > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Exchange_Rate_USD = (Q1 + Q3) / 2  -- Replacing with median
WHERE Exchange_Rate_USD < (Q1 - 1.5 * IQR) OR Exchange_Rate_USD > (Q3 + 1.5 * IQR);

########################################
WITH Ordered AS (
    SELECT Interest_Rate, ROW_NUMBER() OVER (ORDER BY Interest_Rate) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Interest_Rate, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Interest_Rate ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Interest_Rate ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Interest_Rate < (Q1 - 1.5 * IQR) OR Interest_Rate > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Interest_Rate = (Q1 + Q3) / 2  -- Replacing with median
WHERE Interest_Rate < (Q1 - 1.5 * IQR) OR Interest_Rate > (Q3 + 1.5 * IQR);

################################
WITH Ordered AS (
    SELECT Inflation_Rate, ROW_NUMBER() OVER (ORDER BY Inflation_Rate) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Inflation_Rate, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Inflation_Rate ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Inflation_Rate ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Inflation_Rate < (Q1 - 1.5 * IQR) OR Inflation_Rate > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Inflation_Rate = (Q1 + Q3) / 2  -- Replacing with median
WHERE Inflation_Rate < (Q1 - 1.5 * IQR) OR Inflation_Rate > (Q3 + 1.5 * IQR);

###################
WITH Ordered AS (
    SELECT GDP_Growth_Importer, ROW_NUMBER() OVER (ORDER BY GDP_Growth_Importer) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT GDP_Growth_Importer, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN GDP_Growth_Importer ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN GDP_Growth_Importer ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE GDP_Growth_Importer < (Q1 - 1.5 * IQR) OR GDP_Growth_Importer > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET GDP_Growth_Importer = (Q1 + Q3) / 2  -- Replacing with median
WHERE GDP_Growth_Importer < (Q1 - 1.5 * IQR) OR GDP_Growth_Importer > (Q3 + 1.5 * IQR);

##################
WITH Ordered AS (
    SELECT Tariffs, ROW_NUMBER() OVER (ORDER BY Tariffs) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Tariffs, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Tariffs ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Tariffs ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Tariffs < (Q1 - 1.5 * IQR) OR Tariffs > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Tariffs = (Q1 + Q3) / 2  -- Replacing with median
WHERE Tariffs < (Q1 - 1.5 * IQR) OR Tariffs > (Q3 + 1.5 * IQR);
##############################################
WITH Ordered AS (
    SELECT Steel_Production, ROW_NUMBER() OVER (ORDER BY Steel_Production) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Steel_Production, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Steel_Production ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Steel_Production ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Steel_Production < (Q1 - 1.5 * IQR) OR Steel_Production > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Steel_Production = (Q1 + Q3) / 2  -- Replacing with median
WHERE Steel_Production < (Q1 - 1.5 * IQR) OR Steel_Production > (Q3 + 1.5 * IQR);

##########################
WITH Ordered AS (
    SELECT Carbon_Emissions, ROW_NUMBER() OVER (ORDER BY Carbon_Emissions) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Carbon_Emissions, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Carbon_Emissions ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Carbon_Emissions ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Carbon_Emissions < (Q1 - 1.5 * IQR) OR Carbon_Emissions > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Carbon_Emissions = (Q1 + Q3) / 2  -- Replacing with median
WHERE Carbon_Emissions < (Q1 - 1.5 * IQR) OR Carbon_Emissions > (Q3 + 1.5 * IQR);

###########################
WITH Ordered AS (
    SELECT Aluminum_Price, ROW_NUMBER() OVER (ORDER BY Aluminum_Price) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Aluminum_Price, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Aluminum_Price ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Aluminum_Price ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Aluminum_Price < (Q1 - 1.5 * IQR) OR Aluminum_Price > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Aluminum_Price = (Q1 + Q3) / 2  -- Replacing with median
WHERE Aluminum_Price < (Q1 - 1.5 * IQR) OR Aluminum_Price > (Q3 + 1.5 * IQR);

###################################
WITH Ordered AS (
    SELECT Copper_Price, ROW_NUMBER() OVER (ORDER BY Copper_Price) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Copper_Price, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Copper_Price ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Copper_Price ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Copper_Price < (Q1 - 1.5 * IQR) OR Copper_Price > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Copper_Price = (Q1 + Q3) / 2  -- Replacing with median
WHERE Copper_Price < (Q1 - 1.5 * IQR) OR Copper_Price > (Q3 + 1.5 * IQR);

###########################
WITH Ordered AS (
    SELECT Nickel_Price, ROW_NUMBER() OVER (ORDER BY Nickel_Price) AS row_num, COUNT(*) OVER () AS total_rows
    FROM dataset
),
Quartiles AS (
    SELECT Nickel_Price, total_rows, row_num,
        CASE WHEN row_num = FLOOR(total_rows * 0.25) THEN Nickel_Price ELSE NULL END AS Q1,
        CASE WHEN row_num = FLOOR(total_rows * 0.75) THEN Nickel_Price ELSE NULL END AS Q3
    FROM Ordered
),
Q1_Q3 AS (
    SELECT MAX(Q1) AS Q1, MAX(Q3) AS Q3
    FROM Quartiles
),
IQR_Calculation AS (
    SELECT Q1, Q3, (Q3 - Q1) AS IQR
    FROM Q1_Q3
),
Outliers AS (
    SELECT *
    FROM dataset 
    CROSS JOIN IQR_Calculation
    WHERE Nickel_Price < (Q1 - 1.5 * IQR) OR Nickel_Price > (Q3 + 1.5 * IQR)
)
UPDATE dataset
CROSS JOIN IQR_Calculation
SET Nickel_Price = (Q1 + Q3) / 2  -- Replacing with median
WHERE Nickel_Price < (Q1 - 1.5 * IQR) OR Nickel_Price > (Q3 + 1.5 * IQR);

# 						PERFORMING EXPLORATORY DATA ANALYSIS AFTER CLEANING
##########################################################################################################
# 				ALL FOUR BUSINESS MOMENTS
#################################################################################### 
-- Created Stored Procedure for Mean , Mode, Standard deviation, Variance, Skewness, Kurtosis

delimiter //

create procedure stats_query(in column_name varchar(255))
begin
    set @sql = concat(
        'select
            ''', column_name, ''' as column_name,
            avg(', column_name, ') as mean,
            (
                select ', column_name, '
                from dataset
                group by ', column_name, '
                order by count(*) desc, ', column_name, ' asc
                limit 1
            ) as mode,
            stddev(', column_name, ') as stddev,
            variance(', column_name, ') as variance,
            max(', column_name, ') - min(', column_name, ') as range_value,
            (sum(pow(', column_name, ' - (select avg(', column_name, ') from dataset), 3)) / count(*)) / pow(stddev(', column_name, '), 3) as skewness,
            (sum(pow(', column_name, ' - (select avg(', column_name, ') from dataset), 4)) / count(*)) / pow(variance(', column_name, '), 2) as kurtosis
        from dataset'
    );

    prepare stmt from @sql;
    execute stmt;
    deallocate prepare stmt;
end//

delimiter ;

-- Created Stored Procedure for Median 

DELIMITER //

create procedure med_query(in column_name varchar(255))
begin
    set @sql = concat(
        'select
            avg(subquery.', column_name, ') as median
        from (
            select
                ', column_name, ',
                row_number() over (order by ', column_name, ') as rn,
                count(*) over () as cnt
            from dataset
        ) as subquery
        where
            rn IN ((cnt + 1) / 2, (cnt + 2) / 2)'
    );

    prepare stmt from @sql;
    execute stmt;
    deallocate prepare stmt;
end //

DELIMITER ;
-- --------------------------------------------------------------------------------------------------------

############################ Normalization ###########################################################

/*Normalization Calculation: Each query retrieves the normalized value for the specified column 
by applying the Min-Max normalization formula. It subtracts the minimum value from each data point, 
then divides by the range (maximum - minimum).

Selecting Data: You can run each query separately or 
combine them to retrieve normalized values for multiple columns in a single result set.*/


SELECT 
    (`Iron_Ore_Price` - (SELECT MIN(`Iron_Ore_Price`) FROM dataset)) / 
    ((SELECT MAX(`Iron_Ore_Price`) FROM dataset) - (SELECT MIN(`Iron_Ore_Price`) FROM dataset)) AS Normalized_Iron_Ore_Price,
    
    (`Global_Demand` - (SELECT MIN(`Global_Demand`) FROM dataset)) / 
    ((SELECT MAX(`Global_Demand`) FROM dataset) - (SELECT MIN(`Global_Demand`) FROM dataset)) AS Normalized_Global_Demand,
    
    (`Global_Supply` - (SELECT MIN(`Global_Supply`) FROM dataset)) / 
    ((SELECT MAX(`Global_Supply`) FROM dataset) - (SELECT MIN(`Global_Supply`) FROM dataset)) AS Normalized_Global_Supply,
    
    (`Freight_Rate` - (SELECT MIN(`Freight_Rate`) FROM dataset)) / 
    ((SELECT MAX(`Freight_Rate`) FROM dataset) - (SELECT MIN(`Freight_Rate`) FROM dataset)) AS Normalized_Freight_Rate,
    
    (`Stockpile` - (SELECT MIN(`Stockpile`) FROM dataset)) / 
    ((SELECT MAX(`Stockpile`) FROM dataset) - (SELECT MIN(`Stockpile`) FROM dataset)) AS Normalized_Stockpile,
    
    (`Production_Volume` - (SELECT MIN(`Production_Volume`) FROM dataset)) / 
    ((SELECT MAX(`Production_Volume`) FROM dataset) - (SELECT MIN(`Production_Volume`) FROM dataset)) AS Normalized_Production_Volume,
    
    (`Production_Cost` - (SELECT MIN(`Production_Cost`) FROM dataset)) / 
    ((SELECT MAX(`Production_Cost`) FROM dataset) - (SELECT MIN(`Production_Cost`) FROM dataset)) AS Normalized_Production_Cost,
    
    (`Exchange_Rate_USD` - (SELECT MIN(`Exchange_Rate_USD`) FROM dataset)) / 
    ((SELECT MAX(`Exchange_Rate_USD`) FROM dataset) - (SELECT MIN(`Exchange_Rate_USD`) FROM dataset)) AS Normalized_Exchange_Rate_USD,
    
    (`Interest_Rate` - (SELECT MIN(`Interest_Rate`) FROM dataset)) / 
    ((SELECT MAX(`Interest_Rate`) FROM dataset) - (SELECT MIN(`Interest_Rate`) FROM dataset)) AS Normalized_Interest_Rate,
    
    (`Inflation_Rate` - (SELECT MIN(`Inflation_Rate`) FROM dataset)) / 
    ((SELECT MAX(`Inflation_Rate`) FROM dataset) - (SELECT MIN(`Inflation_Rate`) FROM dataset)) AS Normalized_Inflation_Rate,
    
    (`GDP_Growth_Importer` - (SELECT MIN(`GDP_Growth_Importer`) FROM dataset)) / 
    ((SELECT MAX(`GDP_Growth_Importer`) FROM dataset) - (SELECT MIN(`GDP_Growth_Importer`) FROM dataset)) AS Normalized_GDP_Growth_Importer,
    
    (`Tariffs` - (SELECT MIN(`Tariffs`) FROM dataset)) / 
    ((SELECT MAX(`Tariffs`) FROM dataset) - (SELECT MIN(`Tariffs`) FROM dataset)) AS Normalized_Tariffs,
    
    (`Steel_Production` - (SELECT MIN(`Steel_Production`) FROM dataset)) / 
    ((SELECT MAX(`Steel_Production`) FROM dataset) - (SELECT MIN(`Steel_Production`) FROM dataset)) AS Normalized_Steel_Production,
    
    (`Carbon_Emissions` - (SELECT MIN(`Carbon_Emissions`) FROM dataset)) / 
    ((SELECT MAX(`Carbon_Emissions`) FROM dataset) - (SELECT MIN(`Carbon_Emissions`) FROM dataset)) AS Normalized_Carbon_Emissions,
    
    (`Aluminum_Price` - (SELECT MIN(`Aluminum_Price`) FROM dataset)) / 
    ((SELECT MAX(`Aluminum_Price`) FROM dataset) - (SELECT MIN(`Aluminum_Price`) FROM dataset)) AS Normalized_Aluminum_Price,
    
    (`Copper_Price` - (SELECT MIN(`Copper_Price`) FROM dataset)) / 
    ((SELECT MAX(`Copper_Price`) FROM dataset) - (SELECT MIN(`Copper_Price`) FROM dataset)) AS Normalized_Copper_Price,
    
    (`Nickel_Price` - (SELECT MIN(`Nickel_Price`) FROM dataset)) / 
    ((SELECT MAX(`Nickel_Price`) FROM dataset) - (SELECT MIN(`Nickel_Price`) FROM dataset)) AS Normalized_Nickel_Price
FROM dataset;

