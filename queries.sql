-- write your queries here
-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
SELECT * 
FROM vehicles v
FULL OUTER JOIN owners o
ON v.owner_id = o.id;

-- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order.
SELECT o.first_name, o.last_name, COUNT(*) AS cars_owned
FROM owners o
INNER JOIN vehicles v 
ON v.owner_id = o.id
GROUP BY o.id
ORDER BY cars_owned;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.
SELECT o.first_name, o.last_name, COUNT(*) AS cars_owned, ROUND(AVG(v.price)) AS average_price
FROM owners o
JOIN vehicles v
ON v.owner_id = o.id
GROUP BY o.id
HAVING COUNT(*) > 1 AND ROUND(AVG(v.price)) > 10000
ORDER BY cars_owned DESC;
