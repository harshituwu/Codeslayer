# Write your MySQL query statement below
(
    -- Part 1: Top User by number of ratings
    SELECT u.name AS results
    FROM MovieRating r
    JOIN Users u ON r.user_id = u.user_id
    GROUP BY r.user_id, u.name
    ORDER BY COUNT(r.movie_id) DESC, u.name ASC
    LIMIT 1
)
UNION ALL
(
    -- Part 2: Top Movie by average rating in Feb 2020
    SELECT m.title AS results
    FROM MovieRating r
    JOIN Movies m ON r.movie_id = m.movie_id
    WHERE r.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY r.movie_id, m.title
    ORDER BY AVG(r.rating) DESC, m.title ASC
    LIMIT 1
);