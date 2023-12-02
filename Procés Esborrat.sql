use bd_prac3;

delete from adobs
where nom_firma = 'URVADOB'
and nom_adob in (
				select nom_planta
				from dosi_adobs d
				where d.nom_planta in (
										select f.nom_popular
										from floracio f
										where f.estacio <> 'hivern'
										)
				);