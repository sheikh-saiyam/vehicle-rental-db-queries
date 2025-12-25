SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM
  bookings AS b
  INNER JOIN users AS u USING (user_id)
  INNER JOIN vehicles AS v USING (vehicle_id);