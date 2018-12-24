/*
    File: initServer.sqf
    Auteur: Jack Lania | Team-Chronicles.fr

    Description:
    initServer rien n'a dire plus
*/

if (isServer) then
{
	[] call compile PreprocessFileLineNumbers "serveur\init_serveur.sqf";
};
