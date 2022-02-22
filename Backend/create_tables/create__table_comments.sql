-- Table: public.comments

-- DROP TABLE public.comments;

CREATE TABLE IF NOT EXISTS public.comments
(
    id integer NOT NULL,
    created_at timestamp with time zone,
    user_id integer,
    offer_id integer,
    comment_text character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT comments_pkey PRIMARY KEY (id),
    CONSTRAINT comments_offer_id_fkey FOREIGN KEY (offer_id)
        REFERENCES public.offers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.comments
    OWNER to postgres;