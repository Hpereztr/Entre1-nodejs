-- ===== DATABASE CREATION ===== --

create database blog_db;


-- ===== TABLE USERS ===== --

create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(80)
);

insert into users (first_name, last_name, email) values
('Harlinson', 'Perez', 'harlinson@gmail.com'),
('Carlos', 'Parra', 'carlos@gmail.com'),
('Luis', 'Castro', 'luis@hotmail.com');


-- ===== TABLE POST ===== --

create table posts (
	id serial primary key,
	creator_id int references users(id),
	tittle varchar(100),
	text text
);


insert into posts (creator_id, tittle, text) values
(1, 'PostgreSQL: Robust Database Solution.', 'Scalability, reliability, and optimal performance for critical applications.'),
(1, 'Boost PostgreSQL Performance Easily.', 'Optimize queries and configurations for smoother operation.'),
(2, 'Seamless Migration to PostgreSQL.', 'Transfer data hassle-free and leverage its full potential.'),
(3, 'PostgreSQL vs. Others: Choose Power.', 'A revealing comparison highlighting its distinctive advantages.'),
(3, 'Secure Data with PostgreSQL Implementation.', 'Implement robust measures to effectively safeguard your information.');



-- ===== PIVOT TABLE LIKES ===== --

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values
(2,3),
(1,4),
(3,5),
(1,1),
(2,2);

-- ===== SELECT POSTS CREATORS===== --

SELECT P.tittle, P.text, U.first_name ||' '|| U.last_name AS creator, U.email FROM posts P
inner join users U on P.creator_id = U.id;

-- ===== SELECT POSTS LIKES===== --

SELECT P.tittle, P.text, U.first_name ||' '|| U.last_name AS user_like, U.email FROM posts P
inner join likes L on L.post_id = P.id
inner join users U on L.user_id = U.id;