-- Table: public.category_offer

-- DROP TABLE public.category_offer;

CREATE TABLE IF NOT EXISTS public.category_offer
(
    category_id integer NOT NULL,
    offer_id integer NOT NULL,
    CONSTRAINT category_offer_pkey PRIMARY KEY (category_id, offer_id),
    CONSTRAINT category_offer_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.categories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT category_offer_offer_id_fkey FOREIGN KEY (offer_id)
        REFERENCES public.offers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.category_offer
    OWNER to postgres;