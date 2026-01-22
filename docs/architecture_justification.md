# Architecture Justification

This architecture is designed to support analytics as a long-term system.

Key decisions:
- Star schema chosen to minimise metric drift and simplify consumption
- Layered storage enables reprocessing and auditability
- Explicit metadata reduces reliance on tribal knowledge

Trade-offs:
- More upfront modelling effort
- Slower initial delivery

Benefits:
- Scalable analytics
- Consistent metrics
- Easier transition to advanced analytics and ML