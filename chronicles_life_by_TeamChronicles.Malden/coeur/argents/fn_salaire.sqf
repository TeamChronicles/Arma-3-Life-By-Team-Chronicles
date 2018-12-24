/*
    File: salaire.sqf
    Auteur: Jack Lania | Team-Chronicles.fr

    Description:
    salaire, boucle qui genere de l'argent en banque
*/

sleep 10;
if (alive player) then
	{
		ch_argent_banque = ch_argent_banque + 1200;
	} else
	{
		hint localize"STR_Pas_De_Salaire_tu_es_mort";
	};
call argents_fnc_salaire
