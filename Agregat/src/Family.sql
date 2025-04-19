WITH customer_products AS (
    SELECT 
        user_id,
        product_id
    FROM orders
    GROUP BY user_id, product_id
),

product_pairs AS (
    SELECT 
        cp1.product_id AS product1_id,
        cp2.product_id AS product2_id,
        COUNT(DISTINCT cp1.user_id) AS customer_count
    FROM customer_products cp1
    JOIN customer_products cp2 
        ON cp1.user_id = cp2.user_id 
        AND cp1.product_id < cp2.product_id
    GROUP BY cp1.product_id, cp2.product_id
    HAVING COUNT(DISTINCT cp1.user_id) >= 3
)

SELECT 
    pp.product1_id,
    pp.product2_id,
    p1.category AS product1_category,
    p2.category AS product2_category,
    pp.customer_count
FROM product_pairs pp
JOIN ProductInfo p1 ON pp.product1_id = p1.product_id
JOIN ProductInfo p2 ON pp.product2_id = p2.product_id
ORDER BY pp.customer_count DESC, pp.product1_id, pp.product2_id;