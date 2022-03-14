/*
*	 Black Ops 2 - GSC Studio by iMCSx
*
*	 Creator : Kalitos
*	 Project : GunRotationIW5
* 	 Mode : Multiplayer
*	 Date : 2021/06/04 - 07:30:22	
*
*/	

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

init()
{	
	if (GetDvar("g_gametype") == "infect")
	{        					  		
		level.ChangeInterval = 30;
		level.Secondary = "iw5_p99_mp_akimbo";
		level.NextPrimary ="";
		level.PrimaryFullName ="";
		level.GlobalCurrentGun ="";				
		////////////////////////
		init_Weapons();
		init_GunNames();				
		/////////////////////// 			
		if (level.ChangeInterval <= 30)
			level.ChangeInterval = 30;
		level thread onPlayerConnect();    			
		level thread rotateGuns();   
		level thread destroyAll();		
	} 		
}


rotateGuns()
{
	level endon("game_ended");
	level waittill("prematch_over");
	
	///////////
	level.PrimaryFullName = level.Weapons[randomInt(level.Weapons.size)];
	level.GunNameHUD = CreateServerFontString("hudbig", 0.5f);	
	level.GunNameHUD SetPoint("TOP", "TOP", 250, 10);
	level.GunNameHUD SetText(GetGunName(level.PrimaryFullName));
	level.MainHUD = CreateServerFontString("hudbig", 0.5f);
	level.MainHUD SetPoint("TOP", "TOP", 180, 10);
	level.MainHUD SetText("Next gun: ");
	level.ChangingIn = CreateServerFontString("hudbig", 0.5f);
	level.ChangingIn SetPoint("TOP", "TOP", 180, 25);
	level.ChangingIn SetText("Changing in: ");
	level.SecondsNumber = CreateServerFontString("hudbig", 0.5f);
	level.SecondsNumber SetPoint("TOP", "TOP", 223, 25);
	level.SecondsNumber SetText("30");
	level.Seconds = CreateServerFontString("hudbig", 0.5f);
	level.Seconds SetPoint("TOP", "TOP", 260, 25);
	level.Seconds SetText("second(s)");
	//level.MainHUD1 = CreateServerFontString("hudbig", 0.5f);
	//level.MainHUD1 SetPoint("TOP", "TOP", 180, 40);
	//level.MainHUD1 SetText("Current gun: ");
	//level.GunNameHUD1 = CreateServerFontString("hudbig", 0.5f);
	///////////
	//dato=0;
	passedTime=0;
	while(true)
	{
		passedTime +=1;
		if(passedTime == level.ChangeInterval)
		{
			passedTime=0;
			foreach ( player in level.players )
			    {
				    if ( player.team == "allies" )
				    	{				    
				        	if (isDefined(player.hadgunsrotated) && player.hadgunsrotated == 0)
						{										
							player TakeWeapon(player.primaryWeapon);
							player TakeWeapon(player.secondaryWeapon);
							player SetPerk("specialty_fastreload", true, false);
							player SetPerk("specialty_quickswap", true, false);
						}
						else
						{
							player TakeWeapon(level.GlobalCurrentGun);
							player TakeWeapon(level.Secondary);
							if (player.primaryWeapon == "iw5_usp45jugg_mp" && player.primaryWeapon == "iw5_riotshieldjugg_mp")
							{
								player TakeWeapon("iw5_usp45jugg_mp");
								player TakeWeapon("iw5_riotshieldjugg_mp");
								player SetPerk("specialty_fastreload", true, false);
								player SetPerk("specialty_quickswap", true, false);
							}
							if (player.primaryWeapon ==  "iw5_m60jugg_mp" && player.primaryWeapon == "iw5_mp412jugg_mp")
							{
								player TakeWeapon("iw5_m60jugg_mp");
								player TakeWeapon("iw5_mp412jugg_mp");
								player SetPerk("specialty_fastreload", true, false);
								player SetPerk("specialty_quickswap", true, false);
							}
							if (player.primaryWeapon == "iw5_g36c_mp_m320_reflex" && player.primaryWeapon == "iw5_pp90m1_mp")
							{
								player TakeWeapon("iw5_g36c_mp_m320_reflex");
								player TakeWeapon("iw5_pp90m1_mp");
								player SetPerk("specialty_fastreload", true, false);
								player SetPerk("specialty_quickswap", true, false);
							}
						}
							player giveWeapon(level.PrimaryFullName);
							player giveWeapon(level.Secondary);
							player giveStartAmmo(level.PrimaryFullName);								
							player giveStartAmmo(level.Secondary);	

							player SwitchToWeaponImmediate(level.PrimaryFullName);
							player.hadgunsrotated = 1;
						}
			    }
			  
		    level.GlobalCurrentGun = level.PrimaryFullName;
		    
		    
			while(true)		
			{
				level.PrimaryFullName = level.Weapons[randomInt(level.Weapons.size)];
				if(GetGunName(level.GlobalCurrentGun) != GetGunName(level.PrimaryFullName) && level.PrimaryFullName != level.Secondary)
				break;
				
			}			
				level.GunNameHUD SetPoint("TOP", "TOP", 250, 10);				
				level.GunNameHUD SetText(GetGunName(level.PrimaryFullName));							 
		}
		level.SecondsNumber SetText(level.ChangeInterval - passedTime);
		wait 1;
	}
	 
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);        
        player.hadgunsrotated = 0;        
    }
}

