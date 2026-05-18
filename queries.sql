ALTER TABLE big_box_home_improvement RENAME TO transactions_raw;

CREATE TABLE transactions_clean AS
SELECT *
FROM transactions_raw;

--Trimming whitespace
UPDATE transactions_clean
SET
retailer = TRIM(retailer),
store_location = TRIM(store_location),
department = TRIM(department),
project_type = TRIM(project_type),
sku = TRIM(sku),
brand = TRIM(brand),
pro_program = TRIM(pro_program);

--Get rid of missing values from brand
DELETE FROM transactions_final
WHERE brand IS NULL
OR TRIM(brand) = '';

--Checking and deleting missing values
SELECT *
FROM transactions_clean
WHERE unit_price IS NULL
OR quantity IS NULL
OR total_after_discount IS NULL;

DELETE FROM transactions_clean
WHERE unit_price IS NULL
OR quantity IS NULL
OR total_after_discount IS NULL;

--Remove duplicates
DELETE FROM transactions_clean
WHERE rowid NOT IN(
SELECT MIN(rowid)
FROM transactions_clean
GROUP BY transaction_id
);

--Validate numeric logic
SELECT *
FROM transactions_clean
WHERE quantity <= 0
OR unit_price <= 0;

SELECT *
FROM transactions_clean
WHERE "bulk_discount_applied_%" > 100;

--Check financial consistency
SELECT
transaction_id,
subtotal_before_discount,
total_after_discount,
ROUND(subtotal_before_discount * (1 - "bulk_discount_applied_%" / 100), 2) AS expected_total
FROM transactions_clean;

--Standardize date format
SELECT purchase_date
FROM transactions_clean
WHERE purchase_date IS NULL;

--Create final analysis table
CREATE TABLE transactions_final AS
SELECT *
FROM transactions_clean;

--Revenue by brand
SELECT brand, SUM(total_after_discount) AS revenue
FROM transactions_final
GROUP BY brand
ORDER BY revenue DESC;

--Top departments
SELECT department, COUNT(*) AS transactions
FROM transactions_final
GROUP BY department
ORDER BY transactions DESC;

--Discount impact
SELECT
AVG("bulk_discount_applied_%") AS avg_discount,
AVG(subtotal_before_discount - total_after_discount) AS avg_savings
FROM transactions_final;
