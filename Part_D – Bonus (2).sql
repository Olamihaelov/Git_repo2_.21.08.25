CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    movie_name TEXT NOT NULL UNIQUE,
    genre TEXT NOT NULL,
    country TEXT NOT NULL,
    language TEXT NOT NULL,
    year INTEGER NOT NULL CHECK (year >= 2009),
    revenue REAL NOT NULL CHECK (revenue >= 0)
);


DROP FUNCTION IF EXISTS total_revenue_by_year(INTEGER);

CREATE OR REPLACE FUNCTION total_revenue_by_year(p_year INTEGER)
RETURNS REAL
LANGUAGE plpgsql AS
$$
DECLARE
    total_revenue REAL;
BEGIN
    SELECT SUM(revenue) INTO total_revenue
    FROM movies
    WHERE year = p_year;

    RETURN total_revenue;
END;
$$;

SELECT total_revenue_by_year(2023) AS total_revenue;
