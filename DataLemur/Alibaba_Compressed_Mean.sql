SELECT
  ROUND(
    SUM(
        CAST(
            (item_count * order_occurrences) AS numeric)) / SUM(order_occurrences), 1) AS mean
FROM items_per_order;