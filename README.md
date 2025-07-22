# SQL Project: Exploratory Data Analysis (Layoffs Dataset)

## Project Overview
This project performs exploratory data analysis on a cleaned dataset of tech company layoffs using SQL. It uncovers trends, patterns, and insights from the dataset.

## Key Questions Explored
- What companies had 100% layoffs?
- Which industries and countries saw the most layoffs?
- How did layoffs change over time?
- What were the top companies affected each year?

## Analysis Techniques
- Aggregation (`SUM`, `COUNT`)
- Filtering and sorting
- Grouping by `year`, `industry`, `country`, `stage`
- Ranking with `DENSE_RANK`
- Rolling totals using window functions

## Files
- [EDA.sql](./EDA.sql): All EDA queries used to generate insights
- [layoffs_clean.csv](./layoffs_clean.csv) : layoffs clean dataset

## Notable Insights
- The tech industry was the most affected overall
- Several companies laid off 100% of their staff
- Layoffs peaked in certain years and declined in others
- Countries like the US and India had higher total layoffs

##  Tools
- MySQL 8+
- CTEs and Window Functions

## Time-Based Analysis
- Layoffs by year, month
- Rolling total layoffs over time

> Built entirely using raw SQL — no external analytics tools.
