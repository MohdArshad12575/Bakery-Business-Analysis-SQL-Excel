-- Total Quantity Sold
SELECT SUM(quantity_purchased) AS total_quantity_sold FROM sales_transactions;

-- Total Cost
SELECT SUM(cost) AS total_cost FROM sales_transactions;

-- Total Revenue
SELECT SUM(revenue) AS total_revenue FROM sales_transactions;

-- Total Profit
SELECT SUM(profit) AS total_profit FROM sales_transactions;

-- Profit Margin Percentage
SELECT ROUND(SUM(profit) * 100.0 / NULLIF(SUM(revenue), 0), 2) AS profit_margin_percentage
FROM sales_transactions;

-- Brand with Highest Profit
SELECT brand_name, SUM(profit) AS total_profit
FROM sales_transactions
GROUP BY brand_name
ORDER BY total_profit DESC
LIMIT 1;

-- Most Profitable Location
SELECT buyer_location, SUM(profit) AS total_profit
FROM sales_transactions
GROUP BY buyer_location
ORDER BY total_profit DESC
LIMIT 1;

-- Customer with Highest Revenue
SELECT full_name, SUM(revenue) AS total_revenue
FROM sales_transactions
GROUP BY full_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Top Sales Employee by Revenue and Profit
SELECT sales_representative, SUM(revenue) AS total_revenue, SUM(profit) AS total_profit
FROM sales_transactions
GROUP BY sales_representative
ORDER BY total_revenue DESC
LIMIT 1;

-- Most Profitable Age Group
SELECT age_group, SUM(profit) AS total_profit
FROM sales_transactions
GROUP BY age_group
ORDER BY total_profit DESC
LIMIT 1;


-- Revenue Share by Payment Method
SELECT payment_method, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Revenue by Price Category
SELECT price_range, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY price_range;

-- Revenue by Age Group
SELECT age_group, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY age_group;

-- Revenue by Gender
SELECT gender, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY gender;

-- Top 3 Customers by Revenue
SELECT full_name, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY full_name
ORDER BY total_revenue DESC
LIMIT 3;

-- Revenue by City/Location
SELECT buyer_location, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY buyer_location
ORDER BY total_revenue DESC;


-- Revenue by Payment Type (Filtered)
SELECT payment_method, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
WHERE payment_method IN ('Cash', 'Credit Card', 'Debit Card', 'Mobile Payment')
GROUP BY payment_method;

-- Revenue by Specific Locations (San Diego, Dallas)
SELECT buyer_location, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
WHERE buyer_location IN ('San Diego', 'Dallas')
GROUP BY buyer_location;

-- Profit Margin per Location
SELECT buyer_location,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(SUM(profit) * 100.0 / NULLIF(SUM(revenue), 0), 2) AS profit_margin_percentage
FROM sales_transactions
GROUP BY buyer_location;

-- Gender-wise Revenue by Payment Method
SELECT gender, payment_method, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY gender, payment_method
ORDER BY gender, payment_method;

-- High vs. Low Price Product Revenue
SELECT price_range, ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_transactions
GROUP BY price_range;

-- Revenue and Profit by Each Employee
SELECT sales_representative, ROUND(SUM(revenue), 2) AS total_revenue, ROUND(SUM(profit), 2) AS total_profit
FROM sales_transactions
GROUP BY sales_representative
ORDER BY total_revenue DESC;


