alter table movie_collection RENAME TO temptable;
select distinct * into movie_collection from temptable ;
alter table movie_collection add primary key(movie_id, collection_id);
drop table temptable;

alter table movie_collection add foreign key(collection_id) references collection(id);
alter table movie_collection add foreign key(movie_id) references movie(id);