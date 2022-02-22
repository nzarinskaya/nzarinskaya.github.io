WITH c AS(

SELECT (EXTRACT(YEAR FROM created_at)) AS year,to_char(created_at, 'Month') AS monthname, 
	   (EXTRACT(MONTH FROM created_at)) AS mn, COUNT(id)AS offers_amount
	FROM public.offers
	WHERE EXTRACT(YEAR FROM created_at)  = 2021
	GROUP BY year,monthname,mn
	)
	SELECT year, monthname,offers_amount, SUM(offers_amount)OVER(ORDER BY mn) AS offers_sum
	FROM c
	ORDER BY mn;