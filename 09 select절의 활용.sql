/* select 절을 사용한 데이터베이스의 데이터 확인 */
/*
1. select * from 테이블;
2. select 출력할 필드 from 테이블;
3. select * from 테이블 where 조건;
4. select * from 테이블 where 조건 중 패턴매칭(like);
*/
/*
그 외의 select 절에 사용할 수 있는 키워드
1. distinct : 필드 앞에 작성해서 중복되는 값 제거
2. order by : 원하는 칼럼의 글자, 숫자 순으로 나열
*/
use sakila;
select * from customer;
select distinct store_id from customer;

/* 실습 : sakila 데이터베이스의 city 테이블에서 country_id의 종류 확인하기 */
select * from city;
select distinct country_id from city;

/* order by를 통한 정렬 : asc 오름차순으로 정렬(기본) / desc 내림차순 */
select * from customer order by first_name;
select * from customer order by first_name desc;
select * from customer order by store_id, first_name;
select * from customer order by store_id desc, first_name;

/* 실습 : active를 오름차순으로 정렬한 후 create_date를 내림차순으로 정렬
		 last_name를 오름차순으로 정렬한 후 fisrt_name를 오름차순으로 정렬 */
select * from customer order by active asc, create_date desc;
select * from customer order by last_name, first_name;

/* limit을 이용해서 원하는 범위만 출력할 수 있다. */
/* limit 시작위치(0~), 출력 개수 */
select * from customer limit 0, 3;

/* create_date를 오름차순으로 정렬하고 first_name을 오름차순으로 정렬한 후 
   가장 위에 있는 10개만 출력 */ 
select * from customer order by create_date, first_name limit 0, 10;

/* create_date를 오름차순으로 정렬하고 first_name을 오름차순으로 정렬한 후 
   가장 위에 있는 10개만 출력 + where를 통해 store_id값이 1인 내용 만 출력 */
select * from customer where store_id = 1 order by create_date, first_name limit 0, 10;

/* customer_id 가 100 보다 큰 데이터를 last_name으로 내림차순으로 정렬
   + limit를 통해서 30개만 출력 */
select * from customer where customer_id > 100 order by last_name desc limit 0, 30;

/* min(), max() 함수를 활용해서 각 필드에서 가장 큰 값과 작은 값을 가져올 수 있다. */
/* as 를 통해서 컬럼 이름을 바꿔서 출력할 수 있다. */
select min(customer_id) from customer;
select min(customer_id) as min_id from customer;
select max(create_date) from customer;
select * from film;
select max(length), title from film;

/* 실습
1. film 테이블에서 (length)길이가 작은 영화의 제목을 출력
2. film 테이블에서 replacement_cost가 가장 큰 값을 출력
3. film의 rental_rate가 3이상인 영화 중에 lenght가 가장 작은 것부터 정렬하여 영화제목과 length 5개를 출력
*/
select min(length), title from film;
select * from film where length = 46;
select max(replacement_cost) from film;
select * from film where replacement_cost = 29.99;
select title, length from film where rental_rate >= 3 order by length limit 0, 5;

/* 
count():현재 칼럼의 데이터 개수 - count( distinct 필드 ) 중복제거
avg() : 안에 있는 값들의 평균 
sum() : 안에 있는 값들의 총합
*/
select count(distinct length) from film;
select avg(length) as "평균길이" from film;
select sum(length) as "전체길이의 합" from film;

/* 실습 
count()를 이용하여 rental_duration의 종류가 몇 개가 되는지 출력하기
avg()를 이용하여 rental_duration의 평균을 구하기
sum()을 이용하여 rental_duration의 합계를 구하기
*/
select count(distinct rental_duration) from film;
select avg(rental_duration) from film;
select sum(rental_duration) from film;
