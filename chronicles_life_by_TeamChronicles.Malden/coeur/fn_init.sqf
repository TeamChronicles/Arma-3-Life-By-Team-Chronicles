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
	// extDB3 Version Check
	private _result = "extDB3" callExtension "9:VERSION";
	diag_log format ["extDB3: Version: %1", _result];
	if (_result == "") exitWith {diag_log "extDB3: Échec du chargement de l'extension"; false};
	if ((parseNumber _result) < 1.026) exitWith {diag_log "Erreur: extDB3 version 1.026 ou supérieur requis";};


	// extDB3 Load Protocol
	private _database = "chronicles_life_bdd"; // Nom de la base de donnée

	// extDB3 Connection vers Database
	_result = call compile ("extDB3" callExtension format["9:ADD_DATABASE:%1", _database]);
	if (_result select 0 isEqualTo 0) exitWith {diag_log format ["extDB3: Erreur de connexion à la base de données impossible: %1", _result]; false};
	diag_log "extDB3: Connecté à la base de données";

	_result = call compile ("extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL:SQL:%2", _database]);
	if ((_result select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Configuration de la base de données d'erreur: %1", _result]; false};

	diag_log format ["extDB3: Protocole CUSTOM SQL initialisé"];

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