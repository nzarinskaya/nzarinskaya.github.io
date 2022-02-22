SELECT id, title, slug, COUNT(category_id) AS offer_amount
	FROM public.categories
	     LEFT JOIN public.category_offer
	     ON public.categories.id = public.category_offer.category_id
		 GROUP BY id, title, slug
		 HAVING COUNT(category_id) >=1;
