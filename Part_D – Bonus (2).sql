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
