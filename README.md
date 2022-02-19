# Pewlett Hackard Analysis and the Silver Wave's Great Resignation, or There and Back Again

## Our team needs to prepare for a generation to retire and the next generation to build back into our needs. 

### Our report consists of four technical analysis deliverables results and a summary report. We will cover the following:

  - Deliverable 1: Provide eligible potential retirees by title, the same information reorganized into a usable format by employee number, and then the total retirees by position
  - Deliverable 2: Identify eligible replacements for our potential retirees
---
### Results 1: Potential Retirees by Title
 -  The query below creates a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955. Our first goal is to gain a general ledger of those eligible, but we will need to extend this analysis and clean the information for use. 
### ![retirement_titles.csv](https://github.com/ScottyMacCVC/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/retirement_titles.PNG)
---

## Results 2: Cleaning the Information
 -  The query below is a Unique Titles table that contains the employee number, first and last name, and most recent title. The importance of the table is paramount. We only want to measure a single employee, once. We would otherwise end up with too many retirees in our analysis and potentially provide bad feedback. 
### ![unique_titles.csv](https://github.com/ScottyMacCVC/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/unique_titles.PNG)
---

## Results 3: Summary Table Snapshot
 -  We then queried for Retiring Titles table that contains the number of titles filled by employees who are retiring. A quick snapshot can help us gauge the number of retirees and compare to re-hiring. Although positions may be eliminated, the company is growing and we need to be sure to have a reasonably similar number of applicants accepted. 
### ![retiring_titles.csv](https://github.com/ScottyMacCVC/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/retiring_titles.PNG)
---

## Results 4: Mentorship Eligibility for Our Younger Staff
 -  We built a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965. Our true challenge is replacing our team members. We value and invested in our soon to be retirees, we need to continue with our younger team. 
### ![mentorship_eligibilty1.csv](https://github.com/ScottyMacCVC/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/mentorship_eligibilty1.PNG)
---

### The summary addressing two questions and two additional queries or tables with potenial insight.
- **1** A Table/Query that would provide more insight would be Mentorship eligibility counted, by title. We will want to extend the analysis to include a snapshot of only the younger team members and then counted by positions. We can see in the image below, only 1,550 are eligible for mentorship. The number is far exceeded by totals shown in the summary Retiring Titles table. 
### ![mentorship_eligibilty2.csv](https://github.com/ScottyMacCVC/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Analysis/mentorship_eligibilty2.PNG)

- **2** We would want to query the total number of retirees, by title, and join the totals with the same analyisis of our younger staff. We want to compare apples to apples and promote and hire accordingly. 


## Resources
- Data Source: retirement_titles.csv, unique_titles.csv, retiring_titles.csv, and mentorship_eligibilty.csv files
- Software: Python 3.7.6., pgADMIN, PostgreSQL
