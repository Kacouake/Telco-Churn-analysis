-- import customer data form telco

-- clean table
SELECT * FROM telco_customer_churn;

-- clean ToltalCharges
SELECT DISTINCT TotalCharges 
FROM telco_customer_churn
WHERE TotalCharges IS NULL
;

UPDATE telco_customer_churn
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

ALTER TABLE telco_customer_churn
MODIFY TotalCharges DECIMAL(10,2); 

SELECT DISTINCT SeniorCitizen FROM telco_customer_churn;

-- change SeniorCitizen value to VARCHAR
ALTER TABLE telco_customer_churn
MODIFY SeniorCitizen VARCHAR(3);

UPDATE telco_customer_churn
SET SeniorCitizen = CASE 
    WHEN SeniorCitizen = 1 THEN 'Yes'
    WHEN SeniorCitizen = 0 THEN 'No'
    ELSE SeniorCitizen
END;

-- 					CHURN PATTERNS

-- Churn rate by ServiceType
SELECT
    PhoneService,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) / COUNT(*) * 100 AS churn_rate
FROM
    telco_customer_churn
GROUP BY
    PhoneService;

-- Churn rate by Contract Type
SELECT
    Contract,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) / COUNT(*) * 100 AS churn_rate
FROM
    telco_customer_churn
GROUP BY
    Contract;
    
-- Churn rate by payment meethod
SELECT
    PaymentMethod,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) / COUNT(*) * 100 AS churn_rate
FROM
    telco_customer_churn
GROUP BY
    PaymentMethod;
    
-- AGGREGATION ANALYSIS
	-- Overall ChurnRate
SELECT 
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) / COUNT(*) * 100 AS overall_churn_rate
FROM
    telco_customer_churn;
    
-- Churn by gender
SELECT
    Gender,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) / COUNT(*) * 100 AS churn_rate
FROM
    telco_customer_churn
GROUP BY
    Gender;

-- simulating usage metrics for customers
ALTER TABLE telco_customer_churn
ADD COLUMN InternetUsage_GB INT,
ADD COLUMN StreamingHours INT,
ADD COLUMN TechSupportCalls INT,
ADD COLUMN CallMinutes INT;

UPDATE telco_customer_churn
SET 
    InternetUsage_GB = CASE 
        WHEN InternetService != 'No' THEN FLOOR(5 + RAND() * 96)  -- 5 to 100 GB
        ELSE 0
    END,
    StreamingHours = CASE 
        WHEN StreamingTV = 'Yes' THEN FLOOR(5 + RAND() * 46)     -- 5 to 50 hours
        ELSE 0
    END,
    TechSupportCalls = CASE 
        WHEN TechSupport = 'Yes' THEN FLOOR(1 + RAND() * 10)     -- 1 to 10 calls
        ELSE 0
    END,
    CallMinutes = CASE 
        WHEN PhoneService = 'Yes' THEN FLOOR(100 + RAND() * 900) -- 100 to 1000 mins
        ELSE 0
    END;

-- check update....  yes it worked
SELECT * FROM telco_customer_churn;

-- Churn rate by Usage
SELECT 
    CASE 
        WHEN InternetUsage_GB < 20 THEN 'Low Usage'
        WHEN InternetUsage_GB BETWEEN 20 AND 60 THEN 'Medium Usage'
        WHEN InternetUsage_GB > 60 THEN 'High Usage'
    END AS UsageLevel,
    AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnRate
FROM 
    telco_customer_churn
GROUP BY 
    UsageLevel;

-- Correlation Between Streaming Hours and Churn
SELECT 
    AVG(StreamingHours) AS AvgStreamingHours,
    AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnRate
FROM 
    telco_customer_churn
GROUP BY 
    Churn;
    
-- Customer Segmentation Based on Usage
SELECT 
    CustomerID, 
    CASE 
        WHEN StreamingHours > 20 THEN 'Heavy Streamer'
        WHEN StreamingHours BETWEEN 5 AND 20 THEN 'Moderate Streamer'
        ELSE 'Light Streamer'
    END AS StreamingSegment,
    CASE 
        WHEN TechSupportCalls > 5 THEN 'Frequent Support User'
        ELSE 'Infrequent Support User'
    END AS SupportSegment,
    Churn
FROM 
    telco_customer_churn;


-- Add SQL queries for Telco Churn Analysis
