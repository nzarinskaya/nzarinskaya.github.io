SELECT offers.id, CONCAT(first_name,' ', last_name) AS full_name, title, price 
	FROM public.offers
	     INNER JOIN public.users
		 ON public.offers.user_id = public.offers.id
		 WHERE public.users.id = public.offers.user_id 
		 AND price IN 
		                (SELECT MAX(price)
						  FROM offers
						 );
	