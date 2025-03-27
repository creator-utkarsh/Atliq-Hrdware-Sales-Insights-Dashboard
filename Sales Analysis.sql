/*Show all date records*/
SELECT * FROM date;

/*Show total revenue in year 2020,*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date = date.date 
where date.year=2020 ;

/*Show total revenue in year 2019,*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions
JOIN date ON transactions.order_date = date.date 
where date.year=2019 ;

/*Show  avarage sales in year 2020,*/
SELECT AVG(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date=date.date 
where date.year=2020 ;

/*Show  max sales amount in year 2019,*/
SELECT MAX(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date=date.date 
where date.year=2019 ;

/*Show total revenue in year 2020, January Month,*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date=date.date 
where date.year=2020 and date.month_name='January' ;

/*Show total revenue in year 2019, January Month,*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions
JOIN date ON transactions.order_date = date.date 
where date.year=2019 and date.month_name='January' ;

/*Show total revenue in year 2020 in Chennai*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions
JOIN date ON transactions.order_date=date.date 
where date.year=2020 and transactions.market_code="Mark001";

/*Show total revenue in year 2020 in Mumbai*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date=date.date 
where date.year=2020 and transactions.market_code="Mark002";

/*show the distinct products sold in chennai*/
SELECT distinct product_code from transactions where market_code='Mark001';

/*show the distinct product sold in Mumbai*/
SELECT distinct product_code from transactions where market_code='Mark002';

/*Show total revenue in year 2020, January Month, in chennai*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date=date.date 
where date.year=2020 and date.month_name='January' and transactions.market_code="Mark001";

/*Show total revenue in year 2020, February Month, chennai*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date = date.date 
where date.year=2020 and date.month_name='February' and transactions.market_code="Mark001";

/*Show total revenue in year 2020, January Month, in mumbai*/
SELECT SUM(transactions.norm_sales_amount) FROM transactions 
JOIN date ON transactions.order_date=date.date 
where date.year=2020 and date.month_name='January' and transactions.market_code="Mark002";

/*Show total revenue in year 2020, February Month, mumbai*/
SELECT SUM(t.norm_sales_amount) FROM transactions t 
JOIN date d ON t.order_date= d.date 
where d.year = 2020 and d.month_name='February' and t.market_code="Mark002";