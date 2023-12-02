use bd_prac3;

select distinct r.nom_planta, r.nom_metode, p.tipus_planta
from reproduccions r, plantes_exterior p
where r.nom_planta in (
						select nom_planta
						from  plantes_exterior
						where nom_planta in (
											select nom_popular
											from floracio
											where estacio = 'primavera'
											))
and r.grau_exit = 'alt'
and r.nom_planta = p.nom_planta;