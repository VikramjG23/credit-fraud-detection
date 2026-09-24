/* =========================================================
   1. FRAUD TRANSACTION PERCENTAGE
   ========================================================= */
WITH fraud_summary AS (
    SELECT 
        SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
        COUNT(*) AS total_transactions
    FROM creditcard
)
SELECT 
    (fraud_transactions * 100.0) / total_transactions AS fraud_percentage
FROM fraud_summary;


/* =========================================================
   2. TRANSACTION STATISTICS BY CLASS (FRAUD VS NON-FRAUD)
   ========================================================= */
SELECT 
    class,
    AVG(amount) AS avg_amount,
    MAX(amount) AS max_transaction,
    COUNT(*) AS total_transactions
FROM creditcard
GROUP BY class;


/* =========================================================
   3. TRANSACTION DISTRIBUTION BY AMOUNT RANGE
   ========================================================= */
SELECT 
    CASE 
        WHEN amount < 100 THEN 'Under 100'
        WHEN amount >= 100 AND amount < 500 THEN '100 - 499'
        WHEN amount >= 500 AND amount < 1000 THEN '500 - 999'
        ELSE '1000+'
    END AS amount_range,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions
FROM creditcard
GROUP BY amount_range
ORDER BY total_transactions DESC;


/* =========================================================
   4. TRANSACTION DISTRIBUTION BY TIME (HOURLY BUCKETS)
   ========================================================= */
SELECT 
    CASE 
        WHEN time/3600 < 6 THEN '00:00 - 05:59'
        WHEN time/3600 >= 6 AND time/3600 < 12 THEN '06:00 - 11:59'
        WHEN time/3600 >= 12 AND time/3600 < 18 THEN '12:00 - 17:59'
        WHEN time/3600 >= 18 AND time/3600 < 24 THEN '18:00 - 23:59'
        ELSE '24+ Hours'
    END AS time_bucket,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions
FROM creditcard
GROUP BY time_bucket;


/* =========================================================
   5. FRAUD RATE BY TIME BUCKETS
   ========================================================= */
WITH time_analysis AS (
    SELECT 
        CASE 
            WHEN time/3600 < 6 THEN '00:00 - 05:59'
            WHEN time/3600 >= 6 AND time/3600 < 12 THEN '06:00 - 11:59'
            WHEN time/3600 >= 12 AND time/3600 < 18 THEN '12:00 - 17:59'
            WHEN time/3600 >= 18 AND time/3600 < 24 THEN '18:00 - 23:59'
            ELSE '24+ Hours'
        END AS time_bucket,
        COUNT(*) AS total_transactions,
        SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions
    FROM creditcard
    GROUP BY time_bucket
)
SELECT 
    *,
    (fraud_transactions * 100.0) / total_transactions AS fraud_rate
FROM time_analysis;


/* =========================================================
   6. FRAUD RATE BY TRANSACTION AMOUNT CATEGORY
   ========================================================= */
WITH transaction_amount_category AS (
    SELECT 
        CASE 
            WHEN amount < 1000 THEN 'Below 1000'
            ELSE '1000 and Above'
        END AS transaction_category,
        COUNT(*) AS total_transactions,
        SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions
    FROM creditcard
    GROUP BY transaction_category
)
SELECT 
    *,
    (fraud_transactions * 100.0) / total_transactions AS fraud_rate
FROM transaction_amount_category;