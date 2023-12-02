use bd_prac3;

select distinct p.nom_popular, p.nom_llati
from plantes p
where p.nom_popular in (
						select nom_popular
						from floracio
						where estacio = 'estiu'
						and nom_popular NOT IN (
												select nom_planta
												from plantes_interior))
and p.nom_popular in (
						select nom_planta
						from dosi_adobs
						where nom_estacio = 'primavera'
						and nom_adob not in (
												select nom_adob
												from adobs
												where nom_firma = 'TIRSADOB'));
