SELECT * FROM  `covid deaths in india`;

-- THIS HAS DATA OF 2021 YEAR AND ALL RELATED ASPECTS ARE RELATED TO IT 

-- SELECT DATA WE ARE GOING TO BE STARTING WITH

SELECT * FROM  `covid deaths in india`;

SELECT location,date,total_cases,new_cases,total_deaths,population
 FROM portfolio_project.`covid deaths`
  WHERE total_deaths is not null
 order by date asc ;
 
  -- LOOKING AT death percentage rate for the year 2021 
SELECT location,date,total_cases,total_deaths,population,concat(total_deaths/total_cases)*100 as percentage_death_rate
FROM `covid deaths in india`
where total_deaths is not null
order by date asc ;

-- maximum total case reported  over period of time 
SELECT location,total_cases,population,max(total_cases) as highinfectioncount,
max((concat(total_cases/population)*100)) as percentage_positive
FROM covid_project.`covid-positivity-rate-for-sql`
group by   continent  ;

--  total death counts by covid 
SELECT date,sum(total_deaths) as death_count
FROM `covid deaths in india`
WHERE total_deaths is not null
order by death_count ;

-- total numbers  by progression  IN INDIA
  SELECT date,sum(new_cases) as TOTAL__cases , sum(new_deaths) AS TOTAL_DEATHS ,concat(sum(new_deaths)/ sum(new_cases)*100) as death_percentage
from `covid deaths in india`                  
where date is not null 
group by date;

-- total numbers till date IN INDIA
  SELECT date,sum(new_cases) as TOTAL__cases , sum(new_deaths) AS TOTAL_DEATHS ,concat(sum(new_deaths)/ sum(new_cases)*100) as death_percentage
from `covid deaths in india`                  
where date is not null ;




-- rolling vaccinations
select `covid deaths in india`.location ,`covid deaths in india`.date, `covid deaths in india`.population,`covid vaccination rate`.new_vaccinations,`covid vaccination rate`.people_fully_vaccinated,sum(concat(`covid vaccination rate`.new_vaccinations/`covid vaccination rate`.people_fully_vaccinated)*100) as people_vaccianted
from `covid vaccination rate`
 inner join `covid deaths in india` 
 on `covid vaccination rate`.date=`covid deaths in india`.date
 group by  date;
 
 -- creating view to store data for later visulaizations
 
 create view  total_covid_deaths_in_India as
 SELECT location,date,total_cases,new_cases,total_deaths,population
 FROM portfolio_project.`covid deaths`
  WHERE total_deaths is not null
 order by date asc ;
 
 create view death_percentage_rate_for_the_year_2021 as
 SELECT location,date,total_cases,total_deaths,population,concat(total_deaths/total_cases)*100 as percentage_death_rate
FROM `covid deaths in india`
where total_deaths is not null
order by date asc ;

create view total_case_reported_over_period_of_time as
SELECT location,date,total_cases,population,(concat(total_cases/population)*100) as percentage_positive
FROM covid_positivity_rate_for_sql
WHERE total_deaths is not null
order by  date asc ;

create view total_death_counts_by_covid as
SELECT date,sum(total_deaths) as death_count
FROM `covid deaths in india`
WHERE total_deaths is not null
order by death_count ;

create view total_numbers_by_progression as  SELECT date,sum(new_cases) as TOTAL__cases , sum(new_deaths) AS TOTAL_DEATHS ,concat(sum(new_deaths)/ sum(new_cases)*100) as death_percentage
from `covid deaths in india`                  
where date is not null 
group by date;

create view total_numbers_till_date as
  SELECT date,sum(new_cases) as TOTAL__cases , sum(new_deaths) AS TOTAL_DEATHS ,concat(sum(new_deaths)/ sum(new_cases)*100) as death_percentage
from `covid deaths in india`                  
where date is not null ;
SELECT * FROM 

create view rolling_vaccinations as
select `covid deaths in india`.location ,`covid deaths in india`.date, `covid deaths in india`.population,`covid vaccination rate`.new_vaccinations,`covid vaccination rate`.total_vaccinations
from `covid vaccination rate`
 inner join `covid deaths in india` 
 on `covid vaccination rate`.date=`covid deaths in india`.date
 group by  date;
 
