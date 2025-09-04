  --  select * from cars


-- 1.total car sales for each segment
 select Segment,
 sum(Total) as totalsales
 from cars
 group by Segment;


-- 2. average monthly sales for each segment
select Model,
round(Total/12, 2)
as avg_mnthly_sales
from cars;

-- select * from cars

-- 3.body type has the heighest total car sales
select Body Type,
sum(Total) as totalsale
from cars
group by `Body Type`
order by totalsales desc
limit 1;

-- 4.which body type is performing the best in sales?

Select `Body Type`, sum(sales) as totalsales
from cars
group by `Body Type`
order by totalsales desc;

-- 5.what is the mom growth trend for each model..

select Model, Months, Sales , `MoM %`
From cars
order by Model, Months desc;

-- --6. months with lowest sales overall..
select Months, sum(Sales) as totalsales
from cars
group by Months
order by totalsales asc;

-- 7.which month should we launch a new car to maximize chances of sucess?
select Months, sum(sales) as totalsales
from cars
group by Months
order by totalsales desc;

-- 8.which model brings the most yoy growh but lowest current sales..
select Model, sum(sales) as totalsales,
avg(`YoY %`) as avgyoy
from cars
group by Model
order by avgyoy desc, totalsales asc;


-- 9.which model consistently underperforms(lowest sales every month)?
select Model
from cars
where Sales =(
select min(Sales)
from cars
where Months = Months
)
group by Model
having count(distinct Months) =
(select count(distinct Months)
from cars);


-- 10.which month should we launch a new car to mazimize chances of sucess?
select Months, sum(Sales) as totalsales
from cars
group by Months
order by totalsales desc;


-- 11.which body type is declining in sales the most?

select `Body Type` , avg(`YoY %`) as avgyoy
from cars
group by `Body Type`
order by avgyoy asc;