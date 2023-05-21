create table fraudulent(
step int,
type varchar(20),
amount float,
nameorig varchar(50),
oldbalanceorg float,
newbalanceorig float,
namedest varchar(50),
oldbalancedest float,
newbalanceest float,
isfraud int,
isflaggedfraud int
);

select * from fraudulent;

copy public.fraudulent
from 'C:\Users\Admin\Desktop\10Alytics\SQL\Class\Fraudulent Transactions.csv'
delimiter ',' csv header

-- 1. How many transactions occurred per transaction type?
select type, count (*) as no_of_transaction
from fraudulent
group by type
order by 2 desc;

-- 2. Which Transaction Type has the highest number of Fraudulent Transactions?
select type, count (*) as no_of_transaction
from fraudulent
group by type
order by 2 desc
limit 1;

-- 3. What is the average fraudulent transaction amount?
select type, round(avg(amount))
from fraudulent
where isfraud = 1
group by type;

-- 4. What is the Maximum fraudulent transaction amount?
select max(amount)
from fraudulent
where isfraud = 1;

-- 5. What is the Minimum fraudulent transaction amount?
select min(amount)
from fraudulent
where isfraud = 1;

-- 6. Who are the Top 10 customers with the highest amount defrauded?
select nameorig, sum(amount)
from fraudulent
where isfraud = 1
group by nameorig
order by 2 desc
limit 10;

-- 7. How effective is the bank in flagging fraud?
select sum(isflaggedfraud) as flagged_as_fraud, sum(isfraud) as fraud_happened, sum(isfraud)/sum(isflaggedfraud) as effective_rate
from fraudulent;

-- 8. Who are the Top 20 Fraudsters?
select namedest, sum(amount) as total_amount
from fraudulent
where isfraud = 1
group by namedest
order by 2 desc
limit 20;