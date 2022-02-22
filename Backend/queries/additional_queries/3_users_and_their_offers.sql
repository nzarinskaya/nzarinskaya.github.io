WITH offer(o_id, cm_id, u_id)
     AS( SELECT offers.id, comments.id, offers.user_id
	    FROM public.offers
	    LEFT JOIN public.comments
		ON public.comments.offer_id = public.offers.id
	 )
SELECT users.id, first_name, last_name, email, 
COUNT(o_id) AS offer_amount, COUNT(cm_id)
	
		FROM offer
		RIGHT JOIN public.users
		ON public.users.id = offer.u_id
			
		GROUP BY users.id, first_name, last_name, email
	    ORDER BY offer_amount DESC;