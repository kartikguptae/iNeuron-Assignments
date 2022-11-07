create database sql_projects;
use sql_projects;

/*

🎯𝗔𝗻𝗮𝗹𝘆𝘇𝗶𝗻𝗴 𝘁𝗵𝗲 𝗪𝗼𝗿𝗹𝗱 𝗣𝗼𝗽𝘂𝗹𝗮𝘁𝗶𝗼𝗻
In this project, you will use the dataset by CIA World Factbook and explore how the world population 
spreads across different countries.
The data has information from only 261 different countries.
Dataset contains 11 rows and 262 columns like id, code, area, population, birth_rate, death_rate, 
migration_rate, population_growth.

1. Which country has the highest population?
2. Which country has the least number of people?
3. Which country is witnessing the highest population growth?
4. Which country has an extraordinary number for the population?
5. Which is the most densely populated country in the world?
*/


create table cia_factbook_world_population (
    country varchar(100),
    area varchar(100),	
    birth_rate	varchar(100),
    death_rate	varchar(100),
    infant_mortality_rate varchar(100)	,
    internet_users	varchar(100),
    life_exp_at_birth	varchar(100),
    maternal_mortality_rate	varchar(100),
    net_migration_rate	varchar(100),
    population	int,
    population_growth_rate decimal(10,4)
);

select * from cia_factbook_world_population;

SET SESSION sql_mode = '';

load data infile 
'D:/cia_factbook_FSDA2.csv'
into table cia_factbook_world_population 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

select * from cia_factbook_world_population where country = 'lebanon';
	
/*1. Which country has the highest population?*/
	select country , population as highest_population from cia_factbook_world_population where population in 
    (select max(population) from cia_factbook_world_population);

/*2. Which country has the least number of people?*/
	select country, population as least_population from cia_factbook_world_population where population in 
    (select min(population) from cia_factbook_world_population);

/*3. Which country is witnessing the highest population growth?*/
	select country, population_growth_rate as high_population_growth_rate from cia_factbook_world_population 
    where population_growth_rate in 
    (select max(population_growth_rate) from cia_factbook_world_population);
    
/*4. Which country has an extraordinary number for the population?*/
    select country , population as extra_ordinary_population from cia_factbook_world_population where population in 
    (select max(population) from cia_factbook_world_population);
    
 /*5. Which is the most densely populated country in the world?*/
	select country , population as most_densely_populated from cia_factbook_world_population where population in 
    (select max(population) from cia_factbook_world_population);
    
    
    
    