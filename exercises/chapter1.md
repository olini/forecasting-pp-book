# 1. Exercises
## 1. For cases 3 and 4 in Section 1.5, list the possible predictor variables that might be useful, assuming that the relevant data are available.

Case 3:
* Economic indicators related to consumption and growth;
* Population age;
* Fuel prices.

Case 4:
* Indicators of school holidays and major events;
* Economic indicators related to consumption and growth;
* Tourism advertising.

## 2. For case 3 in Section 1.5, describe the five steps of forecasting in the context of this project.

* Step 1. Problem definition
Talk to the responsibles of the company about the general objective of this project. After this, talk to the people who will use the forecasting predictions in their jobs to see the correct and best way to deliver. Also, talk to people responsible for gathering and storing all the data to discuss data format and access.

* Step 2. Gathering information
After the discussion with the team responsible for storing and organizing the data, develop data pipeline to automatically fetch this data in the necessary format. Also, try to gather outside information on possible predictor variables that might be useful for the forecasting model.

* Step 3. Preliminary (exploratory) analysis
With all the data in hands, it is time to explore it trying to find patterns, outliers, trends, seasonality and every other important aspect of the business problem reflected on the data. It is also a good time to check data quality and assure it is in a good state to be used in the forecasting model. All the assumptions and hypotheses taken from this phase should be validated with those with expert knowledge.

* Step 4. Choosing and fitting models
Now it is time to test some different models and see which fits better our problem. We tend to have a baseline model, which is a very simple one, to serve as a starting point and from it we test other models looking for better results.

* Step 5. Using and evaluating a forecasting model
After choosing the best model, it is time to evaluate in on production. First, it is important to define how this model will be put in production, in which frequency it will make predictions, how the output is gonna be and if it will be done manually or automatically. Also, it is important to keep track of model predictions to see if it is still working properly or if it needs adjustments.
