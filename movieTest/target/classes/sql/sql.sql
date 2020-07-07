CREATE TABLE customer (ID varchar2(50) NOT NULL, password varchar2(50) NOT NULL, passwordConfirm varchar2(50) NOT NULL, name varchar2(50) NOT NULL, phone varchar2(20) NOT NULL, gender varchar2(20) NOT NULL, birth varchar2(30) NOT NULL, mail varchar2(50) NOT NULL, zipcode varchar2(10) NOT NULL, address varchar2(100) NOT NULL, addressdetail varchar2(150) NOT NULL, extraAddress varchar2(100) NOT NULL, regdate date NOT NULL, CONSTRAINT ID PRIMARY KEY (ID));
CREATE TABLE admin (ID varchar2(50) NOT NULL, password varchar2(50) NOT NULL, name varchar2(50) NOT NULL, power number(10) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE theater (theater_code varchar2(10) NOT NULL, theater_name varchar2(30) NOT NULL, theater_area varchar2(30) NOT NULL, screen_name varchar2(30) NOT NULL, seat_code varchar2(10) NOT NULL);
CREATE TABLE screen (screen_code varchar2(10) NOT NULL, screen_name varchar2(20) NOT NULL, theater_code varchar2(3) NOT NULL, seat_code varchar2(16) NOT NULL, seats_total number(3) NOT NULL, screen_price number(10) NOT NULL);
CREATE TABLE timetable (timetable_code varchar2(10) NOT NULL, m_code number(10) NOT NULL, theater_code varchar2(10) NOT NULL, screening_date date NOT NULL, start_time date NOT NULL, end_time date NOT NULL, m_name varchar2(50) NOT NULL, m_poster varchar2(50) NOT NULL, theater_name varchar2(30) NOT NULL, theater_area varchar2(20) NOT NULL, screen_name varchar2(20) NOT NULL);
CREATE TABLE movies (m_code varchar2(10) NOT NULL, m_name varchar2(50) NOT NULL, m_director varchar2(20) NOT NULL, m_actor varchar2(100) NOT NULL, m_company varchar2(50) NOT NULL, m_time varchar2(20) NOT NULL, m_playDate varchar2(30) NOT NULL, m_description clob NOT NULL, m_poster varchar2(50) NOT NULL);
CREATE TABLE booking (booking_code varchar2(10) NOT NULL, customer_ID varchar2(50) NOT NULL, customer_name varchar2(50) NOT NULL, m_name varchar2(20) NOT NULL, theater_name varchar2(30) NOT NULL, screen_name varchar2(20) NOT NULL, seat_code varchar2(10) NOT NULL, seats_num number(2) NOT NULL, screening_date date NOT NULL, book_date date DEFAULT sysdate NOT NULL, booking_price number(10) DEFAULT 0 NOT NULL);
CREATE TABLE seat (seat_code varchar2(10), timetable_code varchar2(10), booking_code varchar2(20) NOT NULL, movie_code varchar2(10), theater_code varchar2(10), screen_code varchar2(10), isbooked number(1) DEFAULT 0);
CREATE TABLE seat (seat_Code varchar2(10) NOT NULL, seat clob NOT NULL);

INSERT INTO customer(ID, password, name, phone, gender, birth, mail, zipcode, address, addressdetail, extraAddress, regdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO admin(ID, password, name) VALUES (?, ?, ?);
INSERT INTO theater(theater_code, theater_name, threater_area, screen_name) VALUES (?, ?, ?, ?);
INSERT INTO screen(screen_code, screen_name, theater_code, seat_code, seats_total, screen_price) VALUES (?, ?, ?, ?, ?, ?);
INSERT INTO timetable(timetable_code, m_code, theater_code, screening_date, start_time, end_time, m_name, m_poster, theater_name, theater_area, screen_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO movies(m_code, m_name, m_director, m_actor, m_company, m_time, m_playDate, m_description, m_poster) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO booking(booking_code, customer_ID, customer_name, m_name, theater_name, screen_name, seat_code, seats_num, screening_date, book_date, booking_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO seat(seat_code, timetable_code, booking_code, movie_code, theater_code, screen_code, isbooked) VALUES (?, ?, ?, ?, ?, ?, ?);
INSERT INTO seat(seat_code, seat) VALUES (?, ?);

select * from admin;
select * from timetable;
select * from movies;
select * from customer;
select * from theater;
select * from TIMETABLE;
drop table customer;
drop table admin;
drop table theater;
drop table seat;
select * from seat;
select * from THEATER;
delete from seat where seat_code = 'S854412';

리뷰테이블 생성
create table review1(
	ID varchar2(50) NOT NULL,
	m_code varchar2(20) not null,
	review_num number(10) not null,
	content clob not null,
	star number(10) not null,
	regist_day varchar2(20) not null
);

select * from review1;
drop table review1;

select avg(star) from review1;
select count(*) from review1;
select round(AVG(star), 2) from review1 where m_code = 'M777530';


