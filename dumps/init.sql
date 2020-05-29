

CREATE DATABASE employee;

 

CREATE SEQUENCE public.employees_id_seq

    INCREMENT 1

    START 1

    MINVALUE 1

    MAXVALUE 9223372036854775807

    CACHE 1;

              

CREATE TABLE public.employee

(

    id bigint NOT NULL DEFAULT nextval('employees_id_seq'::regclass),

    email_address character varying(255) COLLATE pg_catalog."default" NOT NULL,

    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,

    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,

    CONSTRAINT employees_pkey PRIMARY KEY (id)

)

WITH (

    OIDS = FALSE

)

TABLESPACE pg_default;

 

 

INSERT INTO public.employee(

               email_address, first_name, last_name)

               VALUES ('ankit_lawaniya@optum.com', 'Ankit', 'Lawaniya');

 
