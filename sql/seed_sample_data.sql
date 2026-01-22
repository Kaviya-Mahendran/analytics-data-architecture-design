-- Seed data for schema validation and demonstration purposes only

INSERT INTO dim_customer VALUES
(1, 'C001', 'Web', '25-34', 'NW', 1, '2024-01-01', NULL),
(2, 'C002', 'App', '35-44', 'SE', 1, '2024-02-01', NULL),
(3, 'C003', 'Phone', '45-54', 'SW', 0, '2023-10-01', '2024-12-31');

INSERT INTO dim_date VALUES
(20240101, '2024-01-01', 2024, 1, 1, 1, 3, 0),
(20240201, '2024-02-01', 2024, 1, 2, 5, 2, 0),
(20240301, '2024-03-01', 2024, 1, 3, 9, 1, 0);

INSERT INTO dim_channel VALUES
(1, 'Web', 'Digital'),
(2, 'App', 'Digital'),
(3, 'Phone', 'Offline');

INSERT INTO fact_transactions VALUES
(1001, 1, 20240101, 1, 2, 120.00),
(1002, 1, 20240201, 2, 1, 60.00),
(1003, 2, 20240301, 2, 3, 210.00),
(1004, 3, 20240101, 3, 1, 40.00);
