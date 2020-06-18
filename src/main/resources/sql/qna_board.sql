create table qna_board (
       qna_no	INT auto_increment comment '질문번호',
       qna_title VARCHAR(300) not null comment '질문제목',
       qna_content VARCHAR(4000) not null comment '질문내용',
       qna_userid VARCHAR(20) not null comment '질문자아이디',
       qna_datetime timestamp DEFAULT CURRENT_TIMESTAMP comment '질문일시',
       reply_content VARCHAR(4000)  comment '답변내용',
       reply_datetime timestamp  comment '답변일시',	
       reply_userid VARCHAR(20) comment '답변자아이디',
       PRIMARY KEY (`qna_no`),
       CONSTRAINT `qna_to_user_fk1` FOREIGN KEY (`qna_userid`) REFERENCES `member` (`userid`),
       CONSTRAINT `qna_to_user_fk2` FOREIGN KEY (`reply_userid`) REFERENCES `member` (`userid`)
   ) comment = '질문게시판';
   
   insert into qna_board(qna_title, qna_content, qna_userid) 
   values('관통 테스트1', '뷰로 만드는 질문게시판1', 'ssafy'),
         ('관통 테스트2', '뷰로 만드는 질문게시판2', 'ssafy');

   commit;