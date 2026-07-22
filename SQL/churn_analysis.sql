CREATE DATABASE customer_churn;

use customer_churn;

CREATE TABLE customers (
    customerID VARCHAR(50),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(10)
);

SELECT *
FROM customers
LIMIT 10;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT 
    Churn,
    COUNT(*) AS customers
FROM customers
GROUP BY Churn;

-- Missing data check
SELECT
    COUNT(*) AS total_rows,
    COUNT(customerID) AS customerID_count,
    COUNT(TotalCharges) AS total_charges_count
FROM customers;

-- Checking for duplicate customers
SELECT 
    customerID,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customerID
HAVING COUNT(*) > 1;

-- Checking data types
SELECT DISTINCT Contract
FROM customers;

SELECT DISTINCT InternetService
FROM customers;

SELECT DISTINCT PaymentMethod
FROM customers;

-- Analytical Clean Table
CREATE TABLE clean_customers AS
SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM customers;

SHOW TABLES;

-- Analyst-Friendly Metrics
ALTER TABLE clean_customers
ADD churn_flag INT;

UPDATE clean_customers
SET churn_flag =
CASE
    WHEN Churn = 'Yes' THEN 1
    ELSE 0
END;

-- Customer Lifetime Value
ALTER TABLE clean_customers
ADD customer_lifetime_value DECIMAL(10,2);

UPDATE clean_customers
SET customer_lifetime_value =
MonthlyCharges * tenure;

-- Validating New Columns
SELECT
    customerID,
    MonthlyCharges,
    tenure,
    customer_lifetime_value,
    Churn,
    churn_flag
FROM clean_customers
LIMIT 10;

-- Exploratory SQL Analysis

-- Overall Churn Rate
SELECT
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND((SUM(churn_flag) / COUNT(*)) * 100, 2) AS churn_rate_percentage
FROM clean_customers;

-- Does contract type affect churn?
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND((SUM(churn_flag) / COUNT(*)) * 100, 2) AS churn_rate
FROM clean_customers
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Does customer tenure influence churn?
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS customers,
    ROUND(AVG(churn_flag) * 100,2) AS churn_rate
FROM clean_customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- Which internet services have the highest churn?
SELECT
    InternetService,
    COUNT(*) AS customers,
    ROUND(AVG(churn_flag) * 100,2) AS churn_rate
FROM clean_customers
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- Are high-value customers leaving?
SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(AVG(customer_lifetime_value),2) AS average_lifetime_value
FROM clean_customers
GROUP BY Churn;

-- Revenue Impact
SELECT
    SUM(MonthlyCharges) AS monthly_revenue_lost,
    SUM(customer_lifetime_value) AS lifetime_value_lost
FROM clean_customers
WHERE Churn = 'Yes';

SELECT
    InternetService,
    Contract,
    COUNT(*) AS customers,
    ROUND(AVG(churn_flag)*100,2) AS churn_rate
FROM clean_customers
GROUP BY InternetService, Contract
ORDER BY churn_rate DESC;
