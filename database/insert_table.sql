use jspservletjdbc;

insert into role(code,name) values('ADMIN','Quản Trị');
insert into role(code,name) values('USER','Người Dùng');

insert into user(username,password,fullname,status, roleid) values('admin','123456','admin',1,5);
insert into user(username,password,fullname,status, roleid) values('nguyenvana','123456','nguyen van a',1,6);
insert into user(username,password,fullname,status, roleid) values('nguyenvanb','123456','nguyen van b',1,6);

insert into category(code,name) values('the-thao','Thể thao');
insert into category(code,name) values('the-gioi','Thế giới');
insert into category(code,name) values('chinh-tri','Chính trị');
insert into category(code,name) values('thoi-su','Thời sự');
insert into category(code,name) values('goc-nhin','Góc nhìn');

insert into news(title,categoryid) values('bài viết 1',1);
insert into news(title,categoryid) values('bài viết 2',1);
insert into news(title,categoryid) values('bài viết 3',2);