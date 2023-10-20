SELECT room_number, price FROM rooms WHERE availability = true ORDER BY price ASC;

SELECT SUM(total_amount) AS total_paid FROM payments
WHERE is_paid = true
GROUP BY currency