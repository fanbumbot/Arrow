#include <a_samp>

//0 - мод камеры
//1 - мод поворота
#define ARROW_MODE 1

//Частота обновления
#define ARROW_UPDATE 50

new timer;

new PlayerText:arrowtd[MAX_PLAYERS][2];

new Float:point[3] = {0.0, 0.0, 3.0};

new chet[MAX_PLAYERS];

new Float:x, Float:y, Float:z;
#if ARROW_MODE == 0
new Float:cx, Float:cy, Float:cz;
#endif
new Float:arrowangle;

stock ArrowTDCreate(playerid)
{
	for(new i = 0; i < 2; i++)
	{
		arrowtd[playerid][i] = CreatePlayerTextDraw(playerid, 385.625000, 179.666625, "_");
		PlayerTextDrawBackgroundColor(playerid, arrowtd[playerid][i], 0x00000000);
		PlayerTextDrawLetterSize(playerid, arrowtd[playerid][i], 0.449999, 1.600000);
		PlayerTextDrawTextSize(playerid, arrowtd[playerid][i], 120.625000, 109.083312);
		PlayerTextDrawAlignment(playerid, arrowtd[playerid][i], 1);
		PlayerTextDrawColor(playerid, arrowtd[playerid][i], -1);
		PlayerTextDrawFont(playerid, arrowtd[playerid][i], 5);
		PlayerTextDrawSetProportional(playerid, arrowtd[playerid][i], 1);
		PlayerTextDrawSetPreviewModel(playerid, arrowtd[playerid][i], 19133);
		PlayerTextDrawSetPreviewRot(playerid, arrowtd[playerid][i], 270.000000, 0.000000, 90.000000, 1.000000);
	}
	return 1;
}

public OnFilterScriptInit()
{
    timer = SetTimer("ArrowUpdate", ARROW_UPDATE, 1);
	for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
	    if(!IsPlayerConnected(playerid))    continue;
	    
	    ArrowTDCreate(playerid);

	    PlayerTextDrawShow(playerid, arrowtd[playerid][0]);
	    PlayerTextDrawShow(playerid, arrowtd[playerid][1]);
	}
	return 1;
}

public OnFilterScriptExit()
{
	KillTimer(timer);
	for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
	    if(!IsPlayerConnected(playerid))    continue;

	 	PlayerTextDrawHide(playerid, arrowtd[playerid][0]);
	    PlayerTextDrawHide(playerid, arrowtd[playerid][1]);
	    
	    PlayerTextDrawDestroy(playerid, arrowtd[playerid][0]);
    	PlayerTextDrawDestroy(playerid, arrowtd[playerid][1]);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
    ArrowTDCreate(playerid);

    PlayerTextDrawShow(playerid, arrowtd[playerid][0]);
    PlayerTextDrawShow(playerid, arrowtd[playerid][1]);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawHide(playerid, arrowtd[playerid][0]);
    PlayerTextDrawHide(playerid, arrowtd[playerid][1]);

    PlayerTextDrawDestroy(playerid, arrowtd[playerid][0]);
    PlayerTextDrawDestroy(playerid, arrowtd[playerid][1]);
	return 1;
}

forward ArrowUpdate();
public ArrowUpdate()
{
	for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
	    if(!IsPlayerConnected(playerid))    continue;
	    
		GetPlayerPos(playerid, x, y, z);
#if ARROW_MODE == 0
		GetPlayerCameraFrontVector(playerid, cx, cy, cz);

        if(cy > 0.0)    arrowangle = acos(cx);
            else    arrowangle = -acos(cx);
#else

		if(GetPlayerVehicleID(playerid))	GetVehicleZAngle(GetPlayerVehicleID(playerid), arrowangle);
		    else    GetPlayerFacingAngle(playerid, arrowangle);

        arrowangle -= atan2(point[1]-y, point[0]-x)-90.0;
#endif

		//x - поворот вперёд, назад; y - поворот по часовой, против часовой; z - поворот по вертикали

        chet[playerid]++;
        if(chet[playerid] < 2)
        {
            PlayerTextDrawSetPreviewRot(playerid, arrowtd[playerid][0], 240.0, arrowangle+0.0, 90.0, 1.000000);
		    PlayerTextDrawHide(playerid, arrowtd[playerid][0]);
      		PlayerTextDrawShow(playerid, arrowtd[playerid][0]);
		}
		else
		{
		    chet[playerid] = 0;
		    PlayerTextDrawSetPreviewRot(playerid, arrowtd[playerid][1], 240.0, arrowangle+0.0, 90.0, 1.000000);
	        PlayerTextDrawHide(playerid, arrowtd[playerid][1]);
	        PlayerTextDrawShow(playerid, arrowtd[playerid][1]);
		}
	}
	return 1;
}






