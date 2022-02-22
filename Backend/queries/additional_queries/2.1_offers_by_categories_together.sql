WITH c AS(

SELECT offers.id as id, offers.title as offer_title, user_id, price,   
(CASE  WHEN offer_type = 'buy' THEN 'Куплю' WHEN offer_type ='sell' THEN  'Продам' END ) AS offer_type,

categories.title AS categories_title
	
	FROM public.categories
	     INNER JOIN public.category_offer
	     ON public.categories.id = public.category_offer.category_id
		 RIGHT JOIN public.offers
	     ON public.offers.id = public.category_offer.offer_id
         ORDER BY id DESC 
), cat AS(
SELECT id, offer_title, user_id, price, offer_type, categories_title ,
LAG(categories_title) OVER(PARTITION BY id) AS lag, LEAD(categories_title) OVER(PARTITION BY id) AS lead
FROM c
	), ca AS (
	SELECT id, categories_title,  user_id, price, offer_type, offer_title,   lag, lead,

	(CASE WHEN lag IS NOT NULL THEN CONCAT(categories_title,', ',LAG(categories_title) OVER (ORDER BY  id))
	      WHEN lead IS NOT NULL THEN CONCAT(categories_title,', ',LEAD(categories_title) OVER (ORDER BY  id))
	      WHEN lag IS NULL OR lead IS NULL THEN categories_title END) AS cases
	 
		  FROM cat)
	SELECT id, offer_title, user_id, offer_type, price, cases AS categories
	FROM ca 
	ORDER BY price DESC;
	  
		  
	
	