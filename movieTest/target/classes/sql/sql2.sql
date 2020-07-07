CREATE TABLE customer (ID varchar2(50), password varchar2(50), name varchar2(50), phone varchar2(20), gender varchar2(20) , birth varchar2(30) , mail varchar2(50) , zipcode varchar2(10) , address varchar2(100) , addressdetail varchar2(150) , extraAddress varchar2(100) , regdate date DEFAULT sysdate);
CREATE TABLE admin (ID varchar2(50) , password varchar2(50) , name varchar2(50));
CREATE TABLE theater (theater_code varchar2(10) , theater_name varchar2(30) , theater_area varchar2(30) );
CREATE TABLE screen (screen_code varchar2(10) , screen_name varchar2(20) , theater_code varchar2(3) , seat_code varchar2(16) , seats_total number(3) , screen_price number(10) );
CREATE TABLE timetable (timetable_code varchar2(10) , m_code varchar2(10) , theater_code varchar2(10) , screen_code varchar2(10) , screening_date date , start_time date , end_time date , m_name varchar2(50) , m_poster varchar2(50) , theater_name varchar2(30) , theater_area varchar2(20) , screen_name varchar2(20) );
CREATE TABLE movies (m_code varchar2(10) , m_name varchar2(50) , m_director varchar2(20) , m_actor varchar2(100) , m_company varchar2(50) , m_time varchar2(20) , m_playDate varchar2(30) , m_description clob ,  m_posterImg  varchar2(100) );
CREATE TABLE booking (booking_code varchar2(10) , customer_ID varchar2(50) , m_name varchar2(20) , theater_name varchar2(30) , screen_name varchar2(20) , seat_code varchar2(50) , seats_num number(2) , screening_date date , book_date date DEFAULT sysdate , booking_price number(10) DEFAULT 0 );
CREATE TABLE seat (seat_code varchar2(10), timetable_code varchar2(10), booking_code varchar2(20) , movie_code varchar2(10), theater_code varchar2(10), screen_code varchar2(10), isbooked number(1) DEFAULT 0);

INSERT INTO customer(ID, password, name, phone, gender, birth, mail, zipcode, address, addressdetail, extraAddress, regdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO admin(ID, password, name) VALUES (?, ?, ?);
INSERT INTO theater(theater_code, theater_name, theater_area) VALUES (?, ?, ?);
INSERT INTO screen(screen_code, screen_name, theater_code, seat_code, seats_total, screen_price) VALUES (?, ?, ?, ?, ?, ?);
INSERT INTO timetable(timetable_code, m_code, theater_code, screen_code, screening_date, start_time, end_time, m_name, m_poster, theater_name, theater_area, screen_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO movies(m_code, m_name, m_director, m_actor, m_company, m_time, m_playDate, m_description, m_poster) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO booking(booking_code, customer_ID, m_name, theater_name, screen_name, seat_code, seats_num, screening_date, book_date, booking_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO seat(seat_code, timetable_code, booking_code, movie_code, theater_code, screen_code, isbooked) VALUES (?, ?, ?, ?, ?, ?, ?);

select * from customer;
select * from admin;
select * from theater;
select * from screen;
select * from timetable;
select * from movies;
select * from booking;
select * from seat;

DROP table customer CASCADE CONSTRAINTS;

drop table customer;
drop table admin;
drop table theater;
drop table screen;
drop table timetable;
drop table movies;
drop table booking;
drop table seat;