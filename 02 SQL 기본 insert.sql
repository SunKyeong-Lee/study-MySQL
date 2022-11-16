/*
	database Book을 만들고, table Coding 만들기
    칼럼의 필드값: ID(int), Title(varchar), Author(varchar), Page(int)
*/

create database Book;
use Book;
create table Coding (
	ID int,
    Title varchar(10),
    Author varchar(10),
    Page int
);

insert into Coding (ID, Title, Author, Page) values (1, "SQL", "green", 300);
insert into Coding (ID, Title,Author, Page) value (2, "JS", "홍길동", 350);
select * from Coding;

/* insert를 이용해서 원하는 칼럼의 필드값에만 값을 넣어줄 수 있다.
   그럴 경우, 값을 넣지 않은 필드는 null 값을 갖는다. */
insert into Coding (ID, Title, Page) value (3, "자바", 350);

/* update를 통해 데이터의 필드값을 바꿔줄 수 있다. 
   where을 통해서 원하는 데이터의 상태를 설정해서 찾아줄 수 있다. */
update Coding set Author = "성춘향" where Title = "자바";

/* update를 사용할 때 where을 사용하지않고 실행하면 모든 데이터의 필드값이 바뀐다. */
update Coding set Page= 600;

/* delete를 이용해서 데이터를 삭제
   이때 where을 사용하여 원하는 데이터 선택 */
delete from Coding where ID =3;

/* where 없이 작성하게 되면 안에 있는 모든 데이터가 삭제된다. */
delete from Coding;

/* 실습 : 위에 작성한 insert를 통해 값을 넣어준 후
   id가 1인 page를 100으로 업데이트하고, author가 홍길동인 데이터를 삭제하기 */
update Coding set Page = 100 where ID = 1;
delete from Coding where Author = "홍길동";
select * from Coding;
