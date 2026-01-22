# Analytics Data Catalog

This document describes key analytics tables and their governance context.

## Table: fact_transactions

| Field | Description | Owner | Refresh | Sensitivity |
|-----|------------|-------|--------|-------------|
| transaction_key | Surrogate transaction ID | Analytics | Daily | Low |
| customer_key | Link to customer dimension | Analytics | Daily | Low |
| transaction_value | Monetary value | Analytics | Daily | Medium |

## Table: dim_customer

| Field | Description | Owner | Sensitivity |
|-----|------------|-------|-------------|
| customer_id | Source system identifier | Analytics | Medium |
| age_band | Binned age attribute | Analytics | Low |
| region_code | Geographic grouping | Analytics | Medium |