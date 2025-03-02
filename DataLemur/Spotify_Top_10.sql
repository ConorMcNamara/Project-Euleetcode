WITH top_10 AS (
    SELECT
        global_song_rank.song_id,
        artist_id
    FROM global_song_rank
    JOIN songs
        ON global_song_rank.song_id = songs.song_id
    WHERE
        rank <= 10
),
artist_songs AS (
    SELECT
        a.artist_name,
        DENSE_RANK() OVER (ORDER BY COUNT(t.artist_id) DESC) AS artist_rank
    FROM artists a
    JOIN top_10 t
        ON a.artist_id = t.artist_id
    GROUP BY
        1
)
SELECT
    artist_name,
    artist_rank
FROM artist_songs
WHERE
  artist_rank <= 5;