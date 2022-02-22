
WITH categ
AS(

SELECT offers.id as id, offers.title as offer_title, user_id, price, categories.title AS categories_title,  
(CASE  WHEN offer_type = 'buy' THEN 'Куплю' WHEN offer_type ='sell' THEN  'Продам' END ) AS o
	
	FROM public.categories
	     INNER JOIN public.category_offer
	     ON public.categories.id = public.category_offer.category_id
		 RIGHT JOIN public.offers
	     ON public.offers.id = public.category_offer.offer_id
         ORDER BY id DESC 

	),	
	cat AS(
	 SELECT id, offer_title, user_id, price,o, 
LEAD(id) OVER (ORDER BY  id) - (id)	AS r, categories_title
		
	FROM categ
		GROUP BY id, offer_title, user_id, price,o, categories_title
	 ),
	 c AS (
	
	 SELECT DISTINCT(id) AS id, offer_title, user_id, price,o, 
	 
	 
(CASE WHEN r=0 THEN  
                   CONCAT(categories_title,', ',
	               LEAD(categories_title) OVER (ORDER BY  id))			   
	  
      WHEN (r>0 OR r is NULL) AND LAG(r)OVER(ORDER BY id)=0 
               THEN   CONCAT(LAG(categories_title) OVER (ORDER BY  id),
				   ', ',categories_title)
 
      WHEN r>0 OR r is NULL 
               THEN categories_title  END ) AS categories_title
	  FROM cat
      ORDER BY id DESC
		 
		 ),
		 ct AS(
		 
		 SELECT id, offer_title, user_id, price,o, 
LEAD(id) OVER (ORDER BY  id) - (id)	AS r, categories_title
		
	FROM c
		GROUP BY id, offer_title, user_id, price,o, categories_title
	 
	  )
	SELECT DISTINCT(id) AS id, offer_title, user_id, price,o, 
	 
	 
(CASE WHEN r=0 THEN  
                   CONCAT(categories_title,', ',
	               LEAD(categories_title) OVER (ORDER BY  id))			   
	  
      WHEN (r>0 OR r is NULL) AND LAG(r)OVER(ORDER BY id)=0 
               THEN  CONCAT(LAG(categories_title) OVER (ORDER BY  id),
				   ', ',categories_title)
 
      WHEN r>0 OR r is NULL 
               THEN categories_title  END ) AS categories
	  FROM ct
      ORDER BY price DESC;



