SELECT offers.id, offer_type, categories.title, 
CONCAT(first_name,' ', last_name)AS author, offers.title, 
CONCAT( LEFT(full_text,30),'...') AS announce
,price
	
	FROM public.categories
	     INNER JOIN public.category_offer
	     ON public.categories.id = public.category_offer.category_id
		 INNER JOIN public.offers
	     ON public.offers.id = public.category_offer.offer_id
		 INNER JOIN public.users 
	     ON public.offers.user_id = public.users.id
	
	WHERE offer_type = 'buy' AND categories.title = 'Животные'
	AND offers.title LIKE'%кролик%гараж%' AND price<50000;