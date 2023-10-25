SELECT  s.product_id
        , s.year AS first_year
        , s.quantity
        , s.price
FROM    sales s
WHERE   1 = 1
AND     (s.product_id, s.year) IN
            (
                SELECT  s2.product_id
                        , MIN(s2.year)
                FROM sales s2
                GROUP BY    s2.product_id
            )
# GROUP BY    s.product_id