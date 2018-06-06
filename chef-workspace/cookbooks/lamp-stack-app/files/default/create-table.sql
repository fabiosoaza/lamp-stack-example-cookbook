create table clients (
    id char (36) NOT NULL,
    primary key(id),
    first_name varchar(64),
    last_name  varchar(64),
    email varchar(64)
);