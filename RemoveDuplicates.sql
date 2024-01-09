USE SuperStore;
GO


WITH duplicate_values
AS (SELECT ROW_NUMBER() OVER (PARTITION BY order_id, product_id ORDER BY order_id, product_id) AS rowNumber,
           order_id,
           product_id
    FROM TempOrders)
DELETE FROM duplicate_values
WHERE duplicate_values.rowNumber > 1
      AND order_id = duplicate_values.order_id
      AND product_id = duplicate_values.product_id;