HadGunsRotated(player)
{
	if (isDefined(player.hadgunsrotated) && player.hadgunsrotated != 0)
	{
		return true;
	}else{
		return false;
	}			
}

		
GetGunName(FullName)
{
	textSearch ="";
	key = strTok(FullName,"_");
	if(isSubstr( FullName, "iw5_")) 
	{		         
         textSearch= key[1];
    }else{		     	
         textSearch= key[0];
    }
    for(i=0; i< level.GunNames.size;i++)
    {
    	if(level.GunNames[i]== textSearch)
    	return level.GunNames2[i];
    }
   	
}


inArray(array, text)
{
    for(i=0; i<array.size; i++)
    {
        if(array[i] == text)
          return true;
    }
    return false;
}

destroyAll()
{
	level waittill("game_ended");
	level endon("realized");	
		
		level.GunNameHUD destroy();		
		level.MainHUD destroy();		
		level.ChangingIn destroy();	
		level.SecondsNumber destroy();		
		level.Seconds destroy();		
		wait 1;		
		level notify("realized");						
}

init_Weapons()
{
	level.Weapons= [];
	level.Weapons[level.Weapons.size]="iw5_acr_mp_camo01";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_reflex_camo02";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_silencer_camo03";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_m320_camo04";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_acog_camo05";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_heartbeat_camo06";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_eotech_camo07";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_shotgun_camo08";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_hybrid_camo09";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_xmags_camo10";
	level.Weapons[level.Weapons.size]="iw5_acr_mp_thermal_camo11";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_camo12";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_reflex_camo13";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_silencer_camo01";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_m320_camo02";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_acog_camo03";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_heartbeat_camo04";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_eotech_camo05";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_shotgun_camo06";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_hybrid_camo07";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_xmags_camo08";
	level.Weapons[level.Weapons.size]="iw5_type95_mp_thermal_camo09";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_camo10";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_reflex_camo11";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_silencer_camo12";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_gl_camo13";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_acog_camo01";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_heartbeat_camo02";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_eotech_camo03";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_shotgun_camo04";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_hybrid_camo05";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_xmags_camo06";
	level.Weapons[level.Weapons.size]="iw5_m4_mp_thermal_camo07";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_camo08";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_reflex_camo09";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_silencer_camo10";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_gp25_camo11";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_acog_camo12";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_heartbeat_camo13";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_eotech_camo01";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_shotgun_camo02";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_hybrid_camo03";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_xmags_camo04";
	level.Weapons[level.Weapons.size]="iw5_ak47_mp_thermal_camo05";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_camo06";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_reflex_camo07";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_silencer_camo08";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_gl_camo09";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_acog_camo10";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_heartbeat_camo11";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_eotech_camo12";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_shotgun_camo13";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_hybrid_camo01";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_xmags_camo02";
	level.Weapons[level.Weapons.size]="iw5_m16_mp_thermal_camo03";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_camo04";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_reflex_camo05";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_silencer_camo06";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_m320_camo07";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_acog_camo08";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_heartbeat_camo09";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_eotech_camo10";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_shotgun_camo11";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_hybrid_camo12";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_xmags_camo13";
	level.Weapons[level.Weapons.size]="iw5_mk14_mp_thermal_camo01";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_camo02";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_reflex_camo03";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_silencer_camo04";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_m320_camo05";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_acog_camo06";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_heartbeat_camo07";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_eotech_camo08";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_shotgun_camo09";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_hybrid_camo10";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_xmags_camo11";
	level.Weapons[level.Weapons.size]="iw5_g36c_mp_thermal_camo12";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_camo13";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_reflex_camo01";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_silencer_camo02";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_m320_camo03";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_acog_camo04";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_heartbeat_camo05";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_eotech_camo06";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_shotgun_camo07";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_hybrid_camo08";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_xmags_camo09";
	level.Weapons[level.Weapons.size]="iw5_scar_mp_thermal_camo10";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_camo11";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_reflex_camo12";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_silencer_camo13";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_m320_camo01";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_acog_camo02";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_heartbeat_camo03";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_eotech_camo04";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_shotgun_camo05";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_hybrid_camo06";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_xmags_camo07";
	level.Weapons[level.Weapons.size]="iw5_fad_mp_thermal_camo08";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_camo09";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_reflex_camo10";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_silencer_camo11";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_m320_camo12";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_acog_camo13";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_heartbeat_camo01";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_eotech_camo02";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_shotgun_camo03";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_hybrid_camo04";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_xmags_camo05";
	level.Weapons[level.Weapons.size]="iw5_cm901_mp_thermal_camo06";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_camo07";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_reflexsmg_camo08";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_silencer_camo09";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_rof_camo10";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_acogsmg_camo11";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_eotechsmg_camo12";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_hamrhybrid_camo13";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_xmags_camo01";
	level.Weapons[level.Weapons.size]="iw5_mp5_mp_thermalsmg_camo02";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_camo03";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_reflexsmg_camo04";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_silencer_camo05";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_rof_camo06";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_acogsmg_camo07";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_eotechsmg_camo08";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_hamrhybrid_camo09";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_xmags_camo10";
	level.Weapons[level.Weapons.size]="iw5_p90_mp_thermalsmg_camo11";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_camo12";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_reflexsmg_camo13";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_silencer_camo01";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_rof_camo02";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_acogsmg_camo03";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_eotechsmg_camo04";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_hamrhybrid_camo05";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_xmags_camo06";
	level.Weapons[level.Weapons.size]="iw5_m9_mp_thermalsmg_camo07";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_camo08";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_reflexsmg_camo09";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_silencer_camo10";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_rof_camo11";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_acogsmg_camo12";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_eotechsmg_camo13";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_hamrhybrid_camo01";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_xmags_camo02";
	level.Weapons[level.Weapons.size]="iw5_pp90m1_mp_thermalsmg_camo03";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_camo04";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_reflexsmg_camo05";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_silencer_camo06";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_rof_camo07";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_acogsmg_camo08";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_eotechsmg_camo09";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_hamrhybrid_camo10";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_xmags_camo11";
	level.Weapons[level.Weapons.size]="iw5_ump45_mp_thermalsmg_camo12";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_camo13";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_reflexsmg_camo01";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_silencer_camo02";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_rof_camo03";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_acogsmg_camo04";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_eotechsmg_camo05";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_hamrhybrid_camo06";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_xmags_camo07";
	level.Weapons[level.Weapons.size]="iw5_mp7_mp_thermalsmg_camo08";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_camo09";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_reflexsmg_camo10";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_silencer_camo11";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_rof_camo12";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_acogsmg_camo13";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_eotechsmg_camo01";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_xmags_camo02";
	level.Weapons[level.Weapons.size]="iw5_ak74u_mp_thermalsmg_camo03";
	level.Weapons[level.Weapons.size]="iw5_spas12_mp_camo04";
	level.Weapons[level.Weapons.size]="iw5_spas12_mp_grip_camo05";
	level.Weapons[level.Weapons.size]="iw5_spas12_mp_reflex_camo06";
	level.Weapons[level.Weapons.size]="iw5_spas12_mp_eotech_camo07";
	level.Weapons[level.Weapons.size]="iw5_spas12_mp_xmags_camo08";
	level.Weapons[level.Weapons.size]="iw5_spas12_mp_silencer03_camo09";
	level.Weapons[level.Weapons.size]="iw5_aa12_mp_camo10";
	level.Weapons[level.Weapons.size]="iw5_aa12_mp_grip_camo11";
	level.Weapons[level.Weapons.size]="iw5_aa12_mp_reflex_camo12";
	level.Weapons[level.Weapons.size]="iw5_aa12_mp_eotech_camo13";
	level.Weapons[level.Weapons.size]="iw5_aa12_mp_xmags_camo01";
	level.Weapons[level.Weapons.size]="iw5_aa12_mp_silencer03_camo02";
	level.Weapons[level.Weapons.size]="iw5_striker_mp_camo03";
	level.Weapons[level.Weapons.size]="iw5_striker_mp_grip_camo04";
	level.Weapons[level.Weapons.size]="iw5_striker_mp_reflex_camo05";
	level.Weapons[level.Weapons.size]="iw5_striker_mp_eotech_camo06";
	level.Weapons[level.Weapons.size]="iw5_striker_mp_xmags_camo07";
	level.Weapons[level.Weapons.size]="iw5_1887_mp_camo08";
	level.Weapons[level.Weapons.size]="iw5_usas12_mp_camo09";
	level.Weapons[level.Weapons.size]="iw5_usas12_mp_grip_camo10";
	level.Weapons[level.Weapons.size]="iw5_usas12_mp_reflex_camo11";
	level.Weapons[level.Weapons.size]="iw5_usas12_mp_eotech_camo12";
	level.Weapons[level.Weapons.size]="iw5_usas12_mp_xmags_camo13";
	level.Weapons[level.Weapons.size]="iw5_usas12_mp_silencer03_camo01";
	level.Weapons[level.Weapons.size]="iw5_ksg_mp_camo02";
	level.Weapons[level.Weapons.size]="iw5_ksg_mp_grip_camo03";
	level.Weapons[level.Weapons.size]="iw5_ksg_mp_reflex_camo04";
	level.Weapons[level.Weapons.size]="iw5_ksg_mp_eotech_camo05";
	level.Weapons[level.Weapons.size]="iw5_ksg_mp_xmags_camo06";
	level.Weapons[level.Weapons.size]="iw5_ksg_mp_silencer03_camo07";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_camo08";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_reflexlmg_camo09";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_silencer_camo10";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_grip_camo11";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_acog_camo12";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_rof_camo13";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_eotechlmg_camo01";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_xmags_camo02";
	level.Weapons[level.Weapons.size]="iw5_m60_mp_thermal_camo03";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_camo04";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_reflexlmg_camo05";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_silencer_camo06";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_grip_camo07";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_acog_camo08";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_rof_camo09";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_eotechlmg_camo10";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_xmags_camo11";
	level.Weapons[level.Weapons.size]="iw5_pecheneg_mp_thermal_camo12";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_camo13";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_reflexlmg_camo01";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_silencer_camo02";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_grip_camo03";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_acog_camo04";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_rof_camo05";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_heartbeat_camo06";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_eotechlmg_camo07";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_xmags_camo08";
	level.Weapons[level.Weapons.size]="iw5_mk46_mp_thermal_camo09";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_camo10";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_reflexlmg_camo11";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_silencer_camo12";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_grip_camo13";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_acog_camo01";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_rof_camo02";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_heartbeat_camo03";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_eotechlmg_camo04";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_xmags_camo05";
	level.Weapons[level.Weapons.size]="iw5_sa80_mp_thermal_camo06";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_camo07";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_reflexlmg_camo08";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_silencer_camo09";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_grip_camo10";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_acog_camo11";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_rof_camo12";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_heartbeat_camo13";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_eotechlmg_camo01";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_xmags_camo02";
	level.Weapons[level.Weapons.size]="iw5_mg36_mp_thermal_camo03";
	level.Weapons[level.Weapons.size]="iw5_barrett_mp_barrettscope_camo04";
	level.Weapons[level.Weapons.size]="iw5_barrett_mp_acog_camo05";
	level.Weapons[level.Weapons.size]="iw5_barrett_mp_barrettscope_heartbeat_camo06";
	level.Weapons[level.Weapons.size]="iw5_barrett_mp_barrettscope_xmags_camo07";
	level.Weapons[level.Weapons.size]="iw5_barrett_mp_thermal_camo08";
	level.Weapons[level.Weapons.size]="iw5_barrett_mp_barrettscopevz_camo09";
	level.Weapons[level.Weapons.size]="iw5_barrett_mp_barrettscope_silencer03_camo10";
	level.Weapons[level.Weapons.size]="iw5_msr_mp_msrscope_camo11";
	level.Weapons[level.Weapons.size]="iw5_msr_mp_acog_camo12";
	level.Weapons[level.Weapons.size]="iw5_msr_mp_heartbeat_msrscope_camo13";
	level.Weapons[level.Weapons.size]="iw5_msr_mp_msrscope_xmags_camo01";
	level.Weapons[level.Weapons.size]="iw5_msr_mp_thermal_camo02";
	level.Weapons[level.Weapons.size]="iw5_msr_mp_msrscopevz_camo03";
	level.Weapons[level.Weapons.size]="iw5_msr_mp_msrscope_silencer03_camo04";
	level.Weapons[level.Weapons.size]="iw5_rsass_mp_rsassscope_camo05";
	level.Weapons[level.Weapons.size]="iw5_rsass_mp_acog_camo06";
	level.Weapons[level.Weapons.size]="iw5_rsass_mp_heartbeat_rsassscope_camo07";
	level.Weapons[level.Weapons.size]="iw5_rsass_mp_rsassscope_xmags_camo08";
	level.Weapons[level.Weapons.size]="iw5_rsass_mp_thermal_camo09";
	level.Weapons[level.Weapons.size]="iw5_rsass_mp_rsassscopevz_camo10";
	level.Weapons[level.Weapons.size]="iw5_rsass_mp_rsassscope_silencer03_camo11";
	level.Weapons[level.Weapons.size]="iw5_dragunov_mp_dragunovscope_camo12";
	level.Weapons[level.Weapons.size]="iw5_dragunov_mp_acog_camo13";
	level.Weapons[level.Weapons.size]="iw5_dragunov_mp_dragunovscope_heartbeat_camo01";
	level.Weapons[level.Weapons.size]="iw5_dragunov_mp_dragunovscope_xmags_camo02";
	level.Weapons[level.Weapons.size]="iw5_dragunov_mp_thermal_camo03";
	level.Weapons[level.Weapons.size]="iw5_dragunov_mp_dragunovscopevz_camo04";
	level.Weapons[level.Weapons.size]="iw5_dragunov_mp_dragunovscope_silencer03_camo05";
	level.Weapons[level.Weapons.size]="iw5_cheytac_mp_cheytacscope_camo06";
	level.Weapons[level.Weapons.size]="iw5_cheytac_mp_acog_camo07";
	level.Weapons[level.Weapons.size]="iw5_cheytac_mp_cheytacscope_heartbeat_camo08";
	level.Weapons[level.Weapons.size]="iw5_cheytac_mp_cheytacscope_xmags_camo09";
	level.Weapons[level.Weapons.size]="iw5_cheytac_mp_thermal_camo10";
	level.Weapons[level.Weapons.size]="iw5_cheytac_mp_cheytacscopevz_camo11";
	level.Weapons[level.Weapons.size]="iw5_cheytac_mp_cheytacscope_silencer03_camo12";
	level.Weapons[level.Weapons.size]="iw5_as50_mp_as50scope_camo13";
	level.Weapons[level.Weapons.size]="iw5_as50_mp_acog_camo01";
	level.Weapons[level.Weapons.size]="iw5_as50_mp_as50scope_heartbeat_camo02";
	level.Weapons[level.Weapons.size]="iw5_as50_mp_as50scope_xmags_camo03";
	level.Weapons[level.Weapons.size]="iw5_as50_mp_thermal_camo04";
	level.Weapons[level.Weapons.size]="iw5_as50_mp_as50scopevz_camo05";
	level.Weapons[level.Weapons.size]="iw5_as50_mp_as50scope_silencer03_camo06";
	level.Weapons[level.Weapons.size]="iw5_l96a1_mp_l96a1scope_camo07";
	level.Weapons[level.Weapons.size]="iw5_l96a1_mp_acog_camo08";
	level.Weapons[level.Weapons.size]="iw5_l96a1_mp_heartbeat_l96a1scope_camo09";
	level.Weapons[level.Weapons.size]="iw5_l96a1_mp_l96a1scope_xmags_camo10";
	level.Weapons[level.Weapons.size]="iw5_l96a1_mp_thermal_camo11";
	level.Weapons[level.Weapons.size]="iw5_l96a1_mp_l96a1scopevz_camo12";
	level.Weapons[level.Weapons.size]="iw5_l96a1_mp_l96a1scope_silencer03_camo13";
	level.Weapons[level.Weapons.size]="iw5_usp45_mp";
	level.Weapons[level.Weapons.size]="iw5_usp45_mp_silencer02";
	level.Weapons[level.Weapons.size]="iw5_usp45_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_usp45_mp_tactical";
	level.Weapons[level.Weapons.size]="iw5_usp45_mp_xmags";
	level.Weapons[level.Weapons.size]="iw5_mp412_mp";
	level.Weapons[level.Weapons.size]="iw5_mp412_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_mp412_mp_tactical";
	level.Weapons[level.Weapons.size]="iw5_44magnum_mp";
	level.Weapons[level.Weapons.size]="iw5_44magnum_mp_tactical";
	level.Weapons[level.Weapons.size]="iw5_44magnum_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_deserteagle_mp";
	level.Weapons[level.Weapons.size]="iw5_deserteagle_mp_tactical";
	level.Weapons[level.Weapons.size]="iw5_deserteagle_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_p99_mp";
	level.Weapons[level.Weapons.size]="iw5_p99_mp_silencer02";
	level.Weapons[level.Weapons.size]="iw5_p99_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_p99_mp_tactical";
	level.Weapons[level.Weapons.size]="iw5_p99_mp_xmags";
	level.Weapons[level.Weapons.size]="iw5_fnfiveseven_mp";
	level.Weapons[level.Weapons.size]="iw5_fnfiveseven_mp_silencer02";
	level.Weapons[level.Weapons.size]="iw5_fnfiveseven_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_fnfiveseven_mp_tactical";
	level.Weapons[level.Weapons.size]="iw5_fnfiveseven_mp_xmags";
	level.Weapons[level.Weapons.size]="iw5_fmg9_mp";
	level.Weapons[level.Weapons.size]="iw5_fmg9_mp_silencer02";
	level.Weapons[level.Weapons.size]="iw5_fmg9_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_fmg9_mp_xmags";
	level.Weapons[level.Weapons.size]="iw5_g18_mp";
	level.Weapons[level.Weapons.size]="iw5_g18_mp_silencer02";
	level.Weapons[level.Weapons.size]="iw5_g18_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_g18_mp_xmags";
	level.Weapons[level.Weapons.size]="iw5_mp9_mp";
	level.Weapons[level.Weapons.size]="iw5_mp9_mp_silencer02";
	level.Weapons[level.Weapons.size]="iw5_mp9_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_mp9_mp_xmags";
	level.Weapons[level.Weapons.size]="iw5_skorpion_mp";
	level.Weapons[level.Weapons.size]="iw5_skorpion_mp_silencer02";
	level.Weapons[level.Weapons.size]="iw5_skorpion_mp_akimbo";
	level.Weapons[level.Weapons.size]="iw5_skorpion_mp_xmags";
	level.Weapons[level.Weapons.size]="riotshield_mp";
	level.Weapons[level.Weapons.size]="rpg_mp";
	level.Weapons[level.Weapons.size]="iw5_smaw_mp";
	level.Weapons[level.Weapons.size]="m320_mp";
	level.Weapons[level.Weapons.size]="xm25_mp";
	level.Weapons[level.Weapons.size]="defaultweapon_mp";
	level.Weapons[level.Weapons.size]="ac130_25mm_mp";
}

