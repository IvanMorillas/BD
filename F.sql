use bd_prac3;

select distinct r.nom_planta, f.estacio
from reproduccions r, floracio f 
where f.nom_popular not in (
							 select nom_popular
							 from floracio f
							 where estacio = 'primavera'
					  		)
and r.nom_planta = f.nom_popular
and r.grau_exit ='alt'
group by r.nom_planta
having count(nom_metode) >= 2;