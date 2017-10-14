--number 1 Query all of the entries in the Genre table
select * from Genre;

--number 2 Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist (ArtistName, YearEstablished) values ("Kings of Leon", "2002");

select * from Artist;

--number 3 Using the INSERT statement, add one, or more, albums by your artist to the Album table
insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ("Walls", "2016", "2082" , "RCA", "28", "2");

insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ("Only by The Night", "1009", "2014" , "RCA", "28", "2");

--number 4 Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId,  AlbumId) values ("Waste a Moment", "188", "2016" , "2", "28", "23");

insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId,  AlbumId) values ("Use Somebody", "210", "2009" , "2", "28", "25");

--Number 5 Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.Title, s.Title , a.ArtistId FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId  where a.ArtistId > 27;


--Number 6 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select  album.Title, Sum(song.AlbumId = album.AlbumId)
from Album LEFT JOIN SONG
GROUP By Album.Title;


--number 7 Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select Artist.ArtistName, SUM (Artist.ArtistId = Song.ArtistId)
From Song, Artist
Group By Artist.ArtistName

--number 8 Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select Genre.Label, SUM (Genre.GenreId = Song.ArtistId)
From Genre, Song
Group By Genre.Label;


--number 9 Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
Select Album.Title, MAX(Album.AlbumLength)
FROM Album

--number 10 Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
Select Song.Title, MAX(Song.SongLength)
FROM Song

--number 11 Modify the previous query to also display the title of the album.
Select Album.Title, Song.Title, MAX(Song.SongLength)
FROM Album LEFT JOIN  Song
WHERE album.albumId = song.albumid











==================More example code below =======================================================================================================

--select title as 'song title' from song; 

/* Get the title from Song and Artist from Artist  using an inner join on the artistid col in Song*/
select s.title, a.artistname
from song s join artist a
on s.artistid = a.artistid;


/* A left join on Album and song using albumid which returns data in Album and song title as ''song'  where the albums have ont meaning the song title column will have all null values*/
select a.Title 'Album', s.Title 'Song'
from Album a
left join Song s on s.AlbumId = a.AlbumId
where s.Title is null;



/*A right join between the tables Album and Song */
select a.Title 'Album', s.Title 'Song'
from Song s
left join Album a on s.AlbumId = a.AlbumId
where s.Title is null;

/* There are two selcect queries here: firs one gives album titles and song titles and is a left join on Album and song., so everthing from Album comes back
The second on give album titles and song titles as well. But is a left joiin on Song and Album so everything from Song comes back. The union of the result of both will get all the data in the album table and song table joined on the column AlbumId. Only interested in the title of the song nad the album from all the data*/
SELECT a.Title 'Album', s.Title 'Song'
FROM Album a LEFT OUTER JOIN Song s ON s.AlbumId = a.AlbumId
union
Select a.Title 'Album', s.Title 'Song'
FROM Song s LEFT OUTER JOIN Album a ON s.AlbumID = a.AlbumId;


/* A self join on the song table on the column*/
SELECT s.Title 'Song', a.ArtistName 'Artist'
FROM song s, song o
join artist a on s.ArtistId = a.ArtistId
WHERE s.SongId = o.SongId
AND s.ArtistId = o.ArtistId
ORDER BY s.ArtistId;

SELECT a.label, count(*) 'count'
FROM song s
join album a on s.ArtistId = a.ArtistId
group by a.label





select title 'song title' from song;

/* Get the title from Song and artist name from Artist doing a inner join on the 
atristid column in Song and artistid column in Artist*/
select s.title, a.artistname
from song s join artist a
on s.artistid = a.artistid;


/*A left join on Album and Song using AlbumId  where  song title is null. 
This returns all album title as 'Album' and song title as 'Song' where the the albums have no songs.
Meaning the song title column will have all NULL values*/
select a.Title 'Album', s.Title 'Song'
from Album a
left join Song s on s.AlbumId = a.AlbumId
where s.Title is null;

/*A right join between the tables Album and Song*/
select a.Title 'Album', s.Title 'Song'
from Song s
left join Album a on s.AlbumId = a.AlbumId
where s.Title is null;

/*
There are two select queries here: The first one gives you album titles and song titles 
This is a left join on Album and Song. Therefore everything in Album will come back. 
The second one give album titles and song titles as well. But this one is a left join on Song and Album.
So you get everything in Song back. By taking the union of the results of both queries, you essentially get all the data in
the Album table and Song table joined on the column AlbumId. We are only interested in the title of 
the song and the album so from all the data, we ask for those two columns.
*/
SELECT a.Title 'Album', s.Title 'Song' 
FROM Album a LEFT OUTER JOIN Song s ON s.AlbumId = a.AlbumId
UNION
SELECT a.Title 'Album', s.Title 'Song' 
FROM Song s LEFT OUTER JOIN Album a ON s.AlbumId = a.AlbumId;

/*Same query as above but without using aliases*/
SELECT artist.Title, song.Title
FROM Album LEFT OUTER JOIN Song ON Song.AlbumId = Artist.AlbumId
UNION
SELECT artist.Title, song.Title 
FROM Song LEFT OUTER JOIN Album ON song.AlbumId = album.AlbumId;

/*A self join on the song table on the column songid and a inner join with the artist table on column artistid
which then we order by artists using artistid column(on the table Song)*/
SELECT s.Title 'taco', a.ArtistName 'Artist'
FROM song s, song o
join artist a on s.ArtistId = a.ArtistId
WHERE s.SongId = o.SongId
AND s.ArtistId = o.ArtistId
ORDER BY s.ArtistId;

/**/
SELECT a.label, count(*) as 'count'
FROM album a
join artist t
on t.artistid = a.artistid
group by t.artistId;