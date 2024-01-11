
/* Μετανομασία πινάκων για backup*/
ALTER TABLE Movie_crew RENAME TO Movie_crew2;
ALTER TABLE Movie_cast RENAME TO Movie_cast2;


/* Δημιουργία  καινούργιων πινακων για κανονικοποιημενη μορφη */
create table Movie_Crew(
   movie_id int,
   department varchar(20),
   gender int,
   person_id int,
   job varchar(60),
   name varchar(40)
);

create table Movie_Cast(
   movie_id int,
   cast_id int,
   character varchar(390),
   gender int,
   person_id int,
   name varchar(40)
);

create table CrewMember(
   person_id int,
   gender int,
   name varchar(40)
);

create table Actor(
   person_id int,
   gender int,
   name varchar(40)
);

create table Person(
   person_id int,
   gender int,
   name varchar(40)
);

/* Εισαγωγή δεδομένων*/

INSERT INTO Movie_Crew
SELECT * FROM Movie_crew2

INSERT INTO Movie_Cast
SELECT * FROM Movie_cast2

INSERT INTO CrewMember (person_id, gender, name)
SELECT distinct person_id, gender, name
FROM Movie_Crew;

INSERT INTO Actor (person_id, gender, name)
SELECT distinct person_id, gender, name
FROM Movie_Cast;

INSERT INTO Person
(select * from CrewMember) union (select * from Actor)


/* Διαγραφή στηλών */ 
ALTER TABLE Movie_Crew
DROP COLUMN gender;
ALTER TABLE Movie_Crew
DROP COLUMN name;

ALTER TABLE Movie_Cast
DROP COLUMN gender;
ALTER TABLE Movie_Cast
DROP COLUMN name;

/* Δημιουργία Primary and foreign keys */
alter table Movie_Crew add primary key(movie_id,department,person_id,job);
alter table Movie_Cast add primary key(movie_id,cast_id,character,person_id);

alter table Movie_Crew add foreign key(movie_id) references Movie(id);
alter table Movie_Cast add foreign key(movie_id) references Movie(id);

alter table Movie_Crew 
ADD CONSTRAINT FK_2 foreign key(person_id) references CrewMember(person_id);

alter table Movie_Cast
ADD CONSTRAINT FK_2 foreign key(person_id) references Actor(person_id);

alter table CrewMember
ADD CONSTRAINT FK_3 foreign key(person_id) references Person(person_id);

alter table Actor
ADD CONSTRAINT FK_3 foreign key(person_id) references Person(person_id);


alter table CrewMember add primary key(person_id);
alter table Actor add primary key(person_id);


DELETE FROM Person  WHERE person_id = 1785844 and gender =0 ;
alter table Person add primary key(person_id);
