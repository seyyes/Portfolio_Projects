use Hopital;
/* 1.  Quels sont les indications des médicaments disponibles */
select distinct Indication
from Medicament;

/* 2. Afficher la liste des médecins par spécialité */
select Prénom, Nom, specialite
from Medecin
order by specialite;

/* 3. Afficher la pathologie des patients occupant ou ayant occupé le lit 214  */
select Pathologie, NumLit
from Hospitalisation
where NumLit = 214;

/* 4. Quelle est la localisation du service de pédiatrie ? */
select localisation 
from Hopital.dbo.Service
where NomServ like 'Pédiatrie';

/* 5. Nom des patients nés entre 1988 et 1992 ? */
select Nom, DateNaiss
from Patient
where year(DateNaiss) between 1988 and 1992

/* 6. Y a-t-il une patiente allergique aux crustacés ? */
select Nom, Prénom
from patient
where sexe like 'F' and AllergiesCI like 'crustacés'

/* 7. Combien de patients sont des hommes ? */
select count(*) as nbHomme
from patient
where sexe like 'M'

/* 8. Nombre de spécialités différentes exercées par les médecins de l'hôpital ? */
select count(distinct specialite ) as nbSpecialites
from Medecin
/* 9. Fourchette des prix des doses de médicaments ? */
SELECT MIN(prix_dose) as min, MAX(prix_dose) as max 
FROM medicament


/* 10. Durée moyenne des traitements pour chaque médicament ? */
SELECT designation, AVG(posologie) as dureeMoy 
FROM prescription 
GROUP by designation


/* 11. Combien de patients de chaque sexe ? */
select count(*) as nb, sexe
from patient
group by sexe

/* 12. Nom des médicaments dont la moyenne de durée de prescription est supérieure à 10 jours ? */  
SELECT designation, AVG(duree) as dureeMoy
FROM prescription 
GROUP BY designation 
HAVING AVG(duree) > 10


/* 13. Afficher le nom, le prénom et l’âge des patients « seniors » (âge supérieur à 60 ans) qui sont des hommes */
SELECT nom, prénom, datediff(yy, DateNaiss, getdate()) as age 
FROM patient 
WHERE datediff(yy, DateNaiss, getdate()) > 60 and sexe like 'M'


/* 14. Afficher le nom et le prénom des patients dont aucun dossier d’Hospitalisation n’existe */
SELECT nom, prénom 
FROM Patient
WHERE idPatient NOT IN
(SELECT idPatient
FROM Hospitalisation);

/* 15. Afficher les désignations des médicaments antalgiques et des médicaments avec prescription courte (jusqu’à 6 jours) */
SELECT Designation 
FROM Medicament 
WHERE Indication LIKE 'Antalgique' 
UNION 
SELECT Designation 
FROM Prescription 
WHERE Duree<7

/* 16. Pathologie la plus soignée au sein de l’Hôpital ? */
SELECT Pathologie 
FROM Hospitalisation 
GROUP BY Pathologie
HAVING COUNT(NumDossier)>= all 
(SELECT COUNT(NumDossier)
FROM Hospitalisation
GROUP BY Pathologie);

/* 17. Pour chaque médecin afficher le nom du service auquel il est rattaché */
SELECT Nom, Prénom, Nomserv 
FROM Service 
inner join Medecin 
ON Service.numserv=medecin.numserv;

/* 18. Écrire la requête qui permet d'obtenir pour chaque patient le nom du service dans lequel il est ou a été hospitalisé */
SELECT DISTINCT nom, Prénom, Nomserv 
FROM Patient P
inner join Hospitalisation H ON P.idPatient=H.idPatient 
inner join LitService LS ON H.NumLit=LS.NumLit 
inner join Service S ON LS.numserv=S.numserv;

/* 19. Afficher le nom et le prénom du médecin qui a fait une radio à "Lucrèce Marat"  */
SELECT M.Nom, M.Prénom
FROM Medecin M
INNER JOIN Actes A ON M.NumMed = A.NumMed
INNER JOIN Hospitalisation H ON A.NumDossier=H.NumDossier
INNER JOIN Patient P ON H.idPatient=P.idPatient
WHERE A.Type like 'radio'
AND P.Nom LIKE 'Marat'
AND P.Prénom LIKE 'Lucr_ce';

/* 20. Médicaments prescrits au moins une fois avec leur description ? */
SELECT DISTINCT M.*
FROM Medicament M
INNER JOIN  Prescription P ON P.Designation= M.Designation;

/* 21. Patients ayant consommé un antalgique ? */
select nom, prénom
from Patient p 
inner join Hospitalisation h on h.idPatient=p.idPatient
inner join Prescription pr on pr.NumDossier=h.NumDossier
inner join Medicament m on m.Designation = pr.Designation
where m.designation like 'antalgique';

/* 22. Patients n’ayant pas consommé de médicaments ? */
select nom, prénom
from Patient p
inner join Hospitalisation h on h.idPatient=p.idPatient
where not exists ( select NumDossier from Prescription pr where h.numdossier = pr.NumDossier);

/* 23. Patients présentant la même allergie ? */
select p1.nom, p2.nom, p1.AllergiesCI, p2.AllergiesCI
from patient p1
inner join patient p2 on p1.AllergiesCI=p2.AllergiesCI
where p1.Nom < p2.Nom
order by p1.AllergiesCI, p2.AllergiesCI;

/* 24. Montant des Actes pour chaque patient ? */
select nom, prénom, sum (t.prix) as montant
from Patient p 
inner join Hospitalisation h on h.idPatient= p.idPatient
inner join Actes a on a.NumDossier=h.NumDossier
inner join Tarifs t on a.Type=t.Type
group by nom, prénom;

/* 25. Montant des frais d’hospitalisation (hors médicaments) pour chaque patient. La journée d’hospitalisation est facturée 20€ */
select idpatient, DATEDIFF(DAY, Date_ent, Date_Sort) as duree,
case when 
	DATEDIFF(DAY, Date_ent, Date_Sort) > 0
	then DATEDIFF(DAY, Date_ent, Date_Sort)*20
	else 10
end as frais_hospitalisation
from hospitalisation;

/* 26. Montant des frais d’hospitalisation et des Actes (deux colonnes) pour chaque patient. */
select upper(nom), prénom,  DATEDIFF(DAY, Date_ent, Date_Sort) as duree,  sum (t.prix) as montant,
case when  DATEDIFF(DAY, Date_ent, Date_Sort) = 0 then 10 else DATEDIFF(DAY, Date_ent, Date_Sort)*20
end as cout_hospi
from patient p
left outer join Hospitalisation h on h.idPatient=p.idPatient
left outer join actes a on a.numdossier = h.NumDossier
left outer join Tarifs t on t.Type=a.type
group by Nom, Prénom, Date_Ent, Date_Sort;