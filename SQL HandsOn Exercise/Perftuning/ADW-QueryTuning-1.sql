SET STATISTICS IO ON
SELECT DISTINCT
	PRODUCT.ProductID,
	PRODUCT.Name
FROM SalesLT.Product PRODUCT
INNER JOIN SalesLT.SalesOrderDetail DETAIL
ON PRODUCT.ProductID = DETAIL.ProductID
OR PRODUCT.rowguid = DETAIL.rowguid;