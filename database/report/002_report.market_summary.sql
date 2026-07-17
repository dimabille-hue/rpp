CREATE VIEW report.market_summary AS

SELECT

    object_id,

    COUNT(*)                     AS observations,

    AVG(price_per_sq_meter)      AS avg_price,

    percentile_cont(0.5)

    within group

    (order by price_per_sq_meter)

    AS median_price,

    MIN(price_per_sq_meter) AS min_price,

    MAX(price_per_sq_meter) AS max_price

FROM market.observation

GROUP BY object_id;
