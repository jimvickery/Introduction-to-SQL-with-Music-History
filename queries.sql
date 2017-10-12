--number 1 Query all of the entries in the Genre table
select * from Genre;

--number 2 Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist (ArtistName, YearEstablished) values ("Kings of Leon", "2002");

select * from Artist;

--number 3 Using the INSERT statement, add one, or more, albums by your artist to the Album table
insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ("Walls", "2016", "2082" , "RCA", "28", "2");

insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ("Only by The Night", "1009", "2104" , "RCA", "28", "2");

--number 4 Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId,  AlbumId) values ("Waste a Moment", "188", "2106" , "2", "28", "23");

insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId,  AlbumId) values ("Use Somebody", "210", "2009" , "2", "28", "25");

--Number 5 Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.Title, s.Title , a.ArtistId FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId  where a.ArtistId > 27;


--Number 6 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


--number 7 Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


--number 8 Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


--number 9 Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.


--number 10 Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.


--number 11 Modify the previous query to also display the title of the album.

