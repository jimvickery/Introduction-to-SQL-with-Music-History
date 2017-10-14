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