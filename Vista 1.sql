use bd_prac3;

create view vista1 (nom_popular, nom_cientific, num_exemplars) 
	AS (SELECT p.nom_planta,pl.nom_llati, count(e.num_exemplar)
		FROM  exemplars_plantes e, plantes_exterior p, plantes pl
		WHERE p.nom_planta IN (SELECT r.nom_planta
					FROM reproduccions r
					GROUP BY r.nom_planta
					HAVING COUNT(r.nom_metode)>=2)
		AND p.nom_planta = e.nom_planta
		AND p.nom_planta = pl.nom_popular