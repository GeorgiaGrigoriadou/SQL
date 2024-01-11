-- Foreign keys on movie_cast
alter table movie_cast add foreign key(movie_id) references movie(id);

-- Primary keys on movie_cast
alter table Movie_cast add primary key(movie_id, cast_id,character, gender, name, person_id);