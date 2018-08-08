CREATE DATABASE myself;

CREATE TABLE t_account (
    id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR(100) DEFAULT NULL,
    password VARCHAR(150) DEFAULT NULL,
    status BOOLEAN DEFAULT TRUE
);

CREATE TABLE t_permission (
    id SERIAL PRIMARY KEY NOT NULL,
    permission VARCHAR(100),
    status BOOLEAN DEFAULT TRUE
);

CREATE TABLE t_role (
    id SERIAL PRIMARY KEY NOT NULL,
    role VARCHAR(100),
    status BOOLEAN DEFAULT TRUE
);

CREATE TABLE t_role_permission (
    id SERIAL PRIMARY KEY NOT NULL,
    permission_id INT NOT NULL REFERENCES t_permission(id),
    role_id INT NOT NULL REFERENCES t_role(id)
);

CREATE TABLE t_user (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(150),
    last_name VARCHAR(150),
    cellphone_number VARCHAR(15),
    image_url VARCHAR(100),
    account_id INT NOT NULL REFERENCES t_account(id),
    role_id INT NOT NULL REFERENCES t_role(id)
);

CREATE TABLE t_post (
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(150),
    content TEXT,
    create_date VARCHAR(100),
    status BOOLEAN DEFAULT TRUE,
    user_id INT NOT NULL REFERENCES t_user(id)
);