-- Analytics View: Customer Lifetime Value (simplified)

CREATE VIEW vw_customer_value AS
SELECT
    c.customer_id,
    SUM(f.transaction_value) AS lifetime_value,
    COUNT(*) AS transaction_frequency
FROM fact_transactions f
JOIN dim_customer c
    ON f.customer_key = c.customer_key
GROUP BY c.customer_id;
