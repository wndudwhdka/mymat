CREATE TABLE member (
	member_id	varchar2(20) primary key,
	member_pw	varchar2(20) NOT NULL,
	member_nick	varchar2(30) NOT NULL,
	member_email	varchar2(50) NULL
);

create table attachment(
    attachment_no number primary key,
    attachment_name varchar2(30),
    attachment_type varchar2(20),
    attachment_size number
);

create table member_profile_image(
    attachment_no references attachment(attachment_no) on delete cascade,
    member_id references member(member_id) on delete cascade
);

create table post(
    post_no number primary key,
    member_id references member(member_id) on delete cascade,
    post_view number default 0,
    post_time timestamp default current_timestamp,
    post_content varchar2(3000),
    post_title varchar2(100) not null
);

create table post_image(
    attachment_no number references attachment(attachment_no) on delete cascade,
    post_no number references post(post_no) on delete cascade
);

create table commnet(
    comment_no number primary key,
    post_no number references post(post_no) on delete cascade,
    member_id varchar2(20),
    comment_time timestamp default current_timestamp,
    comment_group_no number    
);

create table matjyp(
    member_id varchar2(20) primary key,
    matjyp_location varchar2(150)
);
