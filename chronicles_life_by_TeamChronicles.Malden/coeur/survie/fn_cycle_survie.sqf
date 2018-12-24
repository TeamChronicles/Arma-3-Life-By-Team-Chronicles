/*
    File: cycle_survie.sqf
    Auteur: Jack Lania | Team-Chronicles.fr

    Description:
    cycle_survie, boucle qui fait perdre de la faim et de la soif
*/
sleep 300;

if (ch_faim > 0) then
{
    ch_faim = ch_faim - 1;
    if (ch_faim > 75) then
        {
            hint localize "STR_Pas_Faim";
        } else {
            if (ch_faim > 50) then
            {
                hint localize "STR_Un_Peu_Faim";
            } else {
                if (ch_faim > 25) then
                {
                    hint localize "STR_Tu_As_Faim";
                } else {
                    if (ch_faim > 1) then
                    {
                        hint localize "STR_Meur_de_Faim";
                    } else {};
                };
            };
        };
}
else
{
    hint localize "STR_mort_faim";
    player setDamage 1;
};

if (ch_soif > 0) then
{
    ch_soif = ch_soif - 2;
    if (ch_soif > 75) then
    	{
    		hint localize "STR_Pas_Soif";
    	} else {
    		if (ch_soif > 50) then
    		{
    			hint localize "STR_Un_Peu_Soif";
    		} else {
    			if (ch_soif > 25) then
    			{
    				hint localize "STR_Tu_As_Soif";
    			} else {
    				if (ch_soif > 1) then
    				{
    					hint localize "STR_Meur_de_Soif";
    				} else {};
    			};
    		};
    	};

call survie_fnc_cycle_survie

}
else
{
    hint localize "STR_mort_Soif";
    player setDamage 1;
};