init_GunNames()
{
	level.GunNames = [];
	level.GunNames2 = [];
	level.GunNames[level.GunNames.size]="acr";
	level.GunNames2[level.GunNames2.size]="ACR 6.8"; 
	level.GunNames[level.GunNames.size]="type95";
	level.GunNames2[level.GunNames2.size]="Type 95"; 
	level.GunNames[level.GunNames.size]="m4";
	level.GunNames2[level.GunNames2.size]="M4A1"; 
	level.GunNames[level.GunNames.size]="ak47";
	level.GunNames2[level.GunNames2.size]="AK-47"; 
	level.GunNames[level.GunNames.size]="m16";
	level.GunNames2[level.GunNames2.size]="M16A4"; 
	level.GunNames[level.GunNames.size]="mk14";
	level.GunNames2[level.GunNames2.size]="MK14"; 
	level.GunNames[level.GunNames.size]="g36c";
	level.GunNames2[level.GunNames2.size]="G36C"; 
	level.GunNames[level.GunNames.size]="scar";
	level.GunNames2[level.GunNames2.size]="SCAR-L"; 
	level.GunNames[level.GunNames.size]="fad";
	level.GunNames2[level.GunNames2.size]="FAD"; 
	level.GunNames[level.GunNames.size]="cm901";
	level.GunNames2[level.GunNames2.size]="CM 901"; 
	level.GunNames[level.GunNames.size]="mp5";
	level.GunNames2[level.GunNames2.size]="MP5"; 
	level.GunNames[level.GunNames.size]="p90";
	level.GunNames2[level.GunNames2.size]="P90"; 
	level.GunNames[level.GunNames.size]="pp90m1";
	level.GunNames2[level.GunNames2.size]="PP90M1"; 
	level.GunNames[level.GunNames.size]="ump45";
	level.GunNames2[level.GunNames2.size]="UMP45"; 
	level.GunNames[level.GunNames.size]="mp7";
	level.GunNames2[level.GunNames2.size]="MP7"; 
	level.GunNames[level.GunNames.size]="m9";
	level.GunNames2[level.GunNames2.size]="PM9"; 
	level.GunNames[level.GunNames.size]="spas12";
	level.GunNames2[level.GunNames2.size]="SPAS-12"; 
	level.GunNames[level.GunNames.size]="aa12";
	level.GunNames2[level.GunNames2.size]="AA-12"; 
	level.GunNames[level.GunNames.size]="striker";
	level.GunNames2[level.GunNames2.size]="Striker"; 
	level.GunNames[level.GunNames.size]="1887";
	level.GunNames2[level.GunNames2.size]="Model 1887"; 
	level.GunNames[level.GunNames.size]="usas12";
	level.GunNames2[level.GunNames2.size]="USAS-12"; 
	level.GunNames[level.GunNames.size]="ksg";
	level.GunNames2[level.GunNames2.size]="KSG-12"; 
	level.GunNames[level.GunNames.size]="m60";
	level.GunNames2[level.GunNames2.size]="M60E4"; 
	level.GunNames[level.GunNames.size]="mk46";
	level.GunNames2[level.GunNames2.size]="MK46"; 
	level.GunNames[level.GunNames.size]="pecheneg";
	level.GunNames2[level.GunNames2.size]="PKP Pecheneg"; 
	level.GunNames[level.GunNames.size]="sa80";
	level.GunNames2[level.GunNames2.size]="L86 LSW"; 
	level.GunNames[level.GunNames.size]="mg36";
	level.GunNames2[level.GunNames2.size]="MG36"; 
	level.GunNames[level.GunNames.size]="barrett";
	level.GunNames2[level.GunNames2.size]="Barrett M82"; 
	level.GunNames[level.GunNames.size]="msr";
	level.GunNames2[level.GunNames2.size]="MSR"; 
	level.GunNames[level.GunNames.size]="rsass";
	level.GunNames2[level.GunNames2.size]="RSASS"; 
	level.GunNames[level.GunNames.size]="dragunov";
	level.GunNames2[level.GunNames2.size]="SVD Dragunov"; 
	level.GunNames[level.GunNames.size]="as50";
	level.GunNames2[level.GunNames2.size]="AS50"; 
	level.GunNames[level.GunNames.size]="l96a1";
	level.GunNames2[level.GunNames2.size]="L118A"; 
	level.GunNames[level.GunNames.size]="usp45";
	level.GunNames2[level.GunNames2.size]="USP .45"; 
	level.GunNames[level.GunNames.size]="mp412";
	level.GunNames2[level.GunNames2.size]="MP412"; 
	level.GunNames[level.GunNames.size]="44magnum";
	level.GunNames2[level.GunNames2.size]=".44 Magnum"; 
	level.GunNames[level.GunNames.size]="deserteagle";
	level.GunNames2[level.GunNames2.size]="Desert Eagle"; 
	level.GunNames[level.GunNames.size]="p99";
	level.GunNames2[level.GunNames2.size]="P99"; 
	level.GunNames[level.GunNames.size]="fnfiveseven";
	level.GunNames2[level.GunNames2.size]="Five SeveN"; 
	level.GunNames[level.GunNames.size]="fmg9";
	level.GunNames2[level.GunNames2.size]="FMG 9"; 
	level.GunNames[level.GunNames.size]="g18";
	level.GunNames2[level.GunNames2.size]="G18"; 
	level.GunNames[level.GunNames.size]="mp9";
	level.GunNames2[level.GunNames2.size]="MP9"; 
	level.GunNames[level.GunNames.size]="skorpion";
	level.GunNames2[level.GunNames2.size]="Skorpion"; 
	level.GunNames[level.GunNames.size]="rpg";
	level.GunNames2[level.GunNames2.size]="RPG-7"; 
	level.GunNames[level.GunNames.size]="javelin";
	level.GunNames2[level.GunNames2.size]="Javelin"; 
	level.GunNames[level.GunNames.size]="smaw";
	level.GunNames2[level.GunNames2.size]="SMAW"; 
	level.GunNames[level.GunNames.size]="m320";
	level.GunNames2[level.GunNames2.size]="M320 GLM"; 
	level.GunNames[level.GunNames.size]="xm25";
	level.GunNames2[level.GunNames2.size]="XM25";
	level.GunNames[level.GunNames.size]="ak74u";
	level.GunNames2[level.GunNames2.size]="Ak74u";
	level.GunNames[level.GunNames.size]="cheytac";
	level.GunNames2[level.GunNames2.size]="Intervention";
	level.GunNames[level.GunNames.size]="defaultweapon";
	level.GunNames2[level.GunNames2.size]="Fingergun";
	level.GunNames[level.GunNames.size]="ac130_25mm_mp";
	level.GunNames2[level.GunNames2.size]="AC130";
}
