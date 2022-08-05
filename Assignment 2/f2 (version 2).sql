DROP FUNCTION IF EXISTS get_most_returned_products_from_manufacturer;

CREATE OR REPLACE FUNCTION get_most_returned_products_from_manufacturer (manufacturer_id INTEGER, n INTEGER)
RETURNS TABLE (product_id INTEGER, product_name TEXT, return_rate NUMERIC(3,2)) AS $$
BEGIN
	RETURN QUERY
	WITH prod_sold AS (
		SELECT o.product_id, CAST(sum(o.quantity) AS NUMERIC) AS qty_sold
		FROM orderline o, product p
		WHERE p.manufacturer = manufacturer_id AND
		p.id = o.product_id AND
		o.status = 'delivered'
		GROUP BY (o.product_id)
	),
	prod_returned AS (
		SELECT rr.product_id, CAST(sum(rr.quantity) AS NUMERIC) AS qty_returned
		FROM refund_request rr, product p
		WHERE p.manufacturer = manufacturer_id AND
		p.id = rr.product_id AND
		rr.status = 'accepted'
		GROUP BY (rr.product_id)
	),
	prod_return_rate AS (
		SELECT ps.product_id AS product_id,
		p.name AS product_name,
		CAST(qty_returned/qty_sold AS NUMERIC(3,2)) AS return_rate
		FROM prod_sold ps, prod_returned pr, product p
		WHERE ps.product_id = p.id AND pr.product_id = p.id
	)
	SELECT PRR.product_id, PRR.product_name, PRR.return_rate
	FROM prod_return_rate PRR
	ORDER BY return_rate DESC, product_id ASC
	LIMIT n;
END
$$ language plpgsql;