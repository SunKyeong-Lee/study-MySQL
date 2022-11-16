use sakila;

/* select : 데이터베이스의 테이블 데이터를 가져오는 명령어 */
/* select (칼럼 필드들 또는 *) from 테이블 */
select * from actor;
select first_name, last_name from actor;

/* where을 이용하여 원하는 데이터를 찾아서 볼 수 있다. */
/* where이 하는 일 : 특정한 조건을 가진 데이터를 찾음 */
select * from actor where actor_id= 1;

/* 실습
   select를 이용하여 first_name이 JOE인 사람을 찾기
   select를 이용하여 last_name이 DEAN인 사람을 찾기 *이때 actor_id만 출력하기 */
select * from actor where first_name= "JOE";
select actor_id from actor where last_name= "DEAN";

/* where에 연산자를 넣어서 조건을 만들 수 있다. */
/* 비교연산자 사용 가능 : =, >, <, <=, >= */
select * from actor where actor_id <= 5;

/* IS NULL : null인 데이터를 찾음
   IS NOT NULL : null이 아닌 데이터를 찾음
   IS : 두 개의 값이 같을 때 찾음 (=) 
   IS NOT : 두 개의 값이 같지 않을 때 찾음 */
select * from actor where actor_id IS NULL;
select * from actor where actor_id IS NOT NULL;

/* BETWEEN 최소값 AND 최대값 : 최소값과 최대값 사의의 값을 찾음
   NOT BETWEEN 최소값 AND 최대값 : 최소값보다 작고 최대값보다 큰 값을 찾음 */
select * from actor where actor_id BETWEEN 5 AND 10;

/* IN(찾을 값) : 찾는 값이 있다면 데이터를 찾음(여러 개를 함께 찾음)
   NOT IN(제외할 값) : 제외할 값을 빼고 데이터를 찾음(여러 개 제외 가능) */
select * from actor where last_name in("DEAN", "DAVIS");
select * from actor where last_name not in("DEAN", "DAVIS");

/* 실습
비교연산자 : actor_id가 190 이상인 데이터 출력
IS : last_name이 CHASE인 사람 찾기
BETWEEN : actor_id가 100에서 110인 데이터 출력
IN : first_name이 SUSAN과 NICK인 사람 찾기
*/
select * from actor where actor_id <= 190;
select * from actor where last_name = "CHASE";
select * from actor where last_name = "CHASE" is true;
select * from actor where actor_id between 100 and 110;
select * from actor where first_name in("SUSAN", "NICK");

/* 논리연산자 : &&(and), ||(or), !(not) */
select * from actor where actor_id >= 100 && actor_id <= 110;
select * from actor where actor_id != 1;
select * from actor where actor_id <= 100 || actor_id >= 110;

/* 실습 : actor_id의 1 ~ 5와 195 ~ 200를 출력하기 */
select * from actor where actor_id <= 5 || actor_id >=195;

/* 패턴 매칭 : Like - 특정 패턴의 데이터를 포함해서 찾음 
   와일드 카드 : 문자나 문자열을 대체하기 위해 사용되는 기호 %, _
   % : 0개 이상의 문자를 대체함
   _ : 1개의 문자를 대체함 */
select * from actor where first_name like 'B%';   /* B로 시작하는 모든 데이터를 찾음 */
select * from actor where first_name like '%B';   /* B로 끝나는 모든 데이터를 찾음 */
select * from actor where first_name like '%B%';  /* B가 포함된 모든 데이터를 찾음 */
select * from actor where first_name like 'B___'; /* 언더바 3개 > B로 시작하는 4글자의 데이터를 찾음*/

/* 실습 : last_name 중에서 A가 들어가는 모든 사람을 출력 */
select * from actor where last_name like '%A%'; 

/* LIKE : 한글도 동일하게 검색 가능 */
use book;
select * from Coding;
select * from Coding where Title like '자%';

/* REGEXP : 정규식 - like보다 복잡한 패턴으로 데이터를 찾고싶을 때 사용 */
/* ^ : 뒤에 있는 문자가 문자열의 처음일 때
   + : 앞에 있는 문자가 문자열에서 1번 이상 반복될 때
   문자만 적었을 때 : 해당 문자가 들어가있는 모든 데이터 */
use sakila;

select * from actor where first_name regexp "^B"; /* B로 시작하는 모든 데이터를 찾음 */
select * from actor where last_name regexp "S+";  /* S가 하나 있거나 SS처럼 연달아 있는 모든 데이터를 찾음 */