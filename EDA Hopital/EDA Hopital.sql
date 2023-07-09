use Hopital;
/* 1.  Quels sont les indications des m�dicaments disponibles */
select distinct Indication
from Medicament;

/* 2. Afficher la liste des m�decins par sp�cialit� */
select Pr�nom, Nom, specialite
from Medecin
order by specialite;

/* 3. Afficher la pathologie des patients occupant ou ayant occup� le lit 214  */
select Pathologie, NumLit
from Hospitalisation
where NumLit = 214;

/* 4. Quelle est la localisation du service de p�diatrie ? */
select localisation 
from Hopital.dbo.Service
where NomServ like 'P�diatrie';

/* 5. Nom des patients n�s entre 1988 et 1992 ? */
select Nom, DateNaiss
from Patient
where year(DateNaiss) between 1988 and 1992

/* 6. Y a-t-il une patiente allergique aux crustac�s ? */
select Nom, Pr�nom
from patient
where sexe like 'F' and AllergiesCI like 'crustac�s'

/* 7. Combien de patients sont des hommes ? */
select count(*) as nbHomme
from patient
where sexe like 'M'

/* 8. Nombre de sp�cialit�s diff�rentes exerc�es par les m�decins de l'h�pital ? */
select count(distinct specialite ) as nbSpecialites
from Medecin
/* 9. Fourchette des prix des doses de m�dicaments ? */
SELECT MIN(prix_dose) as min, MAX(prix_dose) as max 
FROM medicament


/* 10. Dur�e moyenne des traitements pour chaque m�dicament ? */
SELECT designation, AVG(posologie) as dureeMoy 
FROM prescription 
GROUP by designation


/* 11. Combien de patients de chaque sexe ? */
select count(*) as nb, sexe
from patient
group by sexe

/* 12. Nom des m�dicaments dont la moyenne de dur�e de prescription est sup�rieure � 10 jours ? */  
SELECT designation, AVG(duree) as dureeMoy
FROM prescription 
GROUP BY designation 
HAVING AVG(duree) > 10


/* 13. Afficher le nom, le pr�nom et l��ge des patients � seniors � (�ge sup�rieur � 60 ans) qui sont des hommes */
SELECT nom, pr�nom, datediff(yy, DateNaiss, getdate()) as age 
FROM patient 
WHERE datediff(yy, DateNaiss, getdate()) > 60 and sexe like 'M'


/* 14. Afficher le nom et le pr�nom des patients dont aucun dossier d�Hospitalisation n�existe */
SELECT nom, pr�nom 
FROM Patient
WHERE idPatient NOT IN
(SELECT idPatient
FROM Hospitalisation);

/* 15. Afficher les d�signations des m�dicaments antalgiques et des m�dicaments avec prescription courte (jusqu�� 6 jours) */
SELECT Designation 
FROM Medicament 
WHERE Indication LIKE 'Antalgique' 
UNION 
SELECT Designation 
FROM Prescription 
WHERE Duree<7

/* 16. Pathologie la plus soign�e au sein de l�H�pital ? */
SELECT Pathologie 
FROM Hospitalisation 
GROUP BY Pathologie
HAVING COUNT(NumDossier)>= all 
(SELECT COUNT(NumDossier)
FROM Hospitalisation
GROUP BY Pathologie);

/* 17. Pour chaque m�decin afficher le nom du service auquel il est rattach� */
SELECT Nom, Pr�nom, Nomserv 
FROM Service 
inner join Medecin 
ON Service.numserv=medecin.numserv;

/* 18. �crire la requ�te qui permet d'obtenir pour chaque patient le nom du service dans lequel il est ou a �t� hospitalis� */
SELECT DISTINCT nom, Pr�nom, Nomserv 
FROM Patient P
inner join Hospitalisation H ON P.idPatient=H.idPatient 
inner join LitService LS ON H.NumLit=LS.NumLit 
inner join Service S ON LS.numserv=S.numserv;

/* 19. Afficher le nom et le pr�nom du m�decin qui a fait une radio � "Lucr�ce Marat"  */
SELECT M.Nom, M.Pr�nom
FROM Medecin M
INNER JOIN Actes A ON M.NumMed = A.NumMed
INNER JOIN Hospitalisation H ON A.NumDossier=H.NumDossier
INNER JOIN Patient P ON H.idPatient=P.idPatient
WHERE A.Type like 'radio'
AND P.Nom LIKE 'Marat'
AND P.Pr�nom LIKE 'Lucr_ce';

/* 20. M�dicaments prescrits au moins une fois avec leur description ? */
SELECT DISTINCT M.*
FROM Medicament M
INNER JOIN  Prescription P ON P.Designation= M.Designation;

/* 21. Patients ayant consomm� un antalgique ? */
select nom, pr�nom
from Patient p 
inner join Hospitalisation h on h.idPatient=p.idPatient
inner join Prescription pr on pr.NumDossier=h.NumDossier
inner join Medicament m on m.Designation = pr.Designation
where m.designation like 'antalgique';

/* 22. Patients n�ayant pas consomm� de m�dicaments ? */
select nom, pr�nom
from Patient p
inner join Hospitalisation h on h.idPatient=p.idPatient
where not exists ( select NumDossier from Prescription pr where h.numdossier = pr.NumDossier);

/* 23. Patients pr�sentant la m�me allergie ? */
select p1.nom, p2.nom, p1.AllergiesCI, p2.AllergiesCI
from patient p1
inner join patient p2 on p1.AllergiesCI=p2.AllergiesCI
where p1.Nom < p2.Nom
order by p1.AllergiesCI, p2.AllergiesCI;

/* 24. Montant des Actes pour chaque patient ? */
select nom, pr�nom, sum (t.prix) as montant
from Patient p 
inner join Hospitalisation h on h.idPatient= p.idPatient
inner join Actes a on a.NumDossier=h.NumDossier
inner join Tarifs t on a.Type=t.Type
group by nom, pr�nom;

/* 25. Montant des frais d�hospitalisation (hors m�dicaments) pour chaque patient. La journ�e d�hospitalisation est factur�e 20� */
select idpatient, DATEDIFF(DAY, Date_ent, Date_Sort) as duree,
case when 
	DATEDIFF(DAY, Date_ent, Date_Sort) > 0
	then DATEDIFF(DAY, Date_ent, Date_Sort)*20
	else 10
end as frais_hospitalisation
from hospitalisation;

/* 26. Montant des frais d�hospitalisation et des Actes (deux colonnes) pour chaque patient. */
select upper(nom), pr�nom,  DATEDIFF(DAY, Date_ent, Date_Sort) as duree,  sum (t.prix) as montant,
case when  DATEDIFF(DAY, Date_ent, Date_Sort) = 0 then 10 else DATEDIFF(DAY, Date_ent, Date_Sort)*20
end as cout_hospi
from patient p
left outer join Hospitalisation h on h.idPatient=p.idPatient
left outer join actes a on a.numdossier = h.NumDossier
left outer join Tarifs t on t.Type=a.type
group by Nom, Pr�nom, Date_Ent, Date_Sort;