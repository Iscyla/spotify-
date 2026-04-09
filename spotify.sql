CREATE DATABASE spotify;

USE spotify;

CREATE TABLE top(
             posicao INT PRIMARY KEY AUTO_INCREMENT,
             artista VARCHAR(50),
             musica VARCHAR(255),
             dias INT,
             top_vezes DOUBLE,
             maior_posicao INT,
             vezes_maior_posicao VARCHAR(10),
             pico_streams INT,
             total_streans INT
             );
    
-- Contagem de quantos artistas estão com valor nulo no nome.
SELECT COUNT(*) AS total_nulos
FROM top
WHERE artista IS NULL;

-- Contagem total de quantos registros tem na tabela.
SELECT COUNT(*) AS total_registros
FROM top;

-- Contagem de quantas músicas estiveram no top 1.
SELECT COUNT(*) AS total_top1
FROM top
WHERE top_vezes = 1;

-- Qual a música que ficou por mais vezes no top 1.
SELECT musica, top_vezes
FROM top
ORDER BY top_vezes DESC
LIMIT 1;

-- Quantos artistas diferentes há.
SELECT COUNT(DISTINCT (artista)) AS artistas_diferentes
FROM top;

-- Qual música com mais streams.
SELECT musica, total_streans
FROM top
ORDER BY total_streans DESC
LIMIT 1;

-- Qual música com maior pico de streams.
SELECT musica, pico_streams 
FROM top
ORDER BY pico_streams  DESC
LIMIT 1;

-- Qual artista ficou mais vezes no top 1.
SELECT artista, top_vezes
FROM top
ORDER BY top_vezes DESC
LIMIT 1;

-- Qual artista possui mais registros.
SELECT artista, COUNT(*) AS total_registros
FROM top
GROUP BY artista
ORDER BY total_registros DESC
LIMIT 1;

-- Quantos artistas possuem nome iniciando com a letra “H”.
SELECT COUNT( DISTINCT artista) AS inicial 
FROM top
WHERE artista LIKE 'h%';

-- Quais as músicas da artista “Anitta” estão na tabela.
SELECT *
FROM top
WHERE artista = 'Anitta';

-- Quantas músicas passaram da marca de 500 mil streams.
SELECT musica, total_streans
FROM top
WHERE total_streans > 500000;

-- Qual a música no registro 3480.
SELECT musica
FROM top
WHERE posicao = 3480;

-- Quais músicas o artista “The Weeknd” possui.
SELECT musica
FROM top
WHERE artista = 'The Weeknd';

-- Quantas músicas o artista “The Weeknd” possui.
SELECT artista, count(musica) as qts_music
FROM top
WHERE artista = 'The Weeknd';

-- Quantas músicas possuem “girl” no nome.
SELECT artista, musica
FROM top
WHERE musica LIKE '%girl%';

-- Qual o total de streams do artista “Post Malone”.
SELECT artista, MAX(total_streans) as total_de_streams_post_malone
FROM top
WHERE artista = 'Post Malone';

-- Quais são os 5 artistas com mais registros, de forma decrescente.
SELECT artista, COUNT(*) AS total_registros
FROM top
GROUP BY artista
ORDER BY total_registros DESC
LIMIT 5;

-- Qual o total de streams das 10 músicas com mais streams.
SELECT *
FROM top
ORDER BY total_streans DESC
LIMIT 10;

-- Qual a música com o mínimo de streams que atingiu a 1ª posição no top 10.
SELECT musica, artista, MIN(total_streans) AS musica_minimo
FROM top
WHERE artista;


-- Qual a música com o mínimo de streams da artista Taylor Swift.
SELECT musica, artista, MIN(total_streans) AS musica_minimo
FROM top
WHERE artista = 'Taylor Swift';


