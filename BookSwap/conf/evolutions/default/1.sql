# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table book (
  id                        bigint not null,
  title                     varchar(255),
  author                    varchar(255),
  isbn                      varchar(255),
  book_store_price          double,
  edition                   integer,
  constraint pk_book primary key (id))
;

create table condition (
  id                        bigint not null,
  fk_condition_name_id      bigint,
  constraint pk_condition primary key (id))
;

create table condition_name (
  id                        bigint not null,
  name                      varchar(255),
  condition_id              bigint,
  fk_condition_id           bigint,
  constraint pk_condition_name primary key (id))
;

create table offer (
  id                        bigint not null,
  price                     double,
  fk_book_id                bigint,
  fk_student_id             bigint,
  fk_condition_id           bigint,
  book_id                   bigint,
  student_id                bigint,
  condition_id              bigint,
  constraint pk_offer primary key (id))
;

create table request (
  id                        bigint not null,
  price                     double,
  fk_book_id                bigint,
  fk_student_id             bigint,
  fk_condition_id           bigint,
  book_id                   bigint,
  student_id                bigint,
  condition_id              bigint,
  constraint pk_request primary key (id))
;

create table student (
  id                        bigint not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  email                     varchar(255),
  constraint pk_student primary key (id))
;

create sequence book_seq;

create sequence condition_seq;

create sequence condition_name_seq;

create sequence offer_seq;

create sequence request_seq;

create sequence student_seq;

alter table condition_name add constraint fk_condition_name_condition_1 foreign key (condition_id) references condition (id) on delete restrict on update restrict;
create index ix_condition_name_condition_1 on condition_name (condition_id);
alter table offer add constraint fk_offer_book_2 foreign key (book_id) references book (id) on delete restrict on update restrict;
create index ix_offer_book_2 on offer (book_id);
alter table offer add constraint fk_offer_student_3 foreign key (student_id) references student (id) on delete restrict on update restrict;
create index ix_offer_student_3 on offer (student_id);
alter table offer add constraint fk_offer_condition_4 foreign key (condition_id) references condition (id) on delete restrict on update restrict;
create index ix_offer_condition_4 on offer (condition_id);
alter table request add constraint fk_request_book_5 foreign key (book_id) references book (id) on delete restrict on update restrict;
create index ix_request_book_5 on request (book_id);
alter table request add constraint fk_request_student_6 foreign key (student_id) references student (id) on delete restrict on update restrict;
create index ix_request_student_6 on request (student_id);
alter table request add constraint fk_request_condition_7 foreign key (condition_id) references condition (id) on delete restrict on update restrict;
create index ix_request_condition_7 on request (condition_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists book;

drop table if exists condition;

drop table if exists condition_name;

drop table if exists offer;

drop table if exists request;

drop table if exists student;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists book_seq;

drop sequence if exists condition_seq;

drop sequence if exists condition_name_seq;

drop sequence if exists offer_seq;

drop sequence if exists request_seq;

drop sequence if exists student_seq;

