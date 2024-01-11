-- Primary key for productioncompany
alter table productioncompany add primary key(id);


-- Primary key for movie_productioncompanies
alter table movie_productioncompanies RENAME TO temptable;
select distinct * into movie_productioncompanies from temptable ;
alter table movie_productioncompanies add primary key(movie_id, pc_id);
drop table temptable;

-- Primary key for Genre
alter table genre add primary key(id);

-- Primary key for Collection
alter table collection add primary key(id);

-- Primary key for Movie_genres
alter table movie_genres RENAME TO temptable;
select distinct * into movie_genres from temptable ;
alter table movie_genres add primary key(movie_id, genre_id);
drop table temptable;


-- Primary key for Movie_collection
alter table movie_collection RENAME TO temptable;
select distinct * into movie_collection from temptable ;
alter table movie_collection add primary key(movie_id, collection_id);
drop table temptable;


-- Primary key for Movie
alter table movie add primary key(id);

-- Primary key for keywords
alter table keywords add primary key(id);

-- Primary key for movie_keywords
alter table movie_keywords RENAME TO temptable;
select distinct * into movie_keywords from temptable ;
alter table movie_keywords add primary key(movie_id, keyword_id);
drop table temptable;


-- Primary key rating
alter table ratings add primary key(movie_id, user_id);


-- Primary key movie_crew
alter table movie_crew add primary key(movie_id, department, gender, person_id, job, name);


-- Foreign keys on movie_production_companies
alter table movie_productioncompanies add foreign key(pc_id) references productioncompany(id);
alter table movie_productioncompanies add foreign key(movie_id) references movie(id);

-- Foreign keys on movie_genres
alter table movie_genres add foreign key(movie_id) references movie(id);
alter table movie_genres add foreign key(genre_id) references genre(id);

-- Foreign keys on movie_collection
alter table movie_collection add foreign key(collection_id) references collection(id);
alter table movie_collection add foreign key(movie_id) references movie(id);

-- Foreign keys on movie_keywords
alter table movie_keywords add foreign key(keyword_id) references keywords(id);
alter table movie_keywords add foreign key(movie_id) references movie(id);

-- Foreign keys on movie_crew
alter table movie_crew add foreign key(movie_id) references movie(id);


-- Foreign keys on movie_cast
alter table movie_cast add foreign key(movie_id) references movie(id);


-- Foreign keys on ratings
alter table ratings add foreign key(movie_id) references movie(id);
