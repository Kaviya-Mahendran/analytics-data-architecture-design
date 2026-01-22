-- Dimension: Date
-- Purpose: Centralised time intelligence for analytics

CREATE TABLE dim_date (
    date_key        INT PRIMARY KEY,
    full_date       DATE NOT NULL,
    year            INT,
    quarter         INT,
    month           INT,
    day             INT,
    week_of_year    INT,
    is_weekend      BOOLEAN
);