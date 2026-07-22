# Customer Churn Analysis & Retention Dashboard

![Customer Churn Dashboard](customer_churn_dashboard.png)

## Project Overview

This project analyses customer churn within a telecommunications dataset to identify the key factors influencing customer retention and quantify the financial impact of customer attrition.

The project follows an end-to-end analytics workflow, combining **SQL, Python, machine learning, and Tableau** to transform raw customer data into actionable business insights.

The final interactive dashboard helps identify high-risk customer groups, understand churn drivers, and highlight areas where retention strategies could have the greatest impact.

---

# Business Problem

Customer churn directly impacts recurring revenue and long-term customer value. The objective of this project was to answer:

* What percentage of customers are leaving?
* Which customer characteristics are associated with higher churn?
* Which services, contracts, and payment methods have the highest churn rates?
* Which customers should be prioritised for retention efforts?
* What financial impact is associated with customer churn?

---

# Dataset

The analysis uses a telecommunications customer dataset containing:

* 7,043 customer records
* Customer demographics
* Contract information
* Service subscriptions
* Payment methods
* Monthly charges
* Customer tenure
* Churn status

After data cleaning and preparation, 7,032 valid customer records were analysed.

---

# Tools & Technologies

## SQL

Used for:

* Initial data exploration
* Data validation
* Customer churn analysis
* Aggregating business metrics

## Python

Libraries:

* Pandas
* NumPy
* Matplotlib
* Scikit-learn

Used for:

* Data cleaning
* Exploratory data analysis
* Feature engineering
* Customer risk segmentation
* Logistic Regression churn modelling

## Tableau

Used for:

* Interactive dashboard development
* KPI creation
* Data visualisation
* Business storytelling

---

# Project Workflow

## 1. Data Exploration & SQL Analysis

Initial analysis was performed using SQL to understand:

* Overall churn levels
* Churn by contract type
* Churn by tenure
* Churn by internet service
* Churn by payment method
* Revenue impact from churned customers

Key metrics identified:

* Total customers: 7,032
* Customers churned: 1,869
* Overall churn rate: 26.58%

---

## 2. Data Cleaning & Feature Engineering

Python was used to prepare the dataset for analysis.

Steps included:

* Converting data types
* Handling missing values
* Creating churn flags
* Calculating customer lifetime value estimates
* Creating customer tenure groups
* Creating customer risk segments

Risk segmentation was created to classify customers into:

* High Risk
* Medium Risk
* Low Risk

based on churn-related characteristics.

---

## 3. Churn Prediction Model

A Logistic Regression classification model was developed to predict customer churn.

Model performance:

* Accuracy: 80.3%
* Precision (Churn): 65%
* Recall (Churn): 57%

The model identified several important churn indicators, including:

* Fiber optic internet service
* Electronic check payment method
* Paperless billing
* Multiple line subscriptions
* Senior customer status

---

# Key Insights

## Contract Type Drives Churn

Customers with month-to-month contracts showed significantly higher churn:

| Contract       | Churn Rate |
| -------------- | ---------: |
| Month-to-month |      42.7% |
| One year       |      11.3% |
| Two year       |       2.9% |

Longer-term contracts appear strongly associated with customer retention.

---

## Early Customers Are Highest Risk

Customers within their first year showed the highest churn:

| Tenure Group | Churn Rate |
| ------------ | ---------: |
| 0-12 Months  |      47.7% |
| 13-24 Months |      28.7% |
| 25-48 Months |      20.4% |
| 49+ Months   |       9.5% |

This suggests improving onboarding and early customer engagement could reduce churn.

---

## Service Type Impacts Retention

Internet service analysis showed:

| Service     | Churn Rate |
| ----------- | ---------: |
| Fiber optic |      41.9% |
| DSL         |      19.0% |
| No internet |       7.4% |

Fiber optic customers represent a key area for further investigation.

---

## High-Risk Customer Segments

Risk segmentation identified:

| Segment     | Customers | Churn Rate |
| ----------- | --------: | ---------: |
| High Risk   |       979 |      67.5% |
| Medium Risk |     1,752 |      36.6% |
| Low Risk    |     4,301 |      13.2% |

High-risk customers provide a clear opportunity for targeted retention campaigns.

---

# Dashboard Features

The Tableau dashboard includes:

* Executive KPI summary
* Customer churn rate tracking
* Revenue impact analysis
* Contract churn analysis
* Tenure-based churn analysis
* Service-related churn analysis
* Payment behaviour analysis
* Customer risk segmentation
* Interactive filters

---

# Business Recommendations

Based on the analysis:

1. Target month-to-month customers with retention incentives.
2. Improve onboarding and engagement during the first customer year.
3. Investigate service satisfaction among Fiber optic customers.
4. Prioritise High Risk customers for proactive retention campaigns.
5. Monitor payment behaviour as an early churn indicator.

---

# Repository Structure

```
Customer-Churn-Analysis/
│
├── README.md
│
├── Python/
│   └── customer_churn_analysis.ipynb
│
├── SQL/
│   └── churn_analysis.sql
│
├── Tableau/
│   └── Customer_Churn_Dashboar.twbx
│
└── Data/
    ├── customer_churn_clean.csv
    └── churn_feature_importance.csv
    └── telco_customer_churn.csv
```

---

# Skills Demonstrated

* SQL querying and data analysis
* Data cleaning and transformation
* Exploratory data analysis
* Feature engineering
* Machine learning classification
* Business intelligence reporting
* Tableau dashboard development
* Data storytelling

---

# Author

Ben McDonald

Software Engineering Graduate | Aspiring Data Analyst

Tools: SQL | Python | Tableau | Excel

```
```
