-- Dimension: Customer
-- Purpose: Store stable, descriptive customer attributes
-- Grain: One row per customer (slowly changing)

CREATE TABLE dim_customers (
    customer_key        INT PRIMARY KEY,
    customer_id         VARCHAR(50) NOT NULL,
    signup_channel      VARCHAR(20),
    age_band            VARCHAR(20),
    region_code         VARCHAR(10),
    is_active           BOOLEAN,
    effective_start_dt  DATE,
    effective_end_dt    DATE
);