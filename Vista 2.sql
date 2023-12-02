use bd_prac3;

create view vista2 (nom_popular, temperatura_ambient, ubicacio_idònia)
	AS(SELECT nom_planta, temperatura, ubicacio
		FROM plantes_interior
		WHERE temperatura >=16);