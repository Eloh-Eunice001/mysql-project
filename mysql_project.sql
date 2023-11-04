select * from members;
select * from prices;
select * from transactions;

select count(*) as record_count from members;
select count(*) as record_count from prices;
select count(*) as record_count from transactions;

select min(price) from prices as min_price;
select max(price) from prices as max_price;
select round(avg(price),2) from prices as avg_price;

#What is the min market date and max market date by ticker from the price database, 
#renaming the min market date as earliest and max market date as latest 

select min(market_date) as earliest from prices order by ticker;
select max(market_date) as latest from prices order by ticker;

#What is the average price of ‘BTC’ in year 2020
#What is the average price of ‘ETH’ in year 2020
#What is the average price of ‘BTC’ and ‘ETH’ in all years in the database
select ticker,round(avg(price),2) as avg_price from prices where ticker='BTC' 
       and year(market_date)=2020;
select ticker,round(avg(price),2) as avg_price from prices where ticker='ETH'
       and year(market_date)=2020;
select ticker,round(avg(price),2) as avg_price from prices 
       where year(market_date)=2021 group by ticker;
select ticker,round(avg(price),2) as avg_price from prices group by ticker;

#What is the average price of “ETH” in year 2020 in August
#What is the average price of “BTC” in year 2020 in August
select ticker,round(avg(price),2) as  avg_price from prices where ticker='ETH' 
    and year(market_date)=2020 and month(market_date)=8;
select ticker,round(avg(price),2) as  avg_price from prices where ticker='BTC' 
    and year(market_date)=2020 and month(market_date)=8;
    
#Obtain the ‘year-month’ only in from the price data
select date_format(market_date,'%Y-%m') as years_month from prices;

#Select the first five data select from price, members and transactions 
#Obtain the first 5 by from members data order in ascending by their first name 
#Obtain the information of whose region are in United state 

select * from prices limit 5;
select * from members limit 5;
select * from transactions limit 5;

select * from members order by first_name asc limit 5;
select * from members where region ='United States';

#Obtain the information of whose region is not Australia
#What is the count of the transaction data 
#Obtain the information of the transaction data whose txt_id is greater 22195
#How many distinct members are there in the transaction data 

select * from members where region <>'Australia';
select count(*) from transactions;
select * from transactions where txn_id>22195;
select distinct member_id from transactions;