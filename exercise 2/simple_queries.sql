/* Να βρεις και να εμφανίσεις 10 ταινίες δράσης
10 rows affected.*/ 

SELECT  Movie.title, Genre.name
FROM Movie 
join Movie_genres
on Movie.id= Movie_genres.movie_id
join Genre
on Movie_genres.genre_id = Genre.id
where Genre.name = 'Drama'
limit 10 


/*Να βρείς και να εμφανίσεις τις λέξεις κλειδιά και τους τίτλους των ταινιών που είχαν μεσο ορο βαθμολογίας απ τους χρήστες πάνω απο 4 
1978 rows affected.*/

SELECT Movie.title ,avg(Ratings.rating),  Keywords.name 
FROM Movie
join Movie_keywords
on Movie.id=Movie_keywords.movie_id
join Keywords
on Movie_keywords.keyword_id=Keywords.id
join Ratings
on Movie.id=Ratings.movie_id
GROUP BY Movie.title, Keywords.name
HAVING avg(Ratings.rating) >4


/*Να βρεις και να εμφανίσεις τα ονόματα των ηθοποιών και τον τίτλο των ταινιών που επαιξαν με μεσο ορο βαθμολογίας πάνω απο 4
5652 rows affected. */

select Movie_cast.name , Movie.title
from Movie
join Movie_cast
on Movie.id = movie_cast.movie_id
join Ratings
on Movie.id = Ratings.movie_id
GROUP BY Movie_cast.name, Movie.title
HAVING avg(Ratings.rating)>4


/*Για κάθε μια απο τις 10 πρώτες ταινιες με το υψηλότερο budget βρες και εμφάνισε το πλήθος των ηθοποιών
10 rows affected. */

select Movie.title , Movie.budget, count(Movie_cast.name) as countName
from Movie
join Movie_cast 
ON  Movie.id = Movie_cast.movie_id 
Group by Movie.title , Movie.budget
order by budget desc
limit 10



/* Βρες και εμφάνισε την ταινία με την υψηλότερη βαθμολογία και με το χαμητότερο budget 
1 rows affected. */ 

select min(Movie.budget), Movie.title ,avg(Ratings.rating)
from Movie
join Ratings
On Movie.id = Ratings.movie_id
Group by Movie.title
order by avg(Ratings.rating) desc
limit 1

/* Βρες και εμφάνισε τις ταινίες που περιέχουν keywords τα οποία ξεκινάνε με την λέξη air
149 rows affected.*/ 

SELECT  Movie.title , Keywords.name
FROM Movie
FULL OUTER JOIN Movie_keywords
on Movie.id=Movie_keywords.movie_id
FULL OUTER JOIN Keywords
on Movie_keywords.keyword_id=Keywords.id
WHERE keywords.name like 'air%'

/* Βρες και εμφάνισε τις ταινίες και τον μέσο όρο της βαθμολογίας τους απο το 01-01-2005 μεχρι 01-01-2013 σε αύξουσα χρονολογική σειρά
62 rows affected.*/
select Movie.release_date, Movie.title,  avg(Ratings.rating)
from Movie 
FULL OUTER JOIN Ratings
on Movie.id = Ratings.movie_id
where Movie.Release_date between '2005-01-01' and '2013-01-01'
Group by Movie.title,Movie.release_date
order by Movie.release_date  

/* Βρες και εμφάνισε όλες τις διαφορετικές γλώσσες που έχουν χρησιμοποιηθεί απο ταινίες 
47 rows affected.*/
select distinct original_language
from Movie


/*Βρες και εμφάνισε τις ταινίες που εχουν 2 τίτλους
1469 rows affected. 
*/ 
select title, original_title
from Movie
where not (title like original_title)

/* Βρες και εμφάνισε τις ταινίες της Marvel  
13 rows affected.*/
select Movie.title 
From Movie
Join Movie_productioncompanies
on movie.id = Movie_productioncompanies.movie_id
join Productioncompany
on Movie_productioncompanies.pc_id= Productioncompany.id
where name like 'Marvel%'



/* Βρες και εμφάνισε πόσες ταινίες έβγαλε η Pixar company 
1 rows affected.*/
select count(Movie.title) 
From Movie
Join Movie_productioncompanies
on movie.id = Movie_productioncompanies.movie_id
join Productioncompany
on Movie_productioncompanies.pc_id= Productioncompany.id
where name like 'Pixar%'



/* Βρες και εμφάνισε ποιες ταινίες ανήκουν στη συλλογή X-men
2 rows affected.*/select Movie.title
from Movie
join Movie_collection
on Movie.id=Movie_collection.movie_id
join Collection
on Movie_collection.collection_id = Collection.id
where Collection.name like 'X-Men%'













