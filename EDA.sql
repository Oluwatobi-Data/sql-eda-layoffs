-- exploratory data analysis of layoffs_clean data
select * 
from layoffs_clean;

-- Max total layed off and percentagelayed off
select max(total_laid_off), max(percentage_laid_off)
from layoffs_clean; 

-- count of company with 100% total layed off
select count(*)
from layoffs_clean
where percentage_laid_off = 1;

-- companies with 100% total layed off and their numbers
select *
from layoffs_clean
where percentage_laid_off = 1
order by total_laid_off desc;

-- companies with 100% total layed off order by fund raised in millions
select *
from layoffs_clean
where percentage_laid_off = 1
order by funds_raised_millions desc;

-- list of companies and sum of total layed off
select company, sum(total_laid_off)
from layoffs_clean
group by company
order by 2 desc;

-- date range
select min(`date`), max(`date`)
from layoffs_clean;

-- list of industries and sum of total layed off
select industry, sum(total_laid_off)
from layoffs_clean
group by industry
order by 2 desc;

-- list of countries and sum of total layed off
select country, sum(total_laid_off)
from layoffs_clean
group by country
order by 2 desc;

-- sum of total layed off by years
select year(`date`), sum(total_laid_off)
from layoffs_clean
group by year(`date`)
order by 1 desc;

-- sum of total layed off by stages
select stage, sum(total_laid_off)
from layoffs_clean
group by stage
order by 2 desc;

-- sum of total layed off by location
SELECT location, SUM(total_laid_off)
FROM layoffs_clean
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;

-- ranking of companies with total layoff by year
WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_clean
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 4
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_clean
GROUP BY dates
ORDER BY dates ASC;

-- used in CTE
WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_clean
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;

