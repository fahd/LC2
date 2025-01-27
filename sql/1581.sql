/*
Input: 

Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+

Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+

Output: 
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+
*/
-- v2
SELECT
    customer_id,
    count(customer_id) as count_no_trans
FROM
    Visits V
LEFT JOIN
    Transactions T 
ON
    V.visit_id = T.visit_id
WHERE 
    transaction_id IS NULL
GROUP BY
    customer_id;

-- v1
SELECT
    V.customer_id,
    Count(V.customer_id) AS count_no_trans
FROM
    Visits V
LEFT JOIN
    Transactions T 
ON
    V.visit_id = T.visit_id
WHERE
    T.transaction_id IS NULL
GROUP BY
    V.customer_id;
