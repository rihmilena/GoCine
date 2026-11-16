-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.usuarios (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  email text NOT NULL UNIQUE,
  senha text NOT NULL,
  data_cadastro timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);
CREATE TABLE public.avaliacoes (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  usuario_id bigint NOT NULL,
  filme_api_id integer NOT NULL,
  nota numeric NOT NULL,
  comentario text,
  data_criacao timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT avaliacoes_pkey PRIMARY KEY (id),
  CONSTRAINT avaliacoes_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id)
);
CREATE TABLE public.watchlist (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  usuario_id bigint NOT NULL,
  filme_api_id integer NOT NULL,
  data_adicionado timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT watchlist_pkey PRIMARY KEY (id),
  CONSTRAINT watchlist_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id)
);
CREATE TABLE public.historico (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  usuario_id bigint NOT NULL,
  filme_api_id integer NOT NULL,
  data_assistido timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT historico_pkey PRIMARY KEY (id),
  CONSTRAINT historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id)
);
CREATE TABLE public.user_library (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  item_id bigint NOT NULL,
  type text NOT NULL,
  list_name text NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  CONSTRAINT user_library_pkey PRIMARY KEY (id)
);
