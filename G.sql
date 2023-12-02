use bd_prac3;

select distinct p.nom_planta, p.ubicacio
from plantes_interior p, dosi_adobs d, reproduccions r
where p.nom_planta in (
						select all r.nom_planta
						from reproduccions r
						where r.grau_exit = 'baix')
and p.nom_planta in(
					select all d.nom_planta
					from dosi_adobs d
					where d.nom_adob = d.nom_adob
					);