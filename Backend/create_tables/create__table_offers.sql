-- Table: public.offers

-- DROP TABLE public.offers;

CREATE TABLE IF NOT EXISTS public.offers
(
    id integer NOT NULL,
    created_at timestamp with time zone,
    offer_type character varying COLLATE pg_catalog."default",
    title character varying COLLATE pg_catalog."default",
    full_text character varying COLLATE pg_catalog."default",
    price numeric,
    picture character varying(100) COLLATE pg_catalog."default",
    user_id integer,
    CONSTRAINT offers_pkey PRIMARY KEY (id),
    CONSTRAINT offers_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.offers
    OWNER to postgres;