/*
제약조건 : 데이터를 입력 받을때 실행되는 검사 규칙
> create로 생성해줄 때 함께 추가

NOT NULL : 값에 빈 값이 들어갈 수 없음
UNIQUE : 중복된 값을 사용할 수 없음
PRIMARY KEY : not null과 unique의 특징을 모두 가진 키 - 테이블당 하나
			  데이터를 찾을 때 사용, 업데이트 및 삭제시에 사용
FOREIGN KEY : 다른 테이블과 연결 > join
DEFAULT : 해당 필드의 기본값 설정
*/

/* 영화 정보 테이블 id(primary key), title(not null), detail */
create table movieinfo(
	Id int primary key,
    title varchar(100) not null,
    detail text
);
insert into movieinfo values (1, "공조", "영화입니다");
select * from movieinfo;
insert into movieinfo values (2, "반지의 제왕", "새로운 영화입니다");

/* 실습 : 영화배우(movieactor) 테이블을 생성하기
   id(pk), name(nn), movie
   원하는 값 추가 후 확인하기 : 1, 유해진, 공조 */
create table movieactor(
	id int primary key,
    name varchar(20) not null,
    movie varchar(100) 
);

insert into movieactor values (1, "유해진", "공조");
insert into movieactor(id, name) values (3, "홍길동");
select * from movieactor;

/* 제약조건을 alter를 이용해서 기존의 필드에 추가하기 */
alter table movieactor alter movie set default "없음";

/* 제약조건을 alter를 이용해서 새로운 필드 추가하기 */
alter table movieactor add regist timestamp default current_timestamp;
insert into movieactor(id, name, movie) values (4, "성춘향", "춘향전");

/* movierate 테이블의 time 필드에 alter를 이용하여 
   default 제약조건을 추가하세요 - 0; */
alter table movierate alter rate set default 0;
/* modify를 이용한 수정은 가능 */
alter table movierate modify time timestamp default current_timestamp;

select * from movierate;
insert into movierate(id, Title) values (3, "해리포터");
