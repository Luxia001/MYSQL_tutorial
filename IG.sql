create database Instagram;
use Instagram;

create table users(
    id int auto_increment primary key,
    username varchar(255) unique not null,
    created_at timestamp default now()
);

desc users;

insert into users (username)
VALUES ('blue'),
('char'),
('colt');

select * from users;
drop table photos;
create table photos(
    id int auto_increment primary key,
    image_url MEDIUMTEXT not null,
    user_id int not null,
    created_at timestamp default now(),
    FOREIGN key(user_id) REFERENCES users(id)
);

desc photos;

insert into photos (image_url,user_id) VALUES
('https://scontent.fbkk9-3.fna.fbcdn.net/v/t39.30808-6/470604194_578107004917639_3896881874364322891_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=105&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=ZB7NCLZRgzEQ7kNvgF6Q_s3&_nc_zt=23&_nc_ht=scontent.fbkk9-3.fna&_nc_gid=AtsN23v40T2WLG9M02UVToh&oh=00_AYBaoIo6vqHCAt6pmUISV7xhbemGoJeGwnJnOQBiNtZ14g&oe=6764F7CC',1),
('https://scontent.fbkk9-3.fna.fbcdn.net/v/t39.30808-6/470604194_578107004917639_3896881874364322891_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=105&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=ZB7NCLZRgzEQ7kNvgF6Q_s3&_nc_zt=23&_nc_ht=scontent.fbkk9-3.fna&_nc_gid=AtsN23v40T2WLG9M02UVToh&oh=00_AYBaoIo6vqHCAt6pmUISV7xhbemGoJeGwnJnOQBiNtZ14g&oe=6764F7CC',2),
('https://scontent.fbkk9-3.fna.fbcdn.net/v/t39.30808-6/470604194_578107004917639_3896881874364322891_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=105&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=ZB7NCLZRgzEQ7kNvgF6Q_s3&_nc_zt=23&_nc_ht=scontent.fbkk9-3.fna&_nc_gid=AtsN23v40T2WLG9M02UVToh&oh=00_AYBaoIo6vqHCAt6pmUISV7xhbemGoJeGwnJnOQBiNtZ14g&oe=6764F7CC',2);

select * from photos
right join users on photos.user_id = users.id;

create table comments(
    id int auto_increment primary key,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    FOREIGN key(user_id) REFERENCES users(id),
    FOREIGN key(photo_id) REFERENCES photos(id)
);

desc comments;

insert into comments(comment_text,user_id,photo_id) VALUES
('Meow',1,2),
('Amazing',3,2),
('I <3 This',2,1);

select * from comments;

create table likes(
    user_id int not null ,
    photo_id int not null ,
    created_at timestamp default now(),
    FOREIGN key(photo_id) REFERENCES photos(id),
    FOREIGN key(user_id) REFERENCES users(id),
    primary key(user_id,photo_id)
);

desc likes;

insert into likes(user_id,photo_id) VALUES
(1,1),
(2,1),
(1,2),
(3,3);

select * from likes;

create table follows(
    follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    FOREIGN key(follower_id) REFERENCES users(id),
    FOREIGN key(followee_id) REFERENCES users(id),
    primary key (follower_id,followee_id)
);

desc follows;

insert into follows(follower_id,followee_id) VALUES
(1,2),
(1,3),
(3,1),
(2,3);

select * from follows;

create table tags(
    id int auto_increment primary key,
    tag_name varchar(255) unique,
    created_at timestamp default now()
);

create table photo_tags(
    photo_id int not null,
    tag_id int not null,
    FOREIGN key(photo_id) REFERENCES photos(id),
    FOREIGN key(tag_id) REFERENCES tags(id),
    primary key(photo_id,tag_id)
);

show tables;

insert into tags(tag_name) VALUES
('adorable'),
('cute'),
('sunris');

select * from tags;

insert into photo_tags(photo_id,tag_id) VALUES
(1,1),
(1,2),
(2,3),
(3,2);

select * from photo_tags;
