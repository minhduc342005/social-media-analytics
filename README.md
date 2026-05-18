# Social-Media-Marketing-Performance-Analytics 

## Project Objective

Analyze social media marketing performance across multiple platforms to help businesses better understand the effectiveness of each channel, content type, and geographic region. This enables marketing teams to optimize content strategies, allocate budgets efficiently, and boost customer engagement in upcoming campaigns.

## Dataset Used
[Social_Media_Content_Performance_Dataset.xlsx](https://github.com/user-attachments/files/27965483/Social_Media_Content_Performance_Dataset.xlsx)


## Questions (KPIs)

* Which platform and post type generate the highest engagement or views?
* Which content category (e.g., product promotion, educational) performs best across different regions?
* How do performance metrics vary by platform, post format, or hashtag usage?
* What are the ideal days and times to post content for maximum engagement?
* Are there regional differences in engagement performance and click-through rate (CTR)?
* Which hashtags are most effective at driving impressions or clicks?
* Which countries or regions consistently show high video views or strong interest in live streams?
* Is there any correlation between engagement levels and content category or posting time?
* How do organic content and promoted content differ in terms of reach and performance?

## Process

### Python — Data Cleaning & EDA
* Loaded dataset using pandas read_excel()
* Explored data with df.info(), df.describe(), df.isnull().sum()
* Standardized column names to snake_case
* Feature engineering: added month, day_of_week, quarter columns
* Exported cleaned data to social_media_cleaned.csv

### SQL Server — Data Analysis
* Connected Python to SQL Server via pyodbc + sqlalchemy
* Loaded 5,600 rows into SQL Server database
* Wrote 9 SQL queries to answer business questions
* Used AVG, GROUP BY, ORDER BY, WHERE, ROUND functions

###  Power BI — Dashboard
* Connected Power BI directly to SQL Server
* Created DAX measures: Total Posts, Avg CTR, Avg Engagement, Avg Views
* Built bar charts, donut chart, line chart, and slicers
* Combined all visuals into 2-page interactive dashboard

## Dashboard
<img width="1401" height="797" alt="SMMPA1" src="https://github.com/user-attachments/assets/524bf889-4e79-4abe-b4b7-dc311ba490d5" />
<img width="1458" height="817" alt="SMMPA2" src="https://github.com/user-attachments/assets/e0908dd3-221c-4c65-b60b-7d6985df6681" />


## Project Insights

* Instagram is the top platform with 135K avg engagement — nearly 2x LinkedIn (85K)
* Video posts drive 160K avg engagement — 2.7x more than Image posts
* Product Promotion ranks #1 in every region — USA and Australia lead at 182K
* Best time to post: Friday at 6PM with 173K avg engagement
* Germany has the highest CTR (0.0191) — highest click intent market
* #ProductDemo drives the most impressions (2.1M avg)
* #MemeMonday drives the most clicks (43K avg) despite lower reach
Japan leads video views (687K), Germany leads live streaming (127K)
Sponsored outperforms Organic by +14% engagement and +17% impressions

## Final Conclusion:

To maximize social media marketing effectiveness, businesses should focus their investment on **Video content** across **Instagram, Facebook, and TikTok**, targeting two key markets: **Japan and USA**. Two priority content categories are **Product Promotion** and **Educational** content - both of which drive the highest engagement rates. The content strategy should combine short, shareable product videos with educational posts, while scheduling content to align with the target markets' time zones to maximize engagement and views.
