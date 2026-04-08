CREATE DATABASE spotify;

USE spotify;

CREATE TABLE top(
             posicao INT PRIMARY KEY AUTO_INCREMENT,
             artista VARCHAR(50),
             musica VARCHAR(255),
             dias INT,
             top_vezes DOUBLE,
             maior_posicao INT,
             vezes_maior_poisicao VARCHAR(10),
             pico_streams INT,
             total_streans INT
             );
    
-- Contagem de quantos artistas estão com valor nulo no nome.
SELECT *
FROM top
WHERE artista IS NULL;

-- Contagem total de quantos registros tem na tabela.
SELECT * FROM spotify.top;

-- Contagem de quantas músicas estiveram no top 1.
SELECT musica 
FROM top
WHERE top_vezes = 1;





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