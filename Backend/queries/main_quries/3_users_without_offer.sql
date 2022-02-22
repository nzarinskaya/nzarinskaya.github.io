SELECT users.id, email,to_char(users.created_at, 'DD.MM.YYYY') AS registration_date , 
CONCAT(first_name,' ', last_name) AS user_name
	FROM public.users
	     LEFT JOIN public.offers
		 ON public.users.id = public.offers.user_id
    WHERE offers.id is NULL
    ORDER BY registration_date ASC;