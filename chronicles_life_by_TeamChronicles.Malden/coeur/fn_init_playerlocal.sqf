/*
    File: init_playerlocal.sqf
    Auteur: Jack Lania | Team-Chronicles.fr

    Description:
    init_playerlocal, script qui initialise les variables par default
*/

ch_argent_liquide = 0;
ch_argent_banque = 0;
ch_argent_sale = 0;
ch_faim = 100;
ch_soif = 100;


call survie_fnc_cycle_survie
call argents_fnc_init_argents