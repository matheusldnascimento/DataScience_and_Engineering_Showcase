-- 1
Select nome
From aeroporto 
Where pais = 'Portugal';

-- 2
SELECT av.nome, av.idmodelo, mo.versao
FROM aviao av
INNER JOIN modelo mo ON av.idmodelo = mo.idmodelo
WHERE av.idmodelo = 1;

-- 3
SELECT av.nome, mo.nummotores, mo.versao
FROM aviao av
INNER JOIN modelo mo ON av.idmodelo = mo.idmodelo;

-- 4
SELECT COUNT(idvoo)
FROM voo
WHERE duracao IN (2, 3);

-- 5
SELECT idModelo, versao
FROM modelo
WHERE versao LIKE 'A3%';

-- 6
SELECT idvoo, duracao
FROM voo
ORDER BY duracao DESC;

-- 7
SELECT p.idvoo AS id_voo_porto_intermediario,
       p.idaeroportochegada AS aeroporto_intermediario,
       c.idvoo AS id_voo_intermediario_londres
FROM voo AS p
JOIN voo AS c ON p.idaeroportochegada = c.idaeroportopartida
WHERE p.idaeroportopartida = 1
AND c.idaeroportochegada = 12;

-- 8 
SELECT pais, count(*) AS total
From aeroporto
GROUP BY pais
ORDER BY total;

-- 9
SELECT v.idvoo, a1.cidade as origem, a2.cidade as destino
FROM voo v
JOIN aeroporto a1 on v.idaeroportopartida = a1.idaeroporto
JOIN aeroporto a2 on v.idaeroportochegada = a2.idaeroporto;

-- 10
SELECT v.idvoo
FROM voo v
JOIN aeroporto a1 on v.idaeroportopartida = a1.idaeroporto
JOIN aeroporto a2 on v.idaeroportochegada = a2.idaeroporto
WHERE a1.cidade = 'Porto' and a2.cidade = 'Lisboa';

-- 11
SELECT pais, count(idaeroporto) as total
FROM aeroporto
GROUP BY pais
HAVING count(idaeroporto) >=2;

-- 12
SELECT pais 
FROM aeroporto
GROUP BY pais
HAVING count(*) = (
	SELECT min(cod_aeroporto)
	FROM (
		SELECT count(*) as cod_aeroporto
		FROM aeroporto
		GROUP BY pais) as a);
		
-- 13
SELECT pais 
FROM aeroporto
GROUP BY pais
HAVING count(*) = (
	SELECT max(cod_aeroporto)
	FROM (
		SELECT count(*) as cod_aeroporto
		FROM aeroporto
		GROUP BY pais) as a);
		
-- 14
SELECT m.idmodelo, count(a.idaviao) as total_aviao
FROM modelo m
JOIN aviao a on a.idmodelo = m.idmodelo
GROUP BY m.idmodelo;

-- 15
SELECT m.idmodelo, count(a.idaviao) as total_aviao
FROM modelo m
LEFT JOIN aviao a on a.idmodelo = m.idmodelo
GROUP BY m.idmodelo;
