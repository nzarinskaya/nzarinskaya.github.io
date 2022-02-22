WITH ranks(c_n,off_id,off_cr, off_u_id,off_t, off_pr,r)
     AS(SELECT  categories.title, offers.id, offers.created_at, offers.user_id, offers.title, offers.price,
		ROW_NUMBER() OVER (ORDER BY  offers.id )
	FROM public.categories
	      INNER JOIN public.category_offer
	     ON public.categories.id = public.category_offer.category_id
		 INNER JOIN public.offers
	     ON public.offers.id = public.category_offer.offer_id
	     WHERE categories.title = 'Дом'	
	 )

SELECT  c_n AS category_name, off_id AS offer_id, off_cr AS created_at,off_u_id AS user_id,off_t AS title,
off_pr AS price
	FROM ranks
	WHERE r BETWEEN 5 AND 8;

		 