-- Table: public.categories

-- DROP TABLE public.categories;

CREATE TABLE IF NOT EXISTS public.categories
(
    id integer NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    picture character varying(100) COLLATE pg_catalog."default",
    slug character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT categories_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.categories
    OWNER to postgres;