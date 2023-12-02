use bd_prac3;

--Proces modificacio

update dosi_adobs d
inner join floracio f 
on d.nom_estacio = 'hivern'
and f.estacio = 'primavera'
set d.qtat_adob = d.qtat_adob + d.qtat_adob * 0.1;