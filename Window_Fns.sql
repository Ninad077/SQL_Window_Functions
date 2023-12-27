-- Window Function
-- Aggregates a field keeping all the other columns intact as well. 
-- (Removes the limitation of group function, where we cannot aggregate the columns)

-- Normal group by will show an error since customerNumber and customerName cannot be agggregated
Select  customerNumber, customerName,sum(creditLimit)
from customers
group by country;

-- Resolving the error of Group using Window function
Select  customerNumber, customerName,
sum(creditLimit) over (partition by country)
from customers;

-- Window 
select row_number() over(), creditLimit, customerName,country
from customers;

-- Window with partition
select row_number() over(partition by country), creditLimit, customerName,country
from customers;

-- Window with partition and order by
select row_number() over(partition by country order by creditLimit), creditLimit, customerName,country
from customers;