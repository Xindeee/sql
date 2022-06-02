CREATE DATABASE kano
  WITH ENCODING='UTF8'
       OWNER=postgres
       LC_COLLATE='Russian_Russia.1251'
       LC_CTYPE='Russian_Russia.1251'
       CONNECTION LIMIT=-1;

CREATE TABLE answer		-- ответ по одной функции/характеристике
(
  id serial,
  pass_id integer,		-- >> прохождение опроса
  function_id integer,	-- >> функция/характеристика
  importance integer,	-- важность
  presence integer,		-- удовлетворенность наличием
  absence integer,		-- неудовлетворенность отсутствием
  CONSTRAINT answer_pkey PRIMARY KEY (id)
);
ALTER TABLE answer OWNER TO postgres;
	   
CREATE TABLE category   -- категория пользователей
(
  id serial,
  poll_id integer,		-- >> опрос
  title text,			-- >> название категории
  CONSTRAINT category_pkey PRIMARY KEY (id)
);
ALTER TABLE category OWNER TO postgres;
	   
CREATE TABLE function	-- функция/характеристика системы
(
  id serial,
  poll_id integer,		-- >> опрос
  title text,			-- название функции/характеристики
  comment text,			-- комментарий
  CONSTRAINT function_pkey PRIMARY KEY (id)
);
ALTER TABLE function OWNER TO postgres;
	   
CREATE TABLE invitation	-- приглашение пройти опрос
(
  id serial,
  poll_id integer,		-- >> опрос
  category_id integer,	-- >> категория пользователя
  login text,			-- логин (если персональная ссылка, но все равно пока не поддерживается)
  need_auth boolean,	-- требуется авторизация
  personal boolean,		-- персональная ссылка (одноразовая)
  token text,			-- публичный токен
  CONSTRAINT invitation_pkey PRIMARY KEY (id)
);
ALTER TABLE invitation OWNER TO postgres;
	   
CREATE TABLE passing	-- проход опроса
(
  id serial,
  poll_id integer,		-- >> опрос
  invite_id integer,	-- >> приглашение
  login text,			-- логин пользователя
  fio text,				-- ФИО 
  comment text,			-- комментарий
  pass_time timestamp with time zone,	-- время прохождения опроса
  CONSTRAINT passing_pkey PRIMARY KEY (id)
);
ALTER TABLE passing OWNER TO postgres;
	   
CREATE TABLE poll		-- опрос
(
  id serial,
  title text,			-- название
  open boolean,			-- статус (открыто/закрыто)
  owner text,			-- владелец (логин)
  CONSTRAINT poll_pkey PRIMARY KEY (id)
);
ALTER TABLE poll OWNER TO postgres;

