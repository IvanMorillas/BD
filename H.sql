use bd_prac3;

select distinct e.nom_planta, f.estacio
from plantes_exterior pe, exemplars_plantes e, floracio f
where e.num_exemplar >= (select max(num_exemplar)
			from exemplars_plantes e, plantes_interior p
			where e.nom_planta = p.nom_planta)
and e.nom_planta in (select nom_planta
			from plantes_exterior)
and e.nom_planta = f.nom_popular;