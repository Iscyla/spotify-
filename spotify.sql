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
SELECT DISTINCT artista
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

-- Quais as músicas da artista “Anitta” estão na tabela.
SELECT musica
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

-- Quantas músicas o artista “The Weeknd” possui e quais.
SELECT musica
FROM top
WHERE artista = 'The Weeknd';

-- Quantas músicas possuem “girl” no nome.
SELECT artista, musica
FROM top
WHERE musica LIKE '%girl%';

-- Qual o total de streams do artista “Post Malone”.
SELECT SUM(total_streans) as total_de_streams_post_malone
FROM top
WHERE artista = 'Post Malone';

-- Quais são os 5 artistas com mais registros, de forma decrescente.
SELECT posicao
FROM top
WHERE maior_posicao = 5
LIMIT 5;







-- SELECT filtrado
SELECT posicao, artista, musica
FROM top;

-- filtrando com WHERE
SELECT posicao, artista, musica
FROM top
WHERE artista = "DAFT PUNK";

-- filtrado operadores relacionais >, <, <>, <=, >=
Select *
FROM top
WHERE top_vezes < 100;-- filtrado com operadores lógicos - and, or, not
Select *
FROM top
WHERE artista = "SZA" AND maior_posicao = 5;

-- ordernando = order by , asc = de cima pra baixo, desc = de baixo pra cima
SELECT artista, musica
FROM top
ORDER BY artista ASC;

-- entre = between
SELECT *
FROM top
WHERE maior_posicao BETWEEN 10 and 15;

-- IN - dentro de uma lista
SELECT *
FROM top
WHERE artista IN ('BTS', 'Childish Gambino', 'Yung Lean');

-- LIKE - pesquisa nomes
SELECT artista, musica
FROM top
WHERE musica LIKE '%dat%';

-- count - conta a quantidade de vezes que o retorno te dá
SELECT COUNT(*) AS contagem
FROM top
WHERE artista = 'Childish Gambino';

-- contagem - registros diferentes
SELECT DISTINCT (artista) AS diferente
FROM top;

-- contagem de artistas diferentes
SELECT COUNT(DISTINCT (artista)) AS diferente
FROM top;

-- agrupar resultados
SELECT artista, COUNT(musica) AS vezes
FROM top
GROUP BY artista ;

-- limit - limita os resultados
SELECT *
FROM top
WHERE maior_posicao = 7
LIMIT 5;

-- soma de resultados
SELECT SUM(total_streans) as total_de_streams_da_tabela
FROM top;

-- média de resultados
SELECT AVG(total_streans) as media_de_streams_da_tabela
FROM top;

-- valor maximo de resultados
SELECT MAX(total_streans) as maximo_de_streams_da_tabela
FROM top;

-- valor min de resultados
SELECT MIN(total_streans) as minimo_de_streams_da_tabela
FROM top;

-- verifica se o valor é nulo
SELECT *
FROM top
WHERE maior_posicao IS NULL;
