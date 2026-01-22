-- Dimension: Acquisition / Interaction Channel

CREATE TABLE dim_channel (
    channel_key     INT PRIMARY KEY,
    channel_name    VARCHAR(50) NOT NULL,
    channel_group   VARCHAR(50)
);