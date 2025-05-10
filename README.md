# Telco-Churn-analysis

# Telco Churn Analysis

## Introduction

The objective of this analysis is to identify key patterns and insights related to customer churn at a telecommunications company. By analyzing churn rates across service types, contract types, payment methods, demographic segments, and usage patterns, we aim to pinpoint areas of concern and recommend strategies for customer retention.

## Dataset

The dataset includes customer information such as service type, contract type, payment method, demographic information, and usage patterns. Key columns include:

* **CustomerID:** Unique identifier for each customer.
* **Service Type:** Types of services subscribed to, such as Phone and Internet.
* **Contract Type:** Month-to-month, One Year, or Two Year contracts.
* **Payment Method:** Electronic check, credit card, bank transfer, etc.
* **Senior Citizen:** Indicates whether the customer is a senior citizen.
* **Usage Patterns:** Metrics such as internet usage, streaming hours, and call minutes.
* **Churn:** Binary indicator of whether a customer has churned.

## Data Preprocessing

* Removed missing values and handled outliers.
* Transformed categorical data using encoding techniques.
* Scaled numerical features to standardize the dataset.

## Analysis and Findings

### 1. Churn Analysis by Service and Contract Type

* Customers with month-to-month contracts exhibit a significantly higher churn rate compared to those on longer-term contracts.
* Fiber optic internet service customers show a higher likelihood of churning, likely due to higher costs or service dissatisfaction.
* Customers without a phone service tend to have lower churn rates, suggesting a stronger retention factor for bundled services.

**Visualization:** A bar chart showing churn rates segmented by contract type and service type.

### 2. Churn by Payment Method

* Customers who pay using electronic checks exhibit the highest churn rates, indicating potential dissatisfaction with the payment method or financial instability.
* Customers using credit cards or bank transfers demonstrate comparatively lower churn rates.

**Visualization:** A horizontal bar chart illustrating churn rates by payment method.

### 3. Demographic Analysis (Gender and Senior Citizen)

* Senior citizens are more likely to churn than non-senior customers, possibly due to changing service needs or financial constraints.
* There is no significant gender-based difference in churn rates, indicating that other factors, such as contract type and payment method, may play a larger role in customer retention.

**Visualization:** A stacked bar chart showing churn rates segmented by gender and senior citizen status.

### 4. Usage Analysis

* Heavy internet users with high streaming hours are more likely to churn, especially if they also make frequent tech support calls.
* Customers with low internet usage but frequent calls also exhibit higher churn rates, suggesting possible service dissatisfaction or technical issues.

**Visualization:** A scatter plot showing usage metrics segmented by churn status.

## Conclusion

The analysis reveals that contract type, payment method, and service type are significant drivers of churn. Usage patterns further highlight potential service quality or pricing issues. To reduce churn, the company should consider targeted retention strategies for month-to-month contract holders, electronic check users, and heavy internet/streaming users. Additionally, enhancing customer support for senior citizens could mitigate churn rates in this demographic.

## Technologies Used

* SQL for data querying and analysis
* Word for report generation
* Tableau for data visualization
* GitHub for version control
