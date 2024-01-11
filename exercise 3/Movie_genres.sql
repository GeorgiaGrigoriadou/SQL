-- Primary key for Movie_genres
alter table movie_genres RENAME TO temptable;
select distinct * into movie_genres from temptable ;
alter table movie_genres add primary key(movie_id, genre_id);
drop table temptable;

-- Foreign keys on movie_genres
alter table movie_genres add foreign key(movie_id) references movie(id);
alter table movie_genres add foreign key(genre_id) references genre(id);