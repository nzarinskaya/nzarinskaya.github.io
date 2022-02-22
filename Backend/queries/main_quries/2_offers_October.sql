SELECT id, to_char(created_at, 'DD.MM.YYYY') AS created_at, user_id, offer_type, title, price, picture
	FROM public.offers
	WHERE EXTRACT(MONTH FROM created_at)  = 10
	ORDER BY created_at DESC;