# Data Lineage Example

Source systems feed the Raw Layer without transformation.

Raw → Cleaned:
- Type casting
- Null handling
- Standardised naming

Cleaned → Analytics-ready:
- Surrogate keys assigned
- Fact and dimension tables created
- Business logic applied once

Consumption:
- BI dashboards
- Ad-hoc SQL
- Predictive modelling