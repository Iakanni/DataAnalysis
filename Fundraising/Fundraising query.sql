select * from donation_data;
select * from donor_data;

-- a) Total donation
select sum(donation) as total_donation 
from donation_data;

-- b) Total donation by gender
select gender, sum(donation) as total_donation
from donation_data
group by gender;

-- c) Total donation and number of donations by gender
select gender, sum(donation) as total_donation, count (id) as number_of_donation
from donation_data
group by gender;

-- d) Total donation made by frequency of donation
select donation_frequency, sum(donation) as total_donation
from donation_data
left join donor_data
On donation_data.id = donor_data.id
Group by donation_frequency;

-- e) Total donation and number of donation by job field
select job_field, sum(donation) as total_donation, count(job_field) as number_of_donation
from donation_data
Group by job_field;

-- f) Total donation and number of donation above $200
select sum(donation) as total_donation, count(donation) as number_of_donation
from donation_data
Where donation > 200;

-- g) Total donation and number of donation below $200
select sum(donation) as total_donation, count(donation) as number_of_donation
from donation_data
Where donation < 200;

-- h) Top 10 states with highest donation
select state, sum(donation) as total_donation
from donation_data
group by state
order by total_donation desc
limit 10;

-- i) Top 10 states with least donation
select state, sum(donation) as total_donation
from donation_data
group by state
order by total_donation asc
limit 10;

-- j) Top 10 cars driven by highest donors
select first_name, last_name, car, donation
from donation_data 
left join donor_data
On donation_data.id = donor_data.id
order by donation desc
limit 10;
