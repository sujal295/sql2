
select*,ROUND(
        (current_month_sales - prev_month_sales) / prev_month_sales * 100, 2) AS mom_growth_percent
FROM (
select date_format(created_at,'%Y-%m') as formatted_dt,
sum(orderamount) as current_month_sales,ifnull(lag(sum(orderamount)) over(order by date_format(created_at,'%Y-%m')),sum(orderamount)) as prev_month_sales
from orders
group by formatted_dt
order by formatted_dt
) as months

