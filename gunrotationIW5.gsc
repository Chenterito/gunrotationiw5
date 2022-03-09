/*
*	 Black Ops 2 - GSC Studio by iMCSx
*
*	 Creator : Kalitos
*	 Project : GunRotationIW5
*    Mode : Multiplayer
*	 Date : 2021/06/04 - 07:30:22	
*
*/	

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	level.servername = GetDvar("sv_hostname");
	
	if (GetDvar("g_gametype") == "infect")
        	{        				
        		level.dev_mode=0;
        		
				level.ChangeInterval = 30;					
		
				level.Secondary = "iw5_p99_mp_akimbo";
		
				level.NextPrimary ="";
		
				level.PrimaryFullName ="";
		
				level.GlobalCurrentGun ="";	
				
				
      			////////////////////////
      			level.GunNames = [];
      			level.GunNames2 = [];
      			level.GunNames[0]="acr";
				level.GunNames2[0]="ACR 6.8"; 
				level.GunNames[1]="type95";
				level.GunNames2[1]="Type 95"; 
				level.GunNames[2]="m4";
				level.GunNames2[2]="M4A1"; 
				level.GunNames[3]="ak47";
				level.GunNames2[3]="AK-47"; 
				level.GunNames[4]="m16";
				level.GunNames2[4]="M16A4"; 
				level.GunNames[5]="mk14";
				level.GunNames2[5]="MK14"; 
				level.GunNames[6]="g36c";
				level.GunNames2[6]="G36C"; 
				level.GunNames[7]="scar";
				level.GunNames2[7]="SCAR-L"; 
				level.GunNames[8]="fad";
				level.GunNames2[8]="FAD"; 
				level.GunNames[9]="cm901";
				level.GunNames2[9]="CM 901"; 
				level.GunNames[10]="mp5";
				level.GunNames2[10]="MP5"; 
				level.GunNames[11]="p90";
				level.GunNames2[11]="P90"; 
				level.GunNames[12]="pp90m1";
				level.GunNames2[12]="PP90M1"; 
				level.GunNames[13]="ump45";
				level.GunNames2[13]="UMP45"; 
				level.GunNames[14]="mp7";
				level.GunNames2[14]="MP7"; 
				level.GunNames[15]="m9";
				level.GunNames2[15]="PM9"; 
				level.GunNames[16]="spas12";
				level.GunNames2[16]="SPAS-12"; 
				level.GunNames[17]="aa12";
				level.GunNames2[17]="AA-12"; 
				level.GunNames[18]="striker";
				level.GunNames2[18]="Striker"; 
				level.GunNames[19]="1887";
				level.GunNames2[19]="Model 1887"; 
				level.GunNames[20]="usas12";
				level.GunNames2[20]="USAS-12"; 
				level.GunNames[21]="ksg";
				level.GunNames2[21]="KSG-12"; 
				level.GunNames[22]="m60";
				level.GunNames2[22]="M60E4"; 
				level.GunNames[23]="mk46";
				level.GunNames2[23]="MK46"; 
				level.GunNames[24]="pecheneg";
				level.GunNames2[24]="PKP Pecheneg"; 
				level.GunNames[25]="sa80";
				level.GunNames2[25]="L86 LSW"; 
				level.GunNames[26]="mg36";
				level.GunNames2[26]="MG36"; 
				level.GunNames[27]="barrett";
				level.GunNames2[27]="Barrett M82"; 
				level.GunNames[28]="msr";
				level.GunNames2[28]="MSR"; 
				level.GunNames[29]="rsass";
				level.GunNames2[29]="RSASS"; 
				level.GunNames[30]="dragunov";
				level.GunNames2[30]="SVD Dragunov"; 
				level.GunNames[31]="as50";
				level.GunNames2[31]="AS50"; 
				level.GunNames[32]="l96a1";
				level.GunNames2[32]="L118A"; 
				level.GunNames[33]="usp45";
				level.GunNames2[33]="USP .45"; 
				level.GunNames[34]="mp412";
				level.GunNames2[34]="MP412"; 
				level.GunNames[35]="44magnum";
				level.GunNames2[35]=".44 Magnum"; 
				level.GunNames[36]="deserteagle";
				level.GunNames2[36]="Desert Eagle"; 
				level.GunNames[37]="p99";
				level.GunNames2[37]="P99"; 
				level.GunNames[38]="fnfiveseven";
				level.GunNames2[38]="Five SeveN"; 
				level.GunNames[39]="fmg9";
				level.GunNames2[39]="FMG 9"; 
				level.GunNames[40]="g18";
				level.GunNames2[40]="G18"; 
				level.GunNames[41]="mp9";
				level.GunNames2[41]="MP9"; 
				level.GunNames[42]="skorpion";
				level.GunNames2[42]="Skorpion"; 
				level.GunNames[43]="rpg";
				level.GunNames2[43]="RPG-7"; 
				level.GunNames[44]="javelin";
				level.GunNames2[44]="Javelin"; 
				level.GunNames[45]="smaw";
				level.GunNames2[45]="SMAW"; 
				level.GunNames[46]="m320";
				level.GunNames2[46]="M320 GLM"; 
				level.GunNames[47]="xm25";
				level.GunNames2[47]="XM25";
				level.GunNames[48]="ak74u";
				level.GunNames2[48]="Ak74u";
				level.GunNames[49]="cheytac";
				level.GunNames2[49]="Intervention";
				level.GunNames[50]="defaultweapon";
				level.GunNames2[50]="Fingergun";
				level.GunNames[51]="ac130_25mm_mp";
				level.GunNames2[51]="AC130";
				
      			///////////////////////      			
      			level.Weapons[0]="iw5_acr_mp_camo01";
				level.Weapons[1]="iw5_acr_mp_reflex_camo02";
				level.Weapons[2]="iw5_acr_mp_silencer_camo03";
				level.Weapons[3]="iw5_acr_mp_m320_camo04";
				level.Weapons[4]="iw5_acr_mp_acog_camo05";
				level.Weapons[5]="iw5_acr_mp_heartbeat_camo06";
				level.Weapons[6]="iw5_acr_mp_eotech_camo07";
				level.Weapons[7]="iw5_acr_mp_shotgun_camo08";
				level.Weapons[8]="iw5_acr_mp_hybrid_camo09";
				level.Weapons[9]="iw5_acr_mp_xmags_camo10";
				level.Weapons[10]="iw5_acr_mp_thermal_camo11";
				level.Weapons[11]="iw5_type95_mp_camo12";
				level.Weapons[12]="iw5_type95_mp_reflex_camo13";
				level.Weapons[13]="iw5_type95_mp_silencer_camo01";
				level.Weapons[14]="iw5_type95_mp_m320_camo02";
				level.Weapons[15]="iw5_type95_mp_acog_camo03";
				level.Weapons[16]="iw5_type95_mp_heartbeat_camo04";
				level.Weapons[17]="iw5_type95_mp_eotech_camo05";
				level.Weapons[18]="iw5_type95_mp_shotgun_camo06";
				level.Weapons[19]="iw5_type95_mp_hybrid_camo07";
				level.Weapons[20]="iw5_type95_mp_xmags_camo08";
				level.Weapons[21]="iw5_type95_mp_thermal_camo09";
				level.Weapons[22]="iw5_m4_mp_camo10";
				level.Weapons[23]="iw5_m4_mp_reflex_camo11";
				level.Weapons[24]="iw5_m4_mp_silencer_camo12";
				level.Weapons[25]="iw5_m4_mp_gl_camo13";
				level.Weapons[26]="iw5_m4_mp_acog_camo01";
				level.Weapons[27]="iw5_m4_mp_heartbeat_camo02";
				level.Weapons[28]="iw5_m4_mp_eotech_camo03";
				level.Weapons[29]="iw5_m4_mp_shotgun_camo04";
				level.Weapons[30]="iw5_m4_mp_hybrid_camo05";
				level.Weapons[31]="iw5_m4_mp_xmags_camo06";
				level.Weapons[32]="iw5_m4_mp_thermal_camo07";
				level.Weapons[33]="iw5_ak47_mp_camo08";
				level.Weapons[34]="iw5_ak47_mp_reflex_camo09";
				level.Weapons[35]="iw5_ak47_mp_silencer_camo10";
				level.Weapons[36]="iw5_ak47_mp_gp25_camo11";
				level.Weapons[37]="iw5_ak47_mp_acog_camo12";
				level.Weapons[38]="iw5_ak47_mp_heartbeat_camo13";
				level.Weapons[39]="iw5_ak47_mp_eotech_camo01";
				level.Weapons[40]="iw5_ak47_mp_shotgun_camo02";
				level.Weapons[41]="iw5_ak47_mp_hybrid_camo03";
				level.Weapons[42]="iw5_ak47_mp_xmags_camo04";
				level.Weapons[43]="iw5_ak47_mp_thermal_camo05";
				level.Weapons[44]="iw5_m16_mp_camo06";
				level.Weapons[45]="iw5_m16_mp_reflex_camo07";
				level.Weapons[46]="iw5_m16_mp_silencer_camo08";
				level.Weapons[47]="iw5_m16_mp_gl_camo09";
				level.Weapons[48]="iw5_m16_mp_acog_camo10";
				level.Weapons[49]="iw5_m16_mp_heartbeat_camo11";
				level.Weapons[50]="iw5_m16_mp_eotech_camo12";
				level.Weapons[51]="iw5_m16_mp_shotgun_camo13";
				level.Weapons[52]="iw5_m16_mp_hybrid_camo01";
				level.Weapons[53]="iw5_m16_mp_xmags_camo02";
				level.Weapons[54]="iw5_m16_mp_thermal_camo03";
				level.Weapons[55]="iw5_mk14_mp_camo04";
				level.Weapons[56]="iw5_mk14_mp_reflex_camo05";
				level.Weapons[57]="iw5_mk14_mp_silencer_camo06";
				level.Weapons[58]="iw5_mk14_mp_m320_camo07";
				level.Weapons[59]="iw5_mk14_mp_acog_camo08";
				level.Weapons[60]="iw5_mk14_mp_heartbeat_camo09";
				level.Weapons[61]="iw5_mk14_mp_eotech_camo10";
				level.Weapons[62]="iw5_mk14_mp_shotgun_camo11";
				level.Weapons[63]="iw5_mk14_mp_hybrid_camo12";
				level.Weapons[64]="iw5_mk14_mp_xmags_camo13";
				level.Weapons[65]="iw5_mk14_mp_thermal_camo01";
				level.Weapons[66]="iw5_g36c_mp_camo02";
				level.Weapons[67]="iw5_g36c_mp_reflex_camo03";
				level.Weapons[68]="iw5_g36c_mp_silencer_camo04";
				level.Weapons[69]="iw5_g36c_mp_m320_camo05";
				level.Weapons[70]="iw5_g36c_mp_acog_camo06";
				level.Weapons[71]="iw5_g36c_mp_heartbeat_camo07";
				level.Weapons[72]="iw5_g36c_mp_eotech_camo08";
				level.Weapons[73]="iw5_g36c_mp_shotgun_camo09";
				level.Weapons[74]="iw5_g36c_mp_hybrid_camo10";
				level.Weapons[75]="iw5_g36c_mp_xmags_camo11";
				level.Weapons[76]="iw5_g36c_mp_thermal_camo12";
				level.Weapons[77]="iw5_scar_mp_camo13";
				level.Weapons[78]="iw5_scar_mp_reflex_camo01";
				level.Weapons[79]="iw5_scar_mp_silencer_camo02";
				level.Weapons[80]="iw5_scar_mp_m320_camo03";
				level.Weapons[81]="iw5_scar_mp_acog_camo04";
				level.Weapons[82]="iw5_scar_mp_heartbeat_camo05";
				level.Weapons[83]="iw5_scar_mp_eotech_camo06";
				level.Weapons[84]="iw5_scar_mp_shotgun_camo07";
				level.Weapons[85]="iw5_scar_mp_hybrid_camo08";
				level.Weapons[86]="iw5_scar_mp_xmags_camo09";
				level.Weapons[87]="iw5_scar_mp_thermal_camo10";
				level.Weapons[88]="iw5_fad_mp_camo11";
				level.Weapons[89]="iw5_fad_mp_reflex_camo12";
				level.Weapons[90]="iw5_fad_mp_silencer_camo13";
				level.Weapons[91]="iw5_fad_mp_m320_camo01";
				level.Weapons[92]="iw5_fad_mp_acog_camo02";
				level.Weapons[93]="iw5_fad_mp_heartbeat_camo03";
				level.Weapons[94]="iw5_fad_mp_eotech_camo04";
				level.Weapons[95]="iw5_fad_mp_shotgun_camo05";
				level.Weapons[96]="iw5_fad_mp_hybrid_camo06";
				level.Weapons[97]="iw5_fad_mp_xmags_camo07";
				level.Weapons[98]="iw5_fad_mp_thermal_camo08";
				level.Weapons[99]="iw5_cm901_mp_camo09";
				level.Weapons[100]="iw5_cm901_mp_reflex_camo10";
				level.Weapons[101]="iw5_cm901_mp_silencer_camo11";
				level.Weapons[102]="iw5_cm901_mp_m320_camo12";
				level.Weapons[103]="iw5_cm901_mp_acog_camo13";
				level.Weapons[104]="iw5_cm901_mp_heartbeat_camo01";
				level.Weapons[105]="iw5_cm901_mp_eotech_camo02";
				level.Weapons[106]="iw5_cm901_mp_shotgun_camo03";
				level.Weapons[107]="iw5_cm901_mp_hybrid_camo04";
				level.Weapons[108]="iw5_cm901_mp_xmags_camo05";
				level.Weapons[109]="iw5_cm901_mp_thermal_camo06";
				level.Weapons[110]="iw5_mp5_mp_camo07";
				level.Weapons[111]="iw5_mp5_mp_reflexsmg_camo08";
				level.Weapons[112]="iw5_mp5_mp_silencer_camo09";
				level.Weapons[113]="iw5_mp5_mp_rof_camo10";
				level.Weapons[114]="iw5_mp5_mp_acogsmg_camo11";
				level.Weapons[115]="iw5_mp5_mp_eotechsmg_camo12";
				level.Weapons[116]="iw5_mp5_mp_hamrhybrid_camo13";
				level.Weapons[117]="iw5_mp5_mp_xmags_camo01";
				level.Weapons[118]="iw5_mp5_mp_thermalsmg_camo02";
				level.Weapons[119]="iw5_p90_mp_camo03";
				level.Weapons[120]="iw5_p90_mp_reflexsmg_camo04";
				level.Weapons[121]="iw5_p90_mp_silencer_camo05";
				level.Weapons[122]="iw5_p90_mp_rof_camo06";
				level.Weapons[123]="iw5_p90_mp_acogsmg_camo07";
				level.Weapons[124]="iw5_p90_mp_eotechsmg_camo08";
				level.Weapons[125]="iw5_p90_mp_hamrhybrid_camo09";
				level.Weapons[126]="iw5_p90_mp_xmags_camo10";
				level.Weapons[127]="iw5_p90_mp_thermalsmg_camo11";
				level.Weapons[128]="iw5_m9_mp_camo12";
				level.Weapons[129]="iw5_m9_mp_reflexsmg_camo13";
				level.Weapons[130]="iw5_m9_mp_silencer_camo01";
				level.Weapons[131]="iw5_m9_mp_rof_camo02";
				level.Weapons[132]="iw5_m9_mp_acogsmg_camo03";
				level.Weapons[133]="iw5_m9_mp_eotechsmg_camo04";
				level.Weapons[134]="iw5_m9_mp_hamrhybrid_camo05";
				level.Weapons[135]="iw5_m9_mp_xmags_camo06";
				level.Weapons[136]="iw5_m9_mp_thermalsmg_camo07";
				level.Weapons[137]="iw5_pp90m1_mp_camo08";
				level.Weapons[138]="iw5_pp90m1_mp_reflexsmg_camo09";
				level.Weapons[139]="iw5_pp90m1_mp_silencer_camo10";
				level.Weapons[140]="iw5_pp90m1_mp_rof_camo11";
				level.Weapons[141]="iw5_pp90m1_mp_acogsmg_camo12";
				level.Weapons[142]="iw5_pp90m1_mp_eotechsmg_camo13";
				level.Weapons[143]="iw5_pp90m1_mp_hamrhybrid_camo01";
				level.Weapons[144]="iw5_pp90m1_mp_xmags_camo02";
				level.Weapons[145]="iw5_pp90m1_mp_thermalsmg_camo03";
				level.Weapons[146]="iw5_ump45_mp_camo04";
				level.Weapons[147]="iw5_ump45_mp_reflexsmg_camo05";
				level.Weapons[148]="iw5_ump45_mp_silencer_camo06";
				level.Weapons[149]="iw5_ump45_mp_rof_camo07";
				level.Weapons[150]="iw5_ump45_mp_acogsmg_camo08";
				level.Weapons[151]="iw5_ump45_mp_eotechsmg_camo09";
				level.Weapons[152]="iw5_ump45_mp_hamrhybrid_camo10";
				level.Weapons[153]="iw5_ump45_mp_xmags_camo11";
				level.Weapons[154]="iw5_ump45_mp_thermalsmg_camo12";
				level.Weapons[155]="iw5_mp7_mp_camo13";
				level.Weapons[156]="iw5_mp7_mp_reflexsmg_camo01";
				level.Weapons[157]="iw5_mp7_mp_silencer_camo02";
				level.Weapons[158]="iw5_mp7_mp_rof_camo03";
				level.Weapons[159]="iw5_mp7_mp_acogsmg_camo04";
				level.Weapons[160]="iw5_mp7_mp_eotechsmg_camo05";
				level.Weapons[161]="iw5_mp7_mp_hamrhybrid_camo06";
				level.Weapons[162]="iw5_mp7_mp_xmags_camo07";
				level.Weapons[163]="iw5_mp7_mp_thermalsmg_camo08";
				level.Weapons[164]="iw5_ak74u_mp_camo09";
				level.Weapons[165]="iw5_ak74u_mp_reflexsmg_camo10";
				level.Weapons[166]="iw5_ak74u_mp_silencer_camo11";
				level.Weapons[167]="iw5_ak74u_mp_rof_camo12";
				level.Weapons[168]="iw5_ak74u_mp_acogsmg_camo13";
				level.Weapons[169]="iw5_ak74u_mp_eotechsmg_camo01";
				level.Weapons[170]="iw5_ak74u_mp_xmags_camo02";
				level.Weapons[171]="iw5_ak74u_mp_thermalsmg_camo03";
				level.Weapons[172]="iw5_spas12_mp_camo04";
				level.Weapons[173]="iw5_spas12_mp_grip_camo05";
				level.Weapons[174]="iw5_spas12_mp_reflex_camo06";
				level.Weapons[175]="iw5_spas12_mp_eotech_camo07";
				level.Weapons[176]="iw5_spas12_mp_xmags_camo08";
				level.Weapons[177]="iw5_spas12_mp_silencer03_camo09";
				level.Weapons[178]="iw5_aa12_mp_camo10";
				level.Weapons[179]="iw5_aa12_mp_grip_camo11";
				level.Weapons[180]="iw5_aa12_mp_reflex_camo12";
				level.Weapons[181]="iw5_aa12_mp_eotech_camo13";
				level.Weapons[182]="iw5_aa12_mp_xmags_camo01";
				level.Weapons[183]="iw5_aa12_mp_silencer03_camo02";
				level.Weapons[184]="iw5_striker_mp_camo03";
				level.Weapons[185]="iw5_striker_mp_grip_camo04";
				level.Weapons[186]="iw5_striker_mp_reflex_camo05";
				level.Weapons[187]="iw5_striker_mp_eotech_camo06";
				level.Weapons[188]="iw5_striker_mp_xmags_camo07";
				level.Weapons[189]="iw5_1887_mp_camo08";
				level.Weapons[190]="iw5_usas12_mp_camo09";
				level.Weapons[191]="iw5_usas12_mp_grip_camo10";
				level.Weapons[192]="iw5_usas12_mp_reflex_camo11";
				level.Weapons[193]="iw5_usas12_mp_eotech_camo12";
				level.Weapons[194]="iw5_usas12_mp_xmags_camo13";
				level.Weapons[195]="iw5_usas12_mp_silencer03_camo01";
				level.Weapons[196]="iw5_ksg_mp_camo02";
				level.Weapons[197]="iw5_ksg_mp_grip_camo03";
				level.Weapons[198]="iw5_ksg_mp_reflex_camo04";
				level.Weapons[199]="iw5_ksg_mp_eotech_camo05";
				level.Weapons[200]="iw5_ksg_mp_xmags_camo06";
				level.Weapons[201]="iw5_ksg_mp_silencer03_camo07";
				level.Weapons[202]="iw5_m60_mp_camo08";
				level.Weapons[203]="iw5_m60_mp_reflexlmg_camo09";
				level.Weapons[204]="iw5_m60_mp_silencer_camo10";
				level.Weapons[205]="iw5_m60_mp_grip_camo11";
				level.Weapons[206]="iw5_m60_mp_acog_camo12";
				level.Weapons[207]="iw5_m60_mp_rof_camo13";
				level.Weapons[208]="iw5_m60_mp_eotechlmg_camo01";
				level.Weapons[209]="iw5_m60_mp_xmags_camo02";
				level.Weapons[210]="iw5_m60_mp_thermal_camo03";
				level.Weapons[211]="iw5_pecheneg_mp_camo04";
				level.Weapons[212]="iw5_pecheneg_mp_reflexlmg_camo05";
				level.Weapons[213]="iw5_pecheneg_mp_silencer_camo06";
				level.Weapons[214]="iw5_pecheneg_mp_grip_camo07";
				level.Weapons[215]="iw5_pecheneg_mp_acog_camo08";
				level.Weapons[216]="iw5_pecheneg_mp_rof_camo09";
				level.Weapons[217]="iw5_pecheneg_mp_eotechlmg_camo10";
				level.Weapons[218]="iw5_pecheneg_mp_xmags_camo11";
				level.Weapons[219]="iw5_pecheneg_mp_thermal_camo12";
				level.Weapons[220]="iw5_mk46_mp_camo13";
				level.Weapons[221]="iw5_mk46_mp_reflexlmg_camo01";
				level.Weapons[222]="iw5_mk46_mp_silencer_camo02";
				level.Weapons[223]="iw5_mk46_mp_grip_camo03";
				level.Weapons[224]="iw5_mk46_mp_acog_camo04";
				level.Weapons[225]="iw5_mk46_mp_rof_camo05";
				level.Weapons[226]="iw5_mk46_mp_heartbeat_camo06";
				level.Weapons[227]="iw5_mk46_mp_eotechlmg_camo07";
				level.Weapons[228]="iw5_mk46_mp_xmags_camo08";
				level.Weapons[229]="iw5_mk46_mp_thermal_camo09";
				level.Weapons[230]="iw5_sa80_mp_camo10";
				level.Weapons[231]="iw5_sa80_mp_reflexlmg_camo11";
				level.Weapons[232]="iw5_sa80_mp_silencer_camo12";
				level.Weapons[233]="iw5_sa80_mp_grip_camo13";
				level.Weapons[234]="iw5_sa80_mp_acog_camo01";
				level.Weapons[235]="iw5_sa80_mp_rof_camo02";
				level.Weapons[236]="iw5_sa80_mp_heartbeat_camo03";
				level.Weapons[237]="iw5_sa80_mp_eotechlmg_camo04";
				level.Weapons[238]="iw5_sa80_mp_xmags_camo05";
				level.Weapons[239]="iw5_sa80_mp_thermal_camo06";
				level.Weapons[240]="iw5_mg36_mp_camo07";
				level.Weapons[241]="iw5_mg36_mp_reflexlmg_camo08";
				level.Weapons[242]="iw5_mg36_mp_silencer_camo09";
				level.Weapons[243]="iw5_mg36_mp_grip_camo10";
				level.Weapons[244]="iw5_mg36_mp_acog_camo11";
				level.Weapons[245]="iw5_mg36_mp_rof_camo12";
				level.Weapons[246]="iw5_mg36_mp_heartbeat_camo13";
				level.Weapons[247]="iw5_mg36_mp_eotechlmg_camo01";
				level.Weapons[248]="iw5_mg36_mp_xmags_camo02";
				level.Weapons[249]="iw5_mg36_mp_thermal_camo03";
				level.Weapons[250]="iw5_barrett_mp_barrettscope_camo04";
				level.Weapons[251]="iw5_barrett_mp_acog_camo05";
				level.Weapons[252]="iw5_barrett_mp_barrettscope_heartbeat_camo06";
				level.Weapons[253]="iw5_barrett_mp_barrettscope_xmags_camo07";
				level.Weapons[254]="iw5_barrett_mp_thermal_camo08";
				level.Weapons[255]="iw5_barrett_mp_barrettscopevz_camo09";
				level.Weapons[256]="iw5_barrett_mp_barrettscope_silencer03_camo10";
				level.Weapons[257]="iw5_msr_mp_msrscope_camo11";
				level.Weapons[258]="iw5_msr_mp_acog_camo12";
				level.Weapons[259]="iw5_msr_mp_heartbeat_msrscope_camo13";
				level.Weapons[260]="iw5_msr_mp_msrscope_xmags_camo01";
				level.Weapons[261]="iw5_msr_mp_thermal_camo02";
				level.Weapons[262]="iw5_msr_mp_msrscopevz_camo03";
				level.Weapons[263]="iw5_msr_mp_msrscope_silencer03_camo04";
				level.Weapons[264]="iw5_rsass_mp_rsassscope_camo05";
				level.Weapons[265]="iw5_rsass_mp_acog_camo06";
				level.Weapons[266]="iw5_rsass_mp_heartbeat_rsassscope_camo07";
				level.Weapons[267]="iw5_rsass_mp_rsassscope_xmags_camo08";
				level.Weapons[268]="iw5_rsass_mp_thermal_camo09";
				level.Weapons[269]="iw5_rsass_mp_rsassscopevz_camo10";
				level.Weapons[270]="iw5_rsass_mp_rsassscope_silencer03_camo11";
				level.Weapons[271]="iw5_dragunov_mp_dragunovscope_camo12";
				level.Weapons[272]="iw5_dragunov_mp_acog_camo13";
				level.Weapons[273]="iw5_dragunov_mp_dragunovscope_heartbeat_camo01";
				level.Weapons[274]="iw5_dragunov_mp_dragunovscope_xmags_camo02";
				level.Weapons[275]="iw5_dragunov_mp_thermal_camo03";
				level.Weapons[276]="iw5_dragunov_mp_dragunovscopevz_camo04";
				level.Weapons[277]="iw5_dragunov_mp_dragunovscope_silencer03_camo05";
				level.Weapons[278]="iw5_cheytac_mp_cheytacscope_camo06";
				level.Weapons[279]="iw5_cheytac_mp_acog_camo07";
				level.Weapons[280]="iw5_cheytac_mp_cheytacscope_heartbeat_camo08";
				level.Weapons[281]="iw5_cheytac_mp_cheytacscope_xmags_camo09";
				level.Weapons[282]="iw5_cheytac_mp_thermal_camo10";
				level.Weapons[283]="iw5_cheytac_mp_cheytacscopevz_camo11";
				level.Weapons[284]="iw5_cheytac_mp_cheytacscope_silencer03_camo12";
				level.Weapons[285]="iw5_as50_mp_as50scope_camo13";
				level.Weapons[286]="iw5_as50_mp_acog_camo01";
				level.Weapons[287]="iw5_as50_mp_as50scope_heartbeat_camo02";
				level.Weapons[288]="iw5_as50_mp_as50scope_xmags_camo03";
				level.Weapons[289]="iw5_as50_mp_thermal_camo04";
				level.Weapons[290]="iw5_as50_mp_as50scopevz_camo05";
				level.Weapons[291]="iw5_as50_mp_as50scope_silencer03_camo06";
				level.Weapons[292]="iw5_l96a1_mp_l96a1scope_camo07";
				level.Weapons[293]="iw5_l96a1_mp_acog_camo08";
				level.Weapons[294]="iw5_l96a1_mp_heartbeat_l96a1scope_camo09";
				level.Weapons[295]="iw5_l96a1_mp_l96a1scope_xmags_camo10";
				level.Weapons[296]="iw5_l96a1_mp_thermal_camo11";
				level.Weapons[297]="iw5_l96a1_mp_l96a1scopevz_camo12";
				level.Weapons[298]="iw5_l96a1_mp_l96a1scope_silencer03_camo13";
				level.Weapons[299]="iw5_usp45_mp";
				level.Weapons[300]="iw5_usp45_mp_silencer02";
				level.Weapons[301]="iw5_usp45_mp_akimbo";
				level.Weapons[302]="iw5_usp45_mp_tactical";
				level.Weapons[303]="iw5_usp45_mp_xmags";
				level.Weapons[304]="iw5_mp412_mp";
				level.Weapons[305]="iw5_mp412_mp_akimbo";
				level.Weapons[306]="iw5_mp412_mp_tactical";
				level.Weapons[307]="iw5_44magnum_mp";
				level.Weapons[308]="iw5_44magnum_mp_tactical";
				level.Weapons[309]="iw5_44magnum_mp_akimbo";
				level.Weapons[310]="iw5_deserteagle_mp";
				level.Weapons[311]="iw5_deserteagle_mp_tactical";
				level.Weapons[312]="iw5_deserteagle_mp_akimbo";
				level.Weapons[313]="iw5_p99_mp";
				level.Weapons[314]="iw5_p99_mp_silencer02";
				level.Weapons[315]="iw5_p99_mp_akimbo";
				level.Weapons[316]="iw5_p99_mp_tactical";
				level.Weapons[317]="iw5_p99_mp_xmags";
				level.Weapons[318]="iw5_fnfiveseven_mp";
				level.Weapons[319]="iw5_fnfiveseven_mp_silencer02";
				level.Weapons[320]="iw5_fnfiveseven_mp_akimbo";
				level.Weapons[321]="iw5_fnfiveseven_mp_tactical";
				level.Weapons[322]="iw5_fnfiveseven_mp_xmags";
				level.Weapons[323]="iw5_fmg9_mp";
				level.Weapons[324]="iw5_fmg9_mp_silencer02";
				level.Weapons[325]="iw5_fmg9_mp_akimbo";
				level.Weapons[326]="iw5_fmg9_mp_xmags";
				level.Weapons[327]="iw5_g18_mp";
				level.Weapons[328]="iw5_g18_mp_silencer02";
				level.Weapons[329]="iw5_g18_mp_akimbo";
				level.Weapons[330]="iw5_g18_mp_xmags";
				level.Weapons[331]="iw5_mp9_mp";
				level.Weapons[332]="iw5_mp9_mp_silencer02";
				level.Weapons[333]="iw5_mp9_mp_akimbo";
				level.Weapons[334]="iw5_mp9_mp_xmags";
				level.Weapons[335]="iw5_skorpion_mp";
				level.Weapons[336]="iw5_skorpion_mp_silencer02";
				level.Weapons[337]="iw5_skorpion_mp_akimbo";
				level.Weapons[338]="iw5_skorpion_mp_xmags";
				level.Weapons[339]="riotshield_mp";
				level.Weapons[340]="rpg_mp";
				level.Weapons[341]="iw5_smaw_mp";
				level.Weapons[342]="m320_mp";
				level.Weapons[343]="xm25_mp";
				level.Weapons[344]="defaultweapon_mp";
				level.Weapons[345]="ac130_25mm_mp";
      			
      			/////////////////////
      			
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
			if(level.dev_mode==1)
			{	
				level.GunNameHUD SetPoint("TOP", "TOP", 300, 10);				
				level.GunNameHUD SetText(level.PrimaryFullName);
				
			}else{	
			
				level.GunNameHUD SetPoint("TOP", "TOP", 250, 10);				
				level.GunNameHUD SetText(GetGunName(level.PrimaryFullName));
				
			}			 
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






