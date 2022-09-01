select* from portfolioproject..CovidDeaths
order by 3,4

select* from portfolioproject..CovidVaccinations
order by 3,4

select location , date, total_cases,new_cases, total_deaths, population
from portfolioproject..CovidDeaths
order by 1,3

--total cases vs total deaths
select location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as deathPercentage
from portfolioproject..covidDeaths
where location like'%russia%'
order by 1,2
 
--- total cases vs population
select location, date, total_cases, population,(total_cases/population)*100 as deathPercentage
from portfolioproject..covidDeaths
where location like'%states%'
order by 1,2

---highest infection rate to population
select location, population , max(total_cases) as HighestInfectioncount,
max((total_cases/population))*100 as PercentPopulationInfected
from portfolioproject..covidDeaths
--where location like'%andorra%'
group by location,population
order by PercentPopulationInfected desc

---highest death count by population
select location,max( cast(total_deaths as int )) as TotalDeathcount
from portfolioproject..covidDeaths
--where location like'%russia%'
where continent is not null    ---avoid grouping of locations
group by location
order by TotalDeathcount desc

---use continent for location
select continent,max( cast(total_deaths as int )) as TotalDeathcount
from portfolioproject..covidDeaths
--where location like'%russia%'
where continent is not null    ---avoid grouping of locations
group by continent
order by TotalDeathcount desc

 ---continent with highest death rates
 select location , date, total_cases,new_cases, total_deaths, population
from portfolioproject..CovidDeaths
order by 1,3

