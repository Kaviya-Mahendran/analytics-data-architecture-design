-- Fact: Transactions
-- Grain: One row per customer transaction per day

CREATE TABLE fact_transactions (
    transaction_key     INT PRIMARY KEY,
    customer_key        INT NOT NULL,
    date_key            INT NOT NULL,
    channel_key         INT,
    transaction_count   INT,
    transaction_value   DECIMAL(12,2),

    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (channel_key) REFERENCES dim_channel(channel_key)
);