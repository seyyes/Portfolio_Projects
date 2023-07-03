The project is about creating an HR Analytics Dashboard to enable data-driven insights and decision-making for enhanced HR management.

Business Problem/Objective:

Provide actionable insights and visualizations to support data-driven decision-making in various HR-related areas such as attrition analysis, employee demographics, salary analysis, employee satisfaction etc.

Before building the dashboard, we've performed data cleansing with Power Query and created some measures.

Useful Insights:

For a better analysis, we've divided our analysis in different parts such Demographics, Work, Company history, Staff satisfaction survey study and Finance. 

In all pages, we've put filters in order to allow the dashbord users filtering based on gender, age range, department, job role, attrition.

Overview: 
In the overview page, we have a summary of our analysis. There's:
	➡ An overview of all the analysis we've done with a list of most relevant attrition indicators such as Age, Working years in 	the company, marital status,.... 
	➡ Cards containing some KPI such as total retention,attrition rate, total attrition, Avg salary, avg job satisfaction, Avg 	age, Avg years at company.
	➡A treemap retrieving the attrition rate in each Dapartment

Demographics:
In the demographics page there's an analysis of employees attrition based on their demographic informations such as Gender, Marital status, age, working years, Education and Education Field. To perform these analyses we've used:
	➡ A pie chart for gender 
	➡ For other Demographic parameters, we've used Histograms for displaying the distribution.

Work:
The Work section contains an analysis of employees attrition based on their work informations such as the Department they're working in, their job role, job level, training times, their commute distance and whether they're doing overtime or not. To perform these analyses we've used:
	➡ A donut chart for Overtime 
	➡ Histograms for other parameters to display the distribution.

Company history:
In the Company history page, there are line charts for analysing the distribution of the attrition by years in current role, years since last promotion, years at company and years with current manager.

Staff satisfaction:
Staff satisfaction page shows a summary of the results of the survey about job satisfaction, Environment satisfaction, relationship satisfaction, job involvement and worklife balance. Next to each of them there's a card of the average of scores.

Finance:
Finance section contains an analysis of financial informations such as distribution monthly income, stock option level monthly rate and salary hike. The analysis is done using line charts and histograms.

Employees: 
In Employees section there's a recap of employees informations in a matrix with informations such as ID, Gender, Departement, job Role, attrition, seniority and monthly income.

