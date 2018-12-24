/*
    File: init.sqf
    Auteur: Jack Lania | Team-Chronicles.fr

    Description:
    init
*/

diag_log "------------------------------------------------------------------------------------------------------";
diag_log "------------------------------- Start Init Life By Team-Chronicles------------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";



private _return = false;

if ( isNil {uiNamespace getVariable "extDB_SQL_CUSTOM_ID"}) then
{
	private _result = "extDB3" callExtension "9:VERSION";
	diag_log format ["extDB3: Version: %1", _result];
	if (_result == "") exitWith {diag_log "extDB3: echec du chargement de l'extension"; false};
	if ((parseNumber _result) < 1.026) exitWith {diag_log "Erreur: extDB3 version 1.026 ou superieur requis";};

	private _database = "chronicles_life_bdd"; // Nom de la base de donnée

	// extDB3 Connection vers Database
	_result = call compile ("extDB3" callExtension format["9:ADD_DATABASE:%1", _database]);
	if (_result select 0 isEqualTo 0) exitWith {diag_log format ["extDB3: Erreur de connexion a la base de donnees impossible: %1", _result]; false};
	diag_log "extDB3: Connecte a la base de donnees";

	_result = call compile ("extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL:SQL:%2", _database]);
	if ((_result select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Configuration de la base de donnees d'erreur: %1", _result]; false};

	diag_log format ["extDB3: Protocole CUSTOM SQL initialise"];

	"extDB3" callExtension "9:LOCK";
	diag_log "extDB3: Verrouiller";
	_return = true;
}
else
{
	diag_log "extDB3: Déjà installé";
	_return = true;
};

_return
