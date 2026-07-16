# DOMAIN MODEL

Версия: 0.1

Документ определяет предметную модель Региональной платформы пространственной аналитики рынка недвижимости.

---

# Общая схема

                     ┌────────────────────────────┐
                     │     Assessment Cycle       │
                     └──────────────┬─────────────┘
                                    │
                                    │
                    ┌───────────────▼───────────────┐
                    │       Valuation Object        │
                    └───────────────┬───────────────┘
                                    │
         ┌──────────────┬────────────┼──────────────┬──────────────┐
         │              │            │              │              │
         ▼              ▼            ▼              ▼              ▼
   Land Parcel      Building     Premise       Address      Geometry
         │
         │
         ▼
 Ownership / Rights

─────────────────────────────────────────────────────────────────────

                        MARKET DOMAIN

               Observation
                     │
        ┌────────────┼──────────────┐
        ▼            ▼              ▼
      Deal        Offer         Rent

                     │
                     ▼

              Comparable Set

                     │
                     ▼

             Market Adjustment

─────────────────────────────────────────────────────────────────────

                     SPATIAL DOMAIN

 Municipality

 Settlement

 Cadastral Quarter

 Valuation Zone

 Territorial Zone

 Road Network

 Infrastructure

 Natural Objects

─────────────────────────────────────────────────────────────────────

                     ANALYTICS DOMAIN

 Factor

 Factor Value

 Feature Factory

 Model

 Model Version

 Model Result

─────────────────────────────────────────────────────────────────────

                    QUALITY DOMAIN

 Quality Check

 Outlier

 Review

 Validation Rule

─────────────────────────────────────────────────────────────────────

                    SYSTEM DOMAIN

 Dataset

 ETL Run

 User

 Role

 Event

 Audit

 Attachment
