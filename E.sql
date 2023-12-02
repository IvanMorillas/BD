use bd_prac3;

select d.nom_adob, a.tipus_adob
from  dosi_adobs d, adobs a
group by d.nom_adob, a.tipus_adob
having count(d.nom_adob) > (
							select count(nom_popular)
							from plantes)
and a.tipus_adob in (
					select tipus_adob
					from adobs
					where nom_adob = d.nom_adob);