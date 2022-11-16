/* 테이블을 생성할때 칼럼의 필드의 자료형*/
/*
숫자 타입
정수형 : (기본)int, tinyint, smallint, mediumint, bigint
실수형(부동소수점) : float(소수부분을 포함한 자리수,실수의 자리수), 
				 double(소수부분을 포함한 자리수,실수의 자리수)
고정 소수점 : decimal(소수부분을 포함한 자리수, 소수의 자리수)
*/

/*
문자열 타입
char(30) : 항상 30바이트를 차지, 
varchar(30) : var(값에 따라서 공간이 변함) 
			  안에 값이 다 차지하지않는다면, 그 공간만 준다.
			  (30)영문의 개수 - 한글의 개수는 영문의 2개를 차지 
              30을 적어주면 영어는 30개, 한글은 15개만 들어갈 수 있다.
text : 값이 얼마나 들어올지 모를때 사용
blob(Binary Large Object) : 다양한 크기의 바이너리 데이터를 저장
							글자가 아닌 이미지, 음악, 영상 등을 저장할때 사용
*/

/*
날짜와 시간 타입
timestamp : 날짜와 시간을 나타내는 타임
			사용자가 입력해주지 않으면 현재 시간으로 저장
date : 날짜를 저장 (2022-11-14)
datetime : 날짜와 시간을 함께 저장 (2022-11-14 15:27:11)
*/

/*
영화 평점 데이터 베이스
database : movie
table : movierate
필드 : id(int), title(varchar(100)), rate(float(3,1)),
	  image(blob), time(timestamp)
*/
create database movie;
use movie;
create table movierate(
	Id int,
    Title varchar(100),
    rate float(3, 1),
    image blob,
    time timestamp
);

insert into movierate(Id, Title, rate, time) values(1, "공조", 9.6, "2022-11-14 15:41:00");
select * from movierate;

/* 실습 : 원하는 영화의 이름과 평점과 현재 시간을 넣기 */
insert into movierate(Id, Title, rate, time) values (2, "반지의제왕", 9.2, now());