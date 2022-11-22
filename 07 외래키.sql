/*
관계형 데이터베이스
primary key를 이용해서 테이블에서 원하는 데이터를 찾아낼 수 있고
foreign key를 이용해서 다른 테이블과 연결할 수 있다.
*/
/*
foreign key를 확인하기 위한 2개의 테이블
test 데이터베이스 생성
testtable1 테이블 1개 생성 id(int) text(varchar(30)) 
texttable2 테이블 1개 생성 myid(int) parenteid(int) - foreign key
*/
create database test;
use test;
create table testtable1 (
	id int primary key,
    text text
);
/*
foreign key는 외부데이블의 컬럼과 연결할 수 있게 작성한다.
foreign key(현재 테이블에서 필드) : 현재 테이블에서 연결한 칼럼(필드) 값
references testtable1(필드) : 외부 테이블에서 연결할 칼럼(필드) 값, PK값만 연결 가능
on update cascade : 외부 테이블에서 업데이트 될 때 같이 업데이트
*/
create table testtable2 (
	myid int primary key,
    parenteid int,
    foreign key(parenteid) references testtable1(id) on update cascade
);

insert into testtable1 values (1, "첫번째 값입니다");
insert into testtable1 values (2, "두번째 값입니다");
select * from testtable1;
select * from testtable2;
insert into testtable2 values (1, 1);
insert into testtable2 values (2, 1); /* testtable1에 있는 값만 넣을 수 있음 */

/* 
실습 testtable3 생성
id(int), name(varchar()), parentid(int / testtable1의 id를 foreign key)
insert를 통해 값이 들어가는지 확인
*/
create table testtable3 (
	id int,
    name varchar(30),
    parentid int,
    foreign key(parentid) references testtable1(id) on update cascade
);
select * from testtable3;
insert into testtable3 values (3, "성춘향", 4);

/* on update, on delete 에 따른 foreign key 값의 변화 */
/* on update와 on delete 뒤에 작성해 줄 수 있는 내용
cascade : 연결되어있는 외부 테이블의 값이 바뀌면 FK의 값도 바뀐다.
		  *값이 삭제될 경우 관련 데이터가 삭제된다.
set null : 연결되어있는 외부 테이블의 값이 바뀌거나 삭제되면 FK가 null로 바뀐다.
no action : 연결되어있는 값이 바뀌거나 수정되어도 값이 그대로이다.
set default : 연결되어있는 외부 테이블의 값이 바뀌거나 삭제되면 FK가 default값으로 바뀐다.
*/

/* testtable1의 id값을 수정하고, testtable2의 parentid값 확인 */
update testtable1 set id = 4 where id = 1;
select * from testtable1;
select * from testtable2;
delete from testtable1 where id = 4;

/* 
FK를 이용해서 외부 테이블과 연결해서 사용할 수 있다.
연결해서 사용한 테이블들을 함께 select해서 출력하기위해 join을 사용할 수 있다.
* testtable1과 testtable2를 join을 통해서 함께 출력 - (id, text) (myid, parentid) 
*/
/* inner join : on에 작성된 조건을 만족하는 데이터만 들고옴 */
select * from testtable1 inner join testtable2 on testtable1.id = testtable2.parentid;

/* testtable3을 inner join을 통해서 출력하세요 */
select * from testtable1 inner join testtable3 on testtable1.id = testtable3.parentid;
insert into testtable3 values (3, "흥부", 2);
