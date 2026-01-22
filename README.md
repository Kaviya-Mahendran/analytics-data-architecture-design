Designing Analytics Data Architecture as a Long Term System
Overview

As analytics capabilities mature, many organisations encounter structural problems that are not caused by tooling, but by design decisions made early on. These include inconsistent metrics, unclear data ownership, fragile dashboards, and architectures that cannot support growth into advanced analytics or machine learning.

This repository presents a reference analytics data architecture focused on long term reliability, clarity, and scalability. Rather than demonstrating a specific implementation, the project explains how and why analytics architectures should be designed to support reporting, exploration, and predictive use cases over time.

Although implementations vary across organisations, these principles apply broadly to most data analytics environments.

Architecture at a Glance

This architecture is built around three core ideas:

Layered data storage to separate raw data from analytics ready datasets

Explicit data modelling using a star schema

Documented metadata and ownership to support trust and governance

Together, these components allow analytics to function as a product, not a collection of dashboards.

Layered Data Architecture

The architecture follows a clear, layered structure:

1. Raw Layer

Stores immutable extracts from source systems

Preserves original values for audit and reprocessing

No transformations or business logic applied

2. Cleaned Layer

Standardised column names and data types

Missing values handled explicitly

Basic validation rules enforced

3. Analytics Ready Layer

Business logic applied once and reused

Fact and dimension tables created

Metrics become consistent across reports

4. Consumption Layer

BI dashboards

SQL analytics

Machine learning pipelines

This separation reduces downstream risk and allows teams to evolve analytics without corrupting source data.

Star Schema Design (Analytics Layer)

At the analytics ready layer, data is modelled using a star schema.

Core Tables

Fact Table

fact_transactions

One row per transaction (clearly defined grain)

Stores numeric measures such as transaction count and value

Dimension Tables

dim_customer

dim_date

dim_channel

Why a Star Schema?

Ensures metric definitions are consistent

Improves query performance for BI tools

Simplifies joins for analysts

Reduces duplication of business logic

This modelling approach makes analytics easier to scale as datasets grow.

SQL Schema (Example)

Below is a simplified example of how the analytics schema is defined.

Dimension Table
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY,
    customer_id VARCHAR(50),
    signup_channel VARCHAR(20),
    age_band VARCHAR(20),
    is_active BOOLEAN
);

Fact Table
CREATE TABLE fact_transactions (
    transaction_key INT PRIMARY KEY,
    customer_key INT,
    date_key INT,
    channel_key INT,
    transaction_count INT,
    transaction_value DECIMAL(10,2),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key)
);


Using surrogate keys decouples analytics from upstream system changes and supports slowly changing attributes.

Metadata & Data Catalog

Analytics systems often fail not because data is wrong, but because people do not trust or understand it.

This architecture includes a simple metadata layer documenting:

Column definitions

Data owners

Refresh cadence

Sensitivity classification

Example Metadata Entry
Field	Description	Owner	Sensitivity
customer_key	Surrogate customer identifier	Analytics	Low
transaction_value	Monetary value per transaction	Analytics	Medium

Documented metadata improves onboarding, reduces dependency on tribal knowledge, and supports responsible data usage.

Architecture Justification

This design intentionally prioritises clarity and reproducibility over short term speed.

Key trade offs considered:

Star schema over wide tables to reduce metric drift

Layered storage over single datasets to enable reprocessing

Explicit modelling over ad hoc transformations to improve trust

While this approach introduces additional design effort upfront, it significantly reduces rework as analytics use cases grow and become more complex.

Validation & Visual Outputs

The SQL schemas were executed and validated locally using SQLite. Visual verification includes schema inspection, foreign key validation, and sample analytical queries. Architecture and data flow diagrams illustrate how the system supports scalable analytics.

Reflection

Treating analytics as a long term system changes how data teams operate. Clear data models, layered architectures, and documented metadata create a foundation that supports growth, governance, and advanced analytics without constant rework.

Although implementations vary across organisations, these principles apply broadly to most data analytics environments.

All SQL schemas were executed sequentially in SQLite to validate dependencies and referential integrity.