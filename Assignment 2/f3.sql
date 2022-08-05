DROP FUNCTION IF EXISTS get_worst_shops;

CREATE OR REPLACE FUNCTION get_worst_shops(n INTEGER)
RETURNS TABLE(
  shop_id INTEGER,
  shop_name TEXT,
  num_negative_indicators INTEGER) AS $$
BEGIN
  RETURN QUERY
  WITH refund_count AS (
    SELECT Counts.shop_id AS id, count(Counts.shop_id) AS count1
    FROM (
      SELECT RR.shop_id
      FROM refund_request RR
      GROUP BY RR.order_id, RR.shop_id, RR.product_id, RR.sell_timestamp
    ) AS Counts
    GROUP BY Counts.shop_id
  ),
  shop_complaint_count AS (
    SELECT SC.shop_id AS id, count(SC.shop_id) AS count2
    FROM shop_complaint SC
    GROUP BY SC.shop_id
  ),
  delivery_complaint_count AS (
    SELECT Counts.shop_id AS id, count(Counts.shop_id) AS count3
    FROM (
      SELECT DC.shop_id
      FROM delivery_complaint DC
      GROUP BY DC.order_id, DC.shop_id, DC.product_id, DC.sell_timestamp
    ) AS Counts
    GROUP BY Counts.shop_id
  ),
  review_count AS (
    SELECT review.shop_id AS id, count(review.shop_id) AS count4
    FROM review NATURAL JOIN (
      SELECT review_id AS id
      FROM review_version RV
      WHERE RV.review_timestamp = (
        SELECT max(review_timestamp)
        FROM review_version RV2
        WHERE RV2.review_id = RV.review_id
      )
      AND RV.rating = 1
    ) AS RRV
    GROUP BY review.shop_id
  )
  SELECT S.id AS shop_id, S.name AS shop_name,
    CAST(COALESCE(count1, 0)
      + COALESCE(count2, 0)
      + COALESCE(count3, 0)
      + COALESCE(count4, 0)
      AS INTEGER)
    AS num_negative_indicators
  FROM
    shop S FULL JOIN refund_count RC ON S.id = RC.id
    FULL JOIN shop_complaint_count SCC ON S.id = SCC.id
    FULL JOIN delivery_complaint_count DCC ON S.id = DCC.id
    FULL JOIN review_count RVC ON S.id = RVC.id
  ORDER BY num_negative_indicators DESC, shop_id ASC
  LIMIT n;

END
$$ LANGUAGE plpgsql;
