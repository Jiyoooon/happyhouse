
-- 학교 위치 표시를 위한 데이타 테이블 
create table school_loc(
no				int primary key auto_increment,				
school_id		varchar(30) NOT NULL,				-- 학교 ID
school_name	    varchar(30),						-- 학교 이름
grade			varchar(30),   						-- 초,중,고 구분
state			varchar(30),						-- 국,공,사립 rnqns
head_branch		varchar(30), 						-- 본교,분교 구분
oper_state		varchar(30),						-- 운영중, 휴교중 상태
jibun_addr	varchar(100),			 			-- 지번주소
doro_addr	varchar(100)	,						-- 도로명주소
lat				varchar(30),						-- 위도정보
lng				varchar(30),						-- 경도정보
sido_name		varchar(30), 						-- 시도 이름
gugun_name		varchar(30), 						-- 구군 이름
dong			varchar(30)	);						-- 동이름

