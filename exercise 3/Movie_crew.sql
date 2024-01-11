-- Primary key movie_crew
alter table movie_crew add primary key(movie_id, department, gender, person_id, job, name);


-- Foreign keys on movie_crew
alter table movie_crew add foreign key(movie_id) references movie(id);