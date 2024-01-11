-- Primary key for movie_keywords
alter table movie_keywords RENAME TO temptable;
select distinct * into movie_keywords from temptable ;
alter table movie_keywords add primary key(movie_id, keyword_id);
drop table temptable;

-- Foreign keys on movie_keywords
alter table movie_keywords add foreign key(keyword_id) references keywords(id);
alter table movie_keywords add foreign key(movie_id) references movie(id);