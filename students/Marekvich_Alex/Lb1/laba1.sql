create table budget(
  id integer primary key,
  Familiya varchar(50),
  Imya varchar(50),
  Otchestvo varchar(50),
  INN integer,
  BIC integer,
  summa integer
);

create table depozit(
  id integer primary key,
  Familiya varchar(50),
  Imya varchar(50),
  Otchestvo varchar(50),
  INN integer,
  BIC integer,
  summa integer
);

create table rasschet(
  id integer primary key,
  Familiya varchar(50),
  Imya varchar(50),
  Otchestvo varchar(50),
  INN integer,
  BIC integer,
  summa integer
);

create table Accounts
(
  FIO varchar(50),
  id integer primary key,
  id_bud integer REFERENCES budget(id) NOT NULL,
  id_dep integer REFERENCES depozit(id) NOT NULL,
  id_ras integer REFERENCES rasschet(id) NOT NULL
 );
create table fiz_Users
(
  id integer primary key,
  Familiya varchar(50),
  Imya varchar(50),
  Otchestvo varchar(50), 
  id_Account integer REFERENCES Accounts(id) NOT NULL
);

create table Ur_Users(
  id integer primary key, 
  Familiya varchar(50),
  Imya varchar(50),
  Otchestvo varchar(50),
  id_Account integer REFERENCES Accounts(id) NOT NULL
);

create table Bang
(
	Vladelec varchar(50),
	id integer primary key,
	id_fiz_User integer REFERENCES fiz_Users(id) not null,
  	id_Ur_User integer references Ur_Users(id) not null,
  	id_Account integer references Accounts(id) not Null
)
