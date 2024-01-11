-- Primary key for movie_productioncompanies
alter table movie_productioncompanies RENAME TO temptable;
select distinct * into movie_productioncompanies from temptable ;
alter table movie_productioncompanies add primary key(movie_id, pc_id);
drop table temptable;

-- Foreign keys on movie_production_companies
alter table movie_productioncompanies add foreign key(pc_id) references productioncompany(id);
alter table movie_productioncompanies add foreign key(movie_id) references movie(id);