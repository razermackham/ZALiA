/// rm_data_init_MazIs_A()


var _i, _a,_b, _x,_xl, _y,_yt, _w,_h;
var _val,_val1,_val2,_val3,_val4;
var _rm, _pages, _data, _dk;
var _len, _dir, _dur, _dist;
var _file;
var _exit_name = EXIT_NAME_GAME_START;
var _ow_axis = 0;




var _MapAreaName_MAZE_ISLAND        = "MAZE ISLAND";






// ------------------------------ MAZE ISLAND ------------------------------ 
area = area_MI;










//   --------------------------  00  --------------------------- 
//    Bridge to Maze Island
rm_num  = $00;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'021', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init); // 
y3=(row0+$19)<<3; x3=($22<<3)+4; _val=$1F;   _a=0;
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
//                                                              //
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin
data_spawn(rm+STR_PRXM,BagiA,$1,  x3+(_val*_a++),y3); // Bagin


row3=row0+$08;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 






//   --------------------------  01  --------------------------- 
//    Outside. 
rm_num  = $01;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'001', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$2,  $20<<3,(row0+$14)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $4C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $5C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,TektA,$1,  $62<<3,(row0+$0C)<<3); // Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0A,  0); // RGT 0, to Overworld


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  02  --------------------------- 
//    Outside. 
rm_num  = $02;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'001', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //   
data_spawn(rm+STR_PRXM,ZoraA,$1,  $2E<<3,(row0+$12)<<3); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $40<<3,(row0+$10)<<3); // $AB: Tektite  1
data_spawn(rm+STR_PRXM,TektA,$1,  $68<<3,(row0+$0C)<<3); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0A,  0);        // RGT 0, to Overworld  


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  03  --------------------------- 
//    Cave.
rm_num  = $03;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'002', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE


data_exit(EXU0,etA0,0,  $1E,row_e0,  CLMS5,ROWS5,  $2D,$02,  0); // UP  0, Pit up, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  ($34<<3)-2,(row0+$18)<<3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








//   --------------------------  04  --------------------------- 
//    Cave.
rm_num  = $04;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'003', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $38<<3,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$2,  $50<<3,(row0+$16)<<3); // Geru  2


data_exit(EXU0,etA0,0,  $2A,row_e0,  $0C,ROWS5,  $2F,row_e4,  0); // UP  0, Pit up to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmC4,$1,  ($77<<3)-3,(row0+$16)<<3); // CHILD


data_rando_scene01("_00"+"_00"+"_01"+"_00"+"_01"+STR_Pit+"8",rm);








//   --------------------------  05  --------------------------- 
//    Outside. 
rm_num  = $05;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //   
data_spawn(rm+STR_PRXM,ZoraA,$1,  $200,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $240,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $320,$B0); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);





//   --------------------------  06  --------------------------- 
//    Outside. 
rm_num  = $06;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //  $2F
data_spawn(rm+STR_PRXM,ZoraA,$1,  $A0,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $240,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $280,$B0); // $AE: Zora  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  07  --------------------------- 
//    Outside. 
rm_num  = $07;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); // $30
data_spawn(rm+STR_PRXM,Bot_A,$1,  $A0,$80); // $8E: Bot  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $180,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $1A0,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $300,$B0); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  08  --------------------------- 
//    Outside. 
rm_num  = $08;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); // $30
data_spawn(rm+STR_PRXM,OctoA,$1,  $D0,$60); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $F0,$70); // $AB: Tektite  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A0,$80); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $2D0,$90); // $AB: Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


data_spawn(rm+STR_PRIO,ItmE0,$1,  $200,$90); // Magic Jar (Full)


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00"+STR_JAR,rm);








//   --------------------------  09  --------------------------- 
//    Outside. 
rm_num  = $09;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'006', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $12<<3,(row0+$06)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $40<<3,(row0+$0A)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $6E<<3,(row0+$10)<<3); // Moa  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,(row0+$08)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4E<<3,(row0+$10)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $62<<3,(row0+$12)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $24<<3,(row0+$16)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $30<<3,(row0+$16)<<3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$06,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$14,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,Kakusu010,$1,  $10<<3,(row0+$16)<<3,  STR_Treasure+STR_Map+"02"); // Hiding in Ra statue. Invisible & Still until damaged.


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  0A  --------------------------- 
//    Outside. Shoals.
rm_num  = $0A;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'064', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND, dk_SceneMusicThemeException+"01");


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


y3=(row0+$0E)<<3;
data_spawn(rm+STR_PRIO,ItmG0,$1,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // Extra Life Doll 
//data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE


data_rando_scene01("_00"+"_01"+"_01"+"_00"+"_00",rm);








//   --------------------------  0B  --------------------------- 
//    
rm_num      = $0B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  0C  --------------------------- 
//    
rm_num      = $0C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  0D  --------------------------- 
//    
rm_num      = $0D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  0E  --------------------------- 
//    
rm_num      = $0E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  0F  --------------------------- 
//    
rm_num      = $0F; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  10  --------------------------- 
//    
rm_num      = $10; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  11  --------------------------- 
//    
rm_num      = $11; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  12  --------------------------- 
//    
rm_num      = $12; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  13  --------------------------- 
//    
rm_num      = $13; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  14  --------------------------- 
//    
rm_num      = $14; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  15  --------------------------- 
//    
rm_num      = $15; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  16  --------------------------- 
//    
rm_num      = $16; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  17  --------------------------- 
//    
rm_num      = $17; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  18  --------------------------- 
//    
rm_num      = $18; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  19  --------------------------- 
//    
rm_num      = $19; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  1A  --------------------------- 
//    
rm_num      = $1A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  1B  --------------------------- 
//    
rm_num      = $1B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  1C  --------------------------- 
//    
rm_num      = $1C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  1D  --------------------------- 
//    
rm_num      = $1D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  1E  --------------------------- 
//    
rm_num      = $1E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  1F  --------------------------- 
//    
rm_num      = $1F; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  20  --------------------------- 
//    
rm_num      = $20; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  21  --------------------------- 
//    
rm_num      = $21; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  22  --------------------------- 
//    Outside. 
rm_num  = $22;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'001', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm_name+STR_NIAO+'0',  $0000,  1,Cloud_1_init);
data_spawn(rm+STR_PRXM,OctoA,$2,  $20<<3,(row0+$14)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $4C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,OctoA,$2,  $5C<<3,(row0+$10)<<3); // Octorok  2
data_spawn(rm+STR_PRXM,TektA,$1,  $62<<3,(row0+$0C)<<3); // Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$16,  0); // LFT 0, to Overworld
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0A,  0); // RGT 0, to Overworld
*/








//   --------------------------  23  --------------------------- 
//    Outside. 
rm_num  = $23;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'001', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //   
data_spawn(rm+STR_PRXM,ZoraA,$1,  $2E<<3,(row0+$12)<<3); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $40<<3,(row0+$10)<<3); // $AB: Tektite  1
data_spawn(rm+STR_PRXM,TektA,$1,  $68<<3,(row0+$0C)<<3); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$0A,  0);        // RGT 0, to Overworld  
*/







//   --------------------------  24  --------------------------- 
//   CAVE.      MAGIC 3 
rm_num  = $24;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'002', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE


data_exit(EXU0,etA0,0,  $1E,row_e0,  CLMS5,ROWS5,  $2D,$02,  0); // UP  0, Pit up, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld 


data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  ($34<<3)-2,(row0+$18)<<3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE
*/








//   --------------------------  25  --------------------------- 
//   CAVE.      CHILD 
rm_num  = $25;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'003', STR_ow_axis+'01', STR_show_ow_pos+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,(row0+$0B)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $38<<3,(row0+$17)<<3); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRXM,GeruA,$2,  $50<<3,(row0+$16)<<3); // Geru  2


data_exit(EXU0,etA0,0,  $2A,row_e0,  $0C,ROWS5,  $2F,row_e4,  0); // UP  0, Pit up to Overworld
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0A,  0); // LFT 0, to Overworld


data_spawn(rm+STR_PRIO,ItmC4,$1,  ($77<<3)-3,(row0+$16)<<3); // CHILD
*/








//   --------------------------  26  --------------------------- 
//    
rm_num      = $26; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  27  --------------------------- 
//    
rm_num      = $27; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  28  --------------------------- 
//    
rm_num      = $28; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  29  --------------------------- 
//    
rm_num      = $29; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  2A  --------------------------- 
//    
rm_num      = $2A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  2B  --------------------------- 
//    
rm_num      = $2B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  2C  --------------------------- 
//    
rm_num      = $2C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  2D  --------------------------- 
//    
rm_num      = $2D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  2E  --------------------------- 
//    
rm_num      = $2E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  2F  --------------------------- 
//    Outside. 
rm_num  = $2F;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //   
data_spawn(rm+STR_PRXM,ZoraA,$1,  $200,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $240,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $320,$B0); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  
*/







//   --------------------------  30  --------------------------- 
//    Outside. 
rm_num  = $30; 
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'006', STR_ow_axis+'01', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $12<<3,(row0+$06)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $40<<3,(row0+$0A)<<3); // Moa  1 
data_spawn(rm+STR_PRXM,Moa_A,$1,  $6E<<3,(row0+$10)<<3); // Moa  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $0C<<3,(row0+$08)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4E<<3,(row0+$10)<<3); // Bot  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $62<<3,(row0+$12)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $24<<3,(row0+$16)<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $30<<3,(row0+$16)<<3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$06,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$14,  0); // RGT 0, to Overworld 


data_spawn(rm+STR_PRIO,Kakusu010,$1,  $10<<3,(row0+$16)<<3,  STR_Treasure+STR_Map+"02"); // Hiding in Ra statue. Invisible & Still until damaged.
*/







//   --------------------------  31  --------------------------- 
//    Outside. 
rm_num  = $31;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); // $30
data_spawn(rm+STR_PRXM,Bot_A,$1,  $A0,$80); // $8E: Bot  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $180,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $1A0,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,TektA,$1,  $300,$B0); // $AB: Tektite  1

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  
*/







//   --------------------------  32  --------------------------- 
//    Outside. 
rm_num  = $32;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'004', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); // $30
data_spawn(rm+STR_PRXM,OctoA,$1,  $D0,$60); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $F0,$70); // $AB: Tektite  1
data_spawn(rm+STR_PRXM,OctoA,$1,  $2A0,$80); // $A8: Octorok  1
data_spawn(rm+STR_PRXM,TektA,$1,  $2D0,$90); // $AB: Tektite  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  


data_spawn(rm+STR_PRIO,ItmE0,$1,  $200,$90); // Magic Jar (Full)
*/







//   --------------------------  33  --------------------------- 
//    Outside. 
rm_num  = $33;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'000', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm_name + STR_NIAO + '0', $0000, 1, Cloud_1_init); //  $2F
data_spawn(rm+STR_PRXM,ZoraA,$1,  $A0,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $240,$B0); // $AE: Zora  1
data_spawn(rm+STR_PRXM,ZoraA,$1,  $280,$B0); // $AE: Zora  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$16,  0);        // LFT 0, to Overworld  
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$16,  0);        // RGT 0, to Overworld  
*/







//   --------------------------  34  --------------------------- 
//    
rm_num      = $34; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  35  --------------------------- 
//    
rm_num      = $35; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  36  --------------------------- 
//    
rm_num      = $36; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  37  --------------------------- 
//    
rm_num      = $37; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  38  --------------------------- 
//    
rm_num      = $38; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  39  --------------------------- 
//    
rm_num      = $39; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  3A  --------------------------- 
//    
rm_num      = $3A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  3B  --------------------------- 
//    
rm_num      = $3B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  3C  --------------------------- 
//    
rm_num      = $3C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  3D  --------------------------- 
//    
rm_num      = $3D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  3E  --------------------------- 
//    
rm_num      = $3E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  3F  --------------------------- 
//    
rm_num      = $3F; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  40  --------------------------- 
//    Water shoals next to Palace 4
rm_num  = $40;
/*
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'064', STR_ow_axis+'00', MapAreaName_DATAKEY+_MapAreaName_MAZE_ISLAND);


data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,ROWS6,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,ROWS6,  clmA,row0+$18,  0); // RGT 0, to Overworld 


y3=(row0+$0E)<<3;
data_spawn(rm+STR_PRIO,ItmG0,$1,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // Extra Life Doll 
//data_spawn(rm+STR_PRIO,CONT_PIECE_OBJ_MP,CONT_PIECE_OBJ_VER_MP,  $2A<<3,y3,  STR_Treasure+STR_Map+"02"); // MAGIC PIECE
*/







//   --------------------------  41  --------------------------- 
//    
rm_num      = $41; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  42  --------------------------- 
//    
rm_num      = $42; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  43  --------------------------- 
//    
rm_num      = $43; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  44  --------------------------- 
//    
rm_num      = $44; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  45  --------------------------- 
//    
rm_num      = $45; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  46  --------------------------- 
//    
rm_num      = $46; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  47  --------------------------- 
//    
rm_num      = $47; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  48  --------------------------- 
//    
rm_num      = $48; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  49  --------------------------- 
//    
rm_num      = $49; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  4A  --------------------------- 
//    
rm_num      = $4A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  4B  --------------------------- 
//    
rm_num      = $4B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  4C  --------------------------- 
//    
rm_num      = $4C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  4D  --------------------------- 
//    
rm_num      = $4D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  4E  --------------------------- 
//    
rm_num      = $4E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  4F  --------------------------- 
//    
rm_num      = $4F; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  50  --------------------------- 
//    
rm_num      = $50; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  51  --------------------------- 
//    
rm_num      = $51; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  52  --------------------------- 
//    
rm_num      = $52; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  53  --------------------------- 
//    
rm_num      = $53; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  54  --------------------------- 
//    
rm_num      = $54; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  55  --------------------------- 
//    
rm_num      = $55; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  56  --------------------------- 
//    
rm_num      = $56; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  57  --------------------------- 
//    
rm_num      = $57; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  58  --------------------------- 
//    
rm_num      = $58; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  59  --------------------------- 
//    
rm_num      = $59; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  5A  --------------------------- 
//    
rm_num      = $5A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  5B  --------------------------- 
//    
rm_num      = $5B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  5C  --------------------------- 
//    
rm_num      = $5C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  5D  --------------------------- 
//    
rm_num      = $5D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  5E  --------------------------- 
//    
rm_num      = $5E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  5F  --------------------------- 
//    
rm_num      = $5F; 
rm_name     = area + hex_str(rm_num); 




//   --------------------------  60  --------------------------- 
//    
rm_num  = $60;







//   --------------------------  61  --------------------------- 
//    
rm_num  = $61;







//   --------------------------  62  --------------------------- 
//    
rm_num      = $62; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  63  --------------------------- 
//    
rm_num      = $63; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  64  --------------------------- 
//    
rm_num      = $64; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  65  --------------------------- 
//    
rm_num      = $65; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  66  --------------------------- 
//    
rm_num      = $66; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  67  --------------------------- 
//    
rm_num      = $67; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  68  --------------------------- 
//    
rm_num      = $68; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  69  --------------------------- 
//    
rm_num      = $69; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  6A  --------------------------- 
//    
rm_num      = $6A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  6B  --------------------------- 
//    
rm_num      = $6B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  6C  --------------------------- 
//    
rm_num      = $6C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  6D  --------------------------- 
//    
rm_num      = $6D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  6E  --------------------------- 
//    
rm_num      = $6E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  6F  --------------------------- 
//    
rm_num      = $6F; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  70  --------------------------- 
//    
rm_num      = $70; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  71  --------------------------- 
//    
rm_num      = $71; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  72  --------------------------- 
//    
rm_num      = $72; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  73  --------------------------- 
//    
rm_num      = $73; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  74  --------------------------- 
//    
rm_num      = $74; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  75  --------------------------- 
//    
rm_num      = $75; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  76  --------------------------- 
//    
rm_num      = $76; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  77  --------------------------- 
//    
rm_num      = $77; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  78  --------------------------- 
//    
rm_num      = $78; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  79  --------------------------- 
//    
rm_num      = $79; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  7A  --------------------------- 
//    
rm_num      = $7A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  7B  --------------------------- 
//    
rm_num      = $7B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  7C  --------------------------- 
//    
rm_num      = $7C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  7D  --------------------------- 
//    
rm_num      = $7D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  7E  --------------------------- 
//    
rm_num      = $7E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  7F  --------------------------- 
//    
rm_num      = $7F; 
rm_name     = area + hex_str(rm_num); 




//   -----------------------------------------------------------
mus0 = STR_Dungeon+'01';
//mus0 = MUS_DUNGEON1;
var _DARK_DATA=STR_Dark+"01";
ow_axis =  0; // 0:horizontal, 1:vertical
_ow_axis = STR_ow_axis+'00';
var _Pushable_PI = PI_BGR_4;
var _COLUMN_TYPE='02'; // 2: Midoro Palace

//   --------------------------  80  --------------------------- 
//    PalcZ. Entrance
rm_num  = $80;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'000', _ow_axis);


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$16; y4=row4<<3; // PC spawn row Right exit
row5=row0+$17; y5=row5<<3;

x3=$57<<3;
y3=((row0+$18)<<3)+3;
_data = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF) + hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  PI_BGR_3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);

_pi=PI_BGR_4;
data_spawn(rm+STR_PRIO,TorchA,$3,  $58<<3,y5,  STR_Palette+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$3,  $69<<3,y5,  STR_Palette+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE


clm3=$61; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '83'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                               // Elevator DW $40, 
_exit1=data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  '81'+EXL0_); // RGT 0, 








//   --------------------------  81  --------------------------- 
//    PalcZ. Right of entrance scene. Cave scene w/ large pit down
rm_num  = $81;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'007', _ow_axis);


row3=row0+$0C; y3=row3<<3; // PC spawn row Left+Right exit
//row4=row0+$16; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
//


clms3=clms0+(PAGE_CLMS<<1); clm3=-PAGE_CLMS;
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clms1,row_e3,  _exit1); // DWN 0, Pit down 
//data_pit(_exit, 0,8);
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '80'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '82'+EXL0_); // RGT 0, 








//   --------------------------  82  --------------------------- 
//    PalcZ. Right of entrance scene. 
rm_num  = $82;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, _DARK_DATA, STR_Tile+area_PZ+'002', _ow_axis);


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row3+$03; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $0D<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $54 <<3,(row0+$0B)<<3,  STR_Type+_COLUMN_TYPE); // DropSpawner  1
//data_spawn(rm+STR_PRIO,SpDrA,$1,  $5E<<3,(row0+$0B)<<3,  STR_Type+_COLUMN_TYPE); // DropSpawner  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '81'+EXR0_); // LFT 0, 








//   --------------------------  83  --------------------------- 
//    PalcZ. Elevator shaft to entrance.
rm_num  = $83;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'001', _ow_axis);


row3=row0+$14; y3=row3<<3;
//row4=row0+$16; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;

clm3=$20; // clm3: elevator center clm
rows3=$0C;
x4 = (clm3-$07)<<3;
x5 = (clm3+$06)<<3;
y3 = $0A<<3;
y4 = y3+(rows3<<3);
y5 = y4+(rows3<<3);
y6 = y5+(rows3<<3);
y7 = y6+(rows3<<3);
_pi=PI_BGR_4;
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y3,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y3,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y5,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y5,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y6,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y6,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y7,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x5,y7,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
_dist=($01<<3)+2;
x4-=$01<<3;  x4 = hex_str((x4>>8)&$FF)+hex_str((x4>>0)&$FF);
x5+=$02<<3;  x5 = hex_str((x5>>8)&$FF)+hex_str((x5>>0)&$FF);
y3+=_dist;   y3 = hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
y4+=_dist;   y4 = hex_str((y4>>8)&$FF)+hex_str((y4>>0)&$FF);
y5+=_dist;   y5 = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
y6+=_dist;   y6 = hex_str((y6>>8)&$FF)+hex_str((y6>>0)&$FF);
y7+=_dist;   y7 = hex_str((y7>>8)&$FF)+hex_str((y7>>0)&$FF);
_data  = x4+y3 + x5+y3;
_data += x4+y4 + x5+y4;
_data += x4+y5 + x5+y5;
_data += x4+y6 + x5+y6;
_data += x4+y7 + x5+y7;
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  PI_BGR_3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '80'+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '84'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$15);                                        // Elevator DW $40, UP $80, 








//   --------------------------  84  --------------------------- 
//    PalcZ. Bottom of elevator shaft to entrance.
rm_num  = $84;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'003', _ow_axis);


row3=row0+$16; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=row0+$0A; y5=row5<<3;

clm3=$10; x3=clm3<<3; clms3=$03; // clm3: elevator center clm
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+clms3)<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2B<<3,y5,  STR_Type+_COLUMN_TYPE); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $4B<<3,y5,  STR_Type+_COLUMN_TYPE); // DropSpawner  1


clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  '83'+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_, clm3,row_e5);                                                 // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '85'+EXL0_); // RGT 0, 








//   --------------------------  85  --------------------------- 
//    PalcZ. Depress switches to unlock door challenge.
rm_num  = $85;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'004', _ow_axis);


row3=row0+$14; y3=row3<<3; // PC spawn row Left+Right exit
row4=row3+$01; y4=row4<<3;
row5=row0+$1B; y5=row5<<3;
row6=row0+$12; y6=row6<<3;
row7=row0+$13; y7=row7<<3;
_dist=($0B<<3)+4;
data_spawn(rm+STR_PRIO,TorchA,$1,       _dist-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  rm_w-_dist-8,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($26<<3)+4,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($38<<3)+4,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,PushA,$3,  $22<<3,(row0+$16)<<3,  STR_Palette+hex_str(_Pushable_PI)); // Pushable
data_spawn(rm+STR_PRIO,SwchB,$1,  $22<<3,y5,  STR_Palette+hex_str(PI_BGR_2)); // 
data_spawn(rm+STR_PRIO,SwchB,$1,  $3C<<3,y5,  STR_Palette+hex_str(PI_BGR_2)); // 
data_spawn_2a(STR_Challenge,Challenge_SwitchB,$3,  $00<<3,(row0+$00)<<3,  -1);


clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXU0,etA4,0,  $00,row_e0,  clms0,ROWS5,  $20,row_e4,  '86'+EXD0_); // UP  0, Pit up 
data_exit(EXM0,etB0,0,  clm4,row6,  clms4,ROWS2,  clm4-1,row6,  '88'+EXM0_, 1); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '84'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '87'+EXL1_); // RGT 0, 








//   --------------------------  86  --------------------------- 
//    PalcZ. Pushable origin scene
rm_num  = $86;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'005', _ow_axis);


row3=row0+$16; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
//row5=row0+$17; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($10<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($40<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($50<<3)-4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

_dk=data_spawn(rm+STR_PRIO,PushA,$3,  $17<<3,(row0+$12)<<3,  STR_Palette+hex_str(_Pushable_PI)); // Pushable
data_spawn(rm+STR_PRIO,PushableRefresher,$1,  $06<<3,(row0+$14)<<3,  STR_Palette+hex_str(PI_BGR_1),  object_get_name(PushA)+dk_SpawnDatakey+_dk);

clms3=clms0; clm3=$00;
_exit=data_exit(EXD0,etA1,1,  clm3,row_e2,  clms3,ROWS5,  clms1,row_e3,  '85'+EXU0_); // DWN 0, Pit down 
//data_pit(_exit, 0,8);
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '87'+EXL0_); // RGT 0, 








//   --------------------------  87  --------------------------- 
//    PalcZ. Elevator shaft
rm_num  = $87;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'006', STR_View+'02', _ow_axis);


row3=$0A; y3=row3<<3; // PC spawn row Left0 exit
row4=$54; y4=row4<<3; // PC spawn row Left1 exit
row5=$52; y5=row5<<3;
row6=row4+$01; y6=row6<<3;
clm3=$10; clms3=$03; // clm3: elevator center clm
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3-clms3)<<3)-4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ((clm3+clms3)<<3)-4,y6,  STR_Lit); // v1: Light w/ CANDLE or FIRE

clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
_dk=data_spawn(rm+STR_PRIO,ElevA,1,  clm3,row5);
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+EXL0_] = $07;
g.dm_spawn[?_dk+STR_Elevator+STR_Spawn+STR_Row+EXL1_] = row5;


//data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  0); // UP  0, Elevator up  
//data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  0); // DWN 0, Elevator down 
//data_Elev(EXD0_+EXU0_,  clm3,row0+$15);                                        // Elevator DW $40, UP $80, 
rows3=$08; rows4=rows3<<1;
data_exit(EXL0,etA0,1,  CLM2,row3-rows3,  CLMS2,rows4,  CLM3,row3,  '86'+EXR0_); // LFT 0, 
data_exit(EXL1,etA0,1,  CLM2,row4-rows3,  CLMS2,rows4,  CLM3,row4,  '85'+EXR0_); // LFT 1, 








//   --------------------------  88  --------------------------- 
//    
rm_num  = $88;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'009', _ow_axis);


row3=row0+$13; y3=row3<<3; // PC spawn row
row4=row0+$0F; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($17<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($27<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($37<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($47<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
/* // Next to doors
data_spawn(rm+STR_PRIO,TorchA,$1,  $0E<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $13<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $4C<<3,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $51<<3,y7,  STR_Lit); // v1: Light w/ CANDLE or FIRE
*/

clm3=clm1-1; x3=clm3<<3;
y5=row4<<3;
y6=y5-($03<<3);
//y5=(row3+$02)<<3; y5-=2;
//y6=y5-$10; y6-=4;
_val1=hex_str($28); // Speed
_val2=hex_str($3);  // Movement Direction. $1,2 bits: Horizontal, $4,8 bits: Vertical. Include both bits so first movement is towards pc
_val3=hex_str($28); // Idle Duration after hitting solid
data_spawn(rm+STR_PRIO,SpTrA,$1,  x3,y5,  STR_Speed+_val1,STR_Direction+_val2,STR_Duration+_val3, "_Skull"); // SpikeTrapA $1
data_spawn(rm+STR_PRIO,SpTrA,$1,  x3,y6,  STR_Speed+_val1,STR_Direction+_val2,STR_Duration+_val3, "_Skull"); // SpikeTrapA $1


clm3=$0D; clm4=$51; clms3=$02;
data_exit(EXM0,etB0,1,  clm3,row3,  clms3,ROWS2,  clm3+1,row3,  rm_num_+EXM1_, 0); // MID 0, 
data_exit(EXM1,etB0,1,  clm4,row3,  clms3,ROWS2,  clm4-1,row3,  '89'+EXR0_, 0); // MID 1, 








//   --------------------------  89  --------------------------- 
//    
rm_num  = $89;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'010', STR_View+'02', _ow_axis);


row3=$08; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=$74; y5=row5<<3; // PC spawn row Mid exit
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,$77<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clms4=$02; clm4=$2A;
//clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXM0,etB0,1,  clm4,row5,  clms4,ROWS2,  clm4-1,row5,  '8A'+EXM0_, 0); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '88'+EXM1_); // RGT 0, 








//   --------------------------  8A  --------------------------- 
//    
rm_num  = $8A;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'011', STR_View+'02', _ow_axis);


row3=$08; y3=row3<<3; // PC spawn row Right exit
row4=row3+$01; y4=row4<<3;
row5=$6E; y5=row5<<3; // PC spawn row Mid exit
data_spawn(rm+STR_PRIO,TorchA,$1,  $34<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  ($20<<3)-4,$77<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,Backwall,$1,  $00<<3,$7A<<3,  STR_Depth+string(DEPTH_FG2-1), STR_Min+'_Y'+hex_str($0D<<3), STR_Direction+'08', STR_Speed+'08', STR_Delay+'80'); // Backwall $1


clms4=$02; clm4=clm1-$01;
//clms4=$02; clm4=clm1-(clms4>>1);
data_exit(EXM0,etB0,0,  clm4,row6,  clms4,ROWS2,  clm4-1,row5,  '89'+EXM0_, 1); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  '8B'+EXL0_); // RGT 0, 








//   --------------------------  8B  --------------------------- 
//    
rm_num  = $8B;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'016', _ow_axis);


row3=row0+$0E; y3=row3<<3; // PC spawn row Right,Left exit
row4=row3+$02; y4=row4<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($1C<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($22<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=clm1; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  rm_num_+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  rm_num_+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row0+$0D);                               // Elevator DW $40, UP $80, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  '8A'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXL0_); // RGT 0, 

_dk=rm+STR_Exit+STR_Sequence; _a=0;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXD0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXR0_;
g.dm_rm[?_dk+hex_str(++_a)] = rm+EXU0_;
g.dm_rm[?_dk+STR_Count] = _a;
g.dm_rm[?_dk+STR_Complete+STR_Exit+STR_Name] = Area_MazIs+hex_str(rm_num+1)+EXD0_;








//   --------------------------  8C  --------------------------- 
//    
rm_num  = $8C;
set_rm_data(area+hex_str(rm_num), mus0, _DARK_DATA, STR_Tile+area_PZ+'020', STR_View+'02', _ow_axis);


clm6=$19; x6=clm6<<3;
clm7=$26; x7=clm7<<3;
row3=$1C; y3=row3<<3;
row4=$40; y4=row4<<3;
row5=$64; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x6,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  x7,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$0A; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm left  side
clm6=$36; clm7=clm6-$04; clm8=clm6-$01; // clm6: elevator center clm right side
data_exit(EXU0,etC0,1,  clm7,row_e0,  CLMS4,ROWS5,  clm8,row_e1,  rm_num_+EXD0_); // UP  0, Elevator up  
data_Elev(EXU0_,  clm6,$18); // Elevator UP $80, 
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  '8B'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_,  clm3,$63); // Elevator DW $40, 

data_Elev(0,  clm3,$2B); // Elevator confined w/in scene. Doesn't go to an exit.
data_Elev(0,  clm6,$4F); // Elevator confined w/in scene. Doesn't go to an exit.








//   --------------------------  8D  --------------------------- 
//    
rm_num      = $8D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  8E  --------------------------- 
//    
rm_num      = $8E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  8F  --------------------------- 
//    
rm_num      = $8F; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  90  --------------------------- 
//    
rm_num      = $90; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  91  --------------------------- 
//    
rm_num      = $91; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  92  --------------------------- 
//    
rm_num      = $92; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  93  --------------------------- 
//    
rm_num      = $93; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  94  --------------------------- 
//    
rm_num      = $94; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  95  --------------------------- 
//    
rm_num      = $95; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  96  --------------------------- 
//    
rm_num      = $96; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  97  --------------------------- 
//    
rm_num      = $97; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  98  --------------------------- 
//    
rm_num      = $98; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  99  --------------------------- 
//    
rm_num      = $99; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  9A  --------------------------- 
//    
rm_num      = $9A; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  9B  --------------------------- 
//    
rm_num      = $9B; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  9C  --------------------------- 
//    
rm_num      = $9C; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  9D  --------------------------- 
//    
rm_num      = $9D; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  9E  --------------------------- 
//    
rm_num      = $9E; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  9F  --------------------------- 
//    
rm_num      = $9F; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A0  --------------------------- 
//    
rm_num      = $A0; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A1  --------------------------- 
//    
rm_num      = $A1; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A2  --------------------------- 
//    
rm_num      = $A2; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A3  --------------------------- 
//    
rm_num      = $A3; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A4  --------------------------- 
//    
rm_num      = $A4; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A5  --------------------------- 
//    
rm_num      = $A5; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A6  --------------------------- 
//    
rm_num      = $A6; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A7  --------------------------- 
//    
rm_num      = $A7; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A8  --------------------------- 
//    
rm_num      = $A8; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  A9  --------------------------- 
//    
rm_num      = $A9; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  AA  --------------------------- 
//    
rm_num      = $AA; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  AB  --------------------------- 
//    
rm_num      = $AB; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  AC  --------------------------- 
//    
rm_num      = $AC; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  AD  --------------------------- 
//    
rm_num      = $AD; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  AE  --------------------------- 
//    
rm_num      = $AE; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  AF  --------------------------- 
//    
rm_num      = $AF; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B0  --------------------------- 
//    
rm_num      = $B0; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B1  --------------------------- 
//    
rm_num      = $B1; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B2  --------------------------- 
//    
rm_num      = $B2; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B3  --------------------------- 
//    
rm_num      = $B3; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B4  --------------------------- 
//    
rm_num      = $B4; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B5  --------------------------- 
//    
rm_num      = $B5; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B6  --------------------------- 
//    
rm_num      = $B6; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B7  --------------------------- 
//    
rm_num      = $B7; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B8  --------------------------- 
//    
rm_num      = $B8; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  B9  --------------------------- 
//    
rm_num      = $B9; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  BA  --------------------------- 
//    
rm_num      = $BA; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  BB  --------------------------- 
//    
rm_num      = $BB; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  BC  --------------------------- 
//    
rm_num      = $BC; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  BD  --------------------------- 
//    
rm_num      = $BD; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  BE  --------------------------- 
//    
rm_num      = $BE; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  BF  --------------------------- 
//    
rm_num      = $BF; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  C0  --------------------------- 
//    Using this for viewing old unused Tiled files
rm_num  = $C0;
set_rm_data(area+hex_str(rm_num), STR_Basement, STR_Tile+RM_NPALACE_FILE_NAME);


if (g.FileCleaning01_STATE) g.FileCleaning01_rm_name = rm;
row3=row0+$14; y3=row3<<3;
row4=row0+$10; y4=row4<<3;
row5=$1C; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $10<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $12<<3,y5,  STR_Lit); // v1: Light w/ CANDLE or FIRE


clm3=$1E;
data_exit(EXM0,etB0,0,  clm3,row4,  $02,ROWS2,  clm3-1,row4,  rm_num_+EXM0_); // MID 0, 
//data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  C1  --------------------------- 
//    Testing: 
rm_num      = $C1; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C2  --------------------------- 
//    Testing: 
rm_num      = $C2; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C3  --------------------------- 
//    Testing: 
rm_num      = $C3; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C4  --------------------------- 
//    Testing: 
rm_num      = $C4; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C5  --------------------------- 
//    Testing: 
rm_num      = $C5; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C6  --------------------------- 
//    Testing: 
rm_num      = $C6; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C7  --------------------------- 
//    Testing: 
rm_num      = $C7; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C8  --------------------------- 
//    Testing: 
rm_num      = $C8; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  C9  --------------------------- 
//    Testing: 
rm_num      = $C9; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  CA  --------------------------- 
//    Testing: 
rm_num      = $CA; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  CB  --------------------------- 
//    Testing: 
rm_num      = $CB; 
rm_num_     = hex_str(rm_num);
rm_name     = area +  rm_num_;

// set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'255', STR_ow_axis+'00');
// _w = rm_get_wh(rm_name,0);
// _h = rm_get_wh(rm_name,1);


//   --------------------------  CC  --------------------------- 
//    Testing: Dungeon entrance idea 1
rm_num      = $CC; 
rm_num_     = hex_str(rm_num);


//   --------------------------  CD  --------------------------- 
//    Testing: Stone Heads outside rm idea 1a
rm_num      = $CD; 
rm_num_     = hex_str(rm_num);


//   --------------------------  CE  --------------------------- 
//    Testing: Stone Heads Dungeon rm idea 1a
rm_num      = $CE; 
rm_num_     = hex_str(rm_num);


//   --------------------------  CF  --------------------------- 
//    Testing: Scenery idea, 1 page rm w/ sign
rm_num      = $CF; 
rm_num_     = hex_str(rm_num);


//   --------------------------  D0  --------------------------- 
//    Testing: Outside, vertical, rocky & palace style
rm_num      = $D0; 
rm_num_     = hex_str(rm_num);


//   --------------------------  D1  --------------------------- 
//    Testing: Long bridge 1
rm_num      = $D1; 
rm_num_     = hex_str(rm_num);


//   --------------------------  D2  --------------------------- 
//    Testing: Desert rm w/ Palace 1 bricks
rm_num      = $D2;
rm_num_     = hex_str(rm_num);


//   --------------------------  D3  --------------------------- 
//    Testing: SMB world 1-1
rm_num      = $D3; 
rm_num_     = hex_str(rm_num);


//   --------------------------  D4  --------------------------- 
//    Testing: Sky Palace rm 000_01
rm_num      = $D4; 
rm_num_     = hex_str(rm_num);


//   --------------------------  D5  --------------------------- 
//    Testing: Bubble cling to walls test 1
rm_num      = $D5; 
rm_num_     = hex_str(rm_num);


//   --------------------------  D6  --------------------------- 
//   Poison bubble trap on path to HEART 1  
rm_num      = $D6;  
rm_name     = area + hex_str(rm_num);  


//   --------------------------  D7  --------------------------- 
//    Testing: Small rm test 1
rm_num      = $D7; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  D8  --------------------------- 
//     Testing: Cucco long float test 1
rm_num      = $D8;  
rm_name     = area + hex_str(rm_num);


//   --------------------------  D9  --------------------------- 
//    Testing: scs testing 1
rm_num      = $D9; 
rm_name     = area + hex_str(rm_num);


//   --------------------------  DA  --------------------------- 
//    Testing: TonnA test 1
rm_num      = $DA; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  DB  --------------------------- 
//    Testing: Challenge_LightTorchesA test 1
rm_num      = $DB; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  DC  --------------------------- 
//    Testing: TorchA test 1
rm_num      = $DC; 
rm_name     = area + hex_str(rm_num);


//   --------------------------  DD  --------------------------- 
//    Testing: Tyell test 1 & Challenge_DefeatAllA test 2
rm_num      = $DD; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  DE  --------------------------- 
//    Testing: Challenge_DefeatAllA test 1
rm_num      = $DE; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  DF  --------------------------- 
//    Testing: Teleporting Kakusu test 1
rm_num      = $DF; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  E0  --------------------------- 
//    Testing: Cucco 1 tile-high tunnel test 1
rm_num      = $E0; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  E1  --------------------------- 
//    Testing: Snaraa test 1
rm_num      = $E1; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  E2  --------------------------- 
//    Testing: Platforms (Circle movement) test 1
rm_num      = $E2; 
rm_name     = area + hex_str(rm_num); 


//   --------------------------  E3  --------------------------- 
//    Testing: Eyenocc
rm_num  = $E3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'218', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$00; y4=row4<<3; // PC spawn row Right exit
row5=row0+$0F; y5=row5<<3;
row6=row0+$01; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
clm3=$73;
clm4=clm3-$03;
row7=row6+$0C;
_val  =object_get_name(Eyenocc)+"_"+STR_Sequence;
_val += hex_str(row7)+hex_str(clm3);
_val += hex_str(row7)+hex_str(clm4);
_val += "_";
data_spawn(rm+STR_PRIO,Eyenocc,$1,  clm3<<3,row6<<3,  _val); // Eyenocc  1 

data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E4  --------------------------- 
//    Testing: Burnables Puzzle 2
rm_num  = $E4;
set_rm_data(area+hex_str(rm_num), STR_Dungeon+"01", STR_Tile+area_MI+'217', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$06; y4=row4<<3; // PC spawn row Right exit
row5=row0+$16; y5=row5<<3;
//row6=row0+$08; y6=row6<<3;
data_spawn(rm+STR_PRIO,PushA,$2,  $5C<<3,(row0-$02)<<3,  STR_Palette+hex_str(PI_BGR_4)); // Pushable
data_spawn(rm+STR_PRXM,OctoA,$1,  $20<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $30<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $40<<3,y5); // Octorok  1 
data_spawn(rm+STR_PRXM,OctoA,$1,  $50<<3,y5); // Octorok  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E5  --------------------------- 
//    Testing: Downstab pogo across room
rm_num  = $E5;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'218', STR_ow_axis+'00');


row3=row0+$14; y3=row3<<3; // PC spawn row Left exit
row4=row0+$00; y4=row4<<3; // PC spawn row Right exit
row5=row0+$0F; y5=row5<<3;
//row6=row0+$08; y6=row6<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
var _PI1=PI_MOB_BLU;
var _DUR=4; // SpTrC revolution duration
data_spin_trap(SpTrC,$1,  $30<<3,(row0+$10)<<3,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  $50<<3,(row0+$0C)<<3,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  $70<<3,(row0+$08)<<3,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spawn(rm+STR_PRIO,Blooby,$1,  $1F<<3,(row0+$15)<<3,  1,$00); // Blooby 1
data_spawn(rm+STR_PRIO,Blooby,$1,  $3F<<3,y5,  1,$00); // Blooby 1
data_spawn(rm+STR_PRIO,Blooby,$1,  $5F<<3,y5,  1,$00); // Blooby 1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E6  --------------------------- 
//    Testing: Burnables Puzzle 1
rm_num  = $E6;
set_rm_data(area+hex_str(rm_num), STR_Dungeon+"01", STR_Tile+area_MI+'219', STR_ow_axis+'00');


row3=row0+$16; y3=row3<<3; // PC spawn row Left exit
row4=row0+$12; y4=row4<<3; // PC spawn row Right exit
row5=row0+$00; y5=row5<<3;
row6=row0+$08; y6=row6<<3;
var _PI1=PI_MOB_BLU;
var _DUR=4; // SpTrC revolution duration
data_spin_trap(SpTrC,$1,  $1C<<3,y6,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  $64<<3,y6,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spawn(rm+STR_PRXM,IrKnA,$3,  $18<<3,y5); // IronKnuckle  3
//data_spawn(rm+STR_PRXM,IrKnA,$3,  $60<<3,y5); // IronKnuckle  3
data_spawn(rm+STR_PRXM,GeruA,$1,  $60<<3,y5); // Geru  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,y5); // Bot  1
//data_spawn(rm+STR_PRXM,Bot_A,$1,  $6A<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,BubbA,$1,  $68<<3,y5,  STR_Direction+hex_str($2|$4)); // Bubble  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E7  --------------------------- 
//    Idea: Spinning Spike Traps
rm_num  = $E7;
set_rm_data(area+hex_str(rm_num), STR_Dungeon+"01", STR_Tile+area_MI+'220', STR_ow_axis+'00');


row3=row0+$0A; y3=row3<<3; // PC spawn row Right+Left exit
row4=row3+$01; y4=row4<<3;
row5=row0+$10; y5=row5<<3;
var _DUR = 4; // SpTrC revolution duration
var _PI1 = PI_MOB_BLU; // To contrast w/ red walls
_dist=$0A<<3; 
x3=($0F<<3)+4; _a=0;
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
//                                                                          //
data_spin_trap(SpTrC,$1,  x0,               y5,  _PI1,  8, 1,_DUR-1,2*90); // SpTrC: spins on chain
//                                                                          //
x3=($48<<3)+4; _a=0;
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  8, 1,_DUR,2*90); // SpTrC: spins on chain
data_spin_trap(SpTrC,$1,  x3+(_dist*(_a++)),y5,  _PI1,  7,-1,_DUR,3*90); // SpTrC: spins on chain


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E8  --------------------------- 
//    Testing: Vertical challenge. Stab wall in middle of jump and use pushback to get to higher level
rm_num  = $E8;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'221', STR_View+'02', STR_ow_axis+'00');


row3=row0+$0E; y3=row3<<3; // PC spawn row Right exit
row4=$0B; y4=row4<<3;


clm3=$0C;
data_exit(EXM0,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3+1,row4,  rm_num_+EXM0_); // MID 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  E9  --------------------------- 
//    Super Mario Bros 1, 1-1 rendition
rm_num  = $E9;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+COLOR3_, STR_Tile+area_MI+'222', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_spawn(rm+STR_PRXM,Bot_A,$1,  $56<<3,y3); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  EA  --------------------------- 
//    Testing: Horizontal moving platform
rm_num  = $EA;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Tile+area_MI+'223', STR_ow_axis+'00');


row3=row0+$08; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$16; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
clm3=$35; clm4=$48;
_data=hex_str(row5)+hex_str(clm3) + hex_str(row5)+hex_str(clm4);
data_Platform(PlatformA,$1,  clm3<<3,(row0+$16)<<3,  PI_MOB_ORG, 1, 0, _data);


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  EB  --------------------------- 
//    Moai outside 1
rm_num  = $EB;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_EA+'081', STR_ow_axis+'00');


row3=row0+$17; y3=row3<<3;
row4=row0+$04; y4=row4<<3;
row5=row0+$19; y5=row5<<3;
data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
data_spawn(rm+STR_PRXM,Moa_B,$1,  $24<<3,y4); // FieryMoa  1
//data_spawn(rm+STR_PRXM,Moa_A,$1,  $12<<3,y4); // Moa  1 
//data_spawn(rm+STR_PRXM,Moa_A,$1,  $30<<3,y4); // Moa  1 
//data_spawn(rm+STR_PRXM,Moa_A,$1,  $5C<<3,y4); // Moa  1 
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1B<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $4B<<3,y3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $68<<3,y5); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  rm_num_+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  rm_num_+EXR0_); // RGT 0, 








//   --------------------------  EC  --------------------------- 
//     Testing: Slimes running across gaps. Gaps are 4 clms wide.
// Test unsuccessful, 4 clm gaps are too wide.
rm_num  = $EC;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Dark+'01', STR_Tile+area_MI+'224', STR_ow_axis+'00');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$00; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($09<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($75<<3)+4,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

x3=$0C<<3; _dist=($06<<3)<<1;                             _i=0;
//repeat($0A) data_spawn(rm+STR_PRXM,Myu_A,$1,  x3+(_dist*_i++),y5); // 
repeat($0A) data_spawn(rm+STR_PRXM,Bot_A,$4,  x3+(_dist*_i++),y5); // v4: Nyb


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  hex_str(rm_num)+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  hex_str(rm_num)+EXR0_); // RGT 0, 








//   --------------------------  ED  --------------------------- 
//     Testing: Slimes running across gaps. Gaps are 3 clms wide.
// Test was successful. Slimes can run across 3 clm wide gaps as long as they are using the fast hspd.
rm_num  = $ED;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Dark+'01', STR_Tile+area_MI+'225', STR_ow_axis+'00');


row3=row0+$10; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row0+$00; y5=row5<<3;
data_spawn(rm+STR_PRIO,TorchA,$1,  $06<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $79<<3,y4,  STR_Lit); // v1: Light w/ CANDLE or FIRE

x3=$03<<3; _dist=($05<<3)<<1;                             _i=0;
repeat($0C) data_spawn(rm+STR_PRXM,Bot_A,$4,  x3+(_dist*_i++),y5); // v4: Nyb
//x3=$03<<3; _dist=$05<<3;                                  _i=0;
//repeat($19) data_spawn(rm+STR_PRXM,Bot_A,$4,  x3+(_dist*_i++),y5); // v4: Nyb


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  hex_str(rm_num)+EXL0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  hex_str(rm_num)+EXR0_); // RGT 0, 









//   --------------------------  EE  --------------------------- 
//    Testing: Fokka Elevator Guantlet 1
rm_num  = $EE;
set_rm_data(area+hex_str(rm_num), MUS_DUNGEON1, STR_Tile+area_MI+'226', STR_View+'02', STR_ow_axis+'00', STR_show_ow_pos+'00');


//row3=row0+$17; y3=row3<<3;
//row4=row0+$03; y4=row4<<3;
x3=$08<<3; x4=$36<<3;
data_spawn(rm+STR_PRXM,FokkA,$2,  x3,$28<<3); // Fokka  2
data_spawn(rm+STR_PRXM,FokkA,$2,  x4,$28<<3); // Fokka  2
data_spawn(rm+STR_PRXM,FokkA,$2,  x3,$48<<3); // Fokka  2
data_spawn(rm+STR_PRXM,FokkA,$2,  x4,$68<<3); // Fokka  2


clm3=clm1; clm4=clm3-$04; clm5=clm3-$01; // clm3: elevator center clm
data_exit(EXU0,etC0,1,  clm4,row_e0,  CLMS4,ROWS5,  clm5,row_e1,  hex_str(rm_num)+EXD0_); // UP  0, Elevator up  
data_exit(EXD0,etC0,1,  clm4,row_e2,  CLMS4,ROWS5,  clm5,row_e3,  hex_str(rm_num)+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_,  clm3,row_e5); // Elevator DW $40, UP $80, 








//   --------------------------  EF  --------------------------- 
//     Walking the dog scene
rm_num  = $EF;
set_rm_data(area+hex_str(rm_num), STR_Rauru, STR_Color+COLOR3_, STR_Tile+area_MI+'227', STR_ow_axis+'00', STR_show_ow_pos+'00');


data_NIAO_1a(rm+STR_NIAO+'0',  $0800,  1,Cloud_1_init); // 
clm3=$1F; // Door center clm
clm4=clm3-3; clm5=clm3+1; row3=row0+$18; row4=row3+1;
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm4<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm5<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


clm4=clm3+1; row3=row0+$18;
//data_exit(EXM0,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  0); // MID 0, to Overworld 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  F0  --------------------------- 
//     Testing Small Dungeon Room 2
rm_num  = $F0;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'228', STR_ow_axis+'00', STR_show_ow_pos+'00');


clm3=$10; clm4=clm3-$03; clm5=clm3+$01;
row3=row0+$0E; y3=row3<<3;
row4=row3+$01; y4=row4<<3;
row5=row3+$02; y5=row5<<3;
row6=row0+$00; y6=row6<<3;
row7=row6+$02; y7=row7<<3;
//data_NIAO_1a(rm+STR_NIAO+'0', $0000, 1,Cloud_1_init);
//data_NIAO_1a(rm+STR_NIAO+'1', $0000, 3,StarSky_1_init);
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm4<<3)+4,y4,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm5<<3)+4,y4,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
if(1){
data_spawn(rm+STR_PRXM,BubbA,$2,  $10<<3,y3,  STR_Direction+hex_str($1|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $20<<3,y5,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $30<<3,y3,  STR_Direction+hex_str($1|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $08<<3,y7,  STR_Direction+hex_str($2|$8)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $18<<3,y6,  STR_Direction+hex_str($1|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $28<<3,y7,  STR_Direction+hex_str($2|$4)); // Bubble  2
data_spawn(rm+STR_PRXM,BubbA,$2,  $38<<3,y6,  STR_Direction+hex_str($1|$8)); // Bubble  2
}


clm3=$0F; clm4=clm3+$20;
data_exit(EXM0,etB0,1,  clm3,row3,  CLMS2,ROWS2,  clm3+1,row3,  0); // MID 0, to Overworld 
data_exit(EXM1,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4-1,row3,  0); // MID 1, to Overworld 








//   --------------------------  F1  --------------------------- 
//     Testing Small Dungeon Room 1
rm_num  = $F1;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'229', STR_ow_axis+'00', STR_show_ow_pos+'00');


clm3=clm1; // Door center clm
clm4=clm3-3; clm5=clm3+1; row3=row0+$0E; row4=row3+1;
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm4<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  (clm5<<3)+4,row4<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


clm4=clm3-1;
data_exit(EXM0,etB0,1,  clm4,row3,  CLMS2,ROWS2,  clm4+1,row3,  0); // MID 0, to Overworld 
//data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
//data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0E,  0); // RGT 0, to Overworld 








//   --------------------------  F2  --------------------------- 
//    .
rm_num  = $F2;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'01', STR_Tile+area_MI+'232', STR_ow_axis+'00', STR_show_ow_pos+'00');


//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,$37<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,$39<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
//data_spawn(rm+STR_PRIO,TorchA,$1,  $37<<3,$09<<3,  STR_Lit); // v1: Light w/ CANDLE or FIRE
x3 = $20<<3;  y3 = $20<<3;
_len=$16; _dir=1; _dur=$10;
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  0*90); // Firerope
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  1*90); // Firerope
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  2*90); // Firerope
data_spin_trap(FiRoA,1,  x3,y3,  -1,  _len,_dir,_dur,  3*90); // Firerope


row3=-PAGE_ROWS; row4=row1; rows3=abs(row4-row3);
row5=rows0+PAGE_ROWS; rows5=row5-row4;
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$36,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows3,  clmA,$08,  0); // RGT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row4,  CLMS2,rows5,  clmA,$38,  0); // RGT 0, to Overworld 








//   --------------------------  F3  --------------------------- 
//     Testing spikes
rm_num  = $F3;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Dark+'00', STR_Tile+area_MI+'233', STR_ow_axis+'00', STR_show_ow_pos+'00');


data_spawn(rm+STR_PRIO,TorchA,$1,  $19<<3,(row0+$13)<<3,  STR_Lit,STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$18,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0E,  0); // RGT 0, to Overworld 








//  ==================================================================================
//  ==================================================================================
mus0 = Audio.MUS_Z1_DNGN1;
ow_axis = 0;
//   --------------------------  F4  --------------------------- 
//     .
rm_num  = $F4;
set_rm_data(area+hex_str(rm_num), STR_Battle+'02', STR_Tile+area_MI+'234', STR_ow_axis+hex_str(!ow_axis));


row4 = row0+$17;
y3 = (row0+$13)<<3;
//data_NIAO_1a( rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


clm3 = $21;
data_exit(EXM0,etB0,1,  clm3-1,row4,  CLMS2,ROWS2,  clm3+1,row4,  'FB'+EXL0_); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 








//   --------------------------  F5  --------------------------- 
//     .
rm_num  = $F5;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+'01', STR_Tile+area_EA+'135', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


y3 =(row0+$17)<<3;
//data_spawn(rm+STR_PRIO,TorchA,$1,  XT0,(row0+$16)<<3,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $19<<3,y3,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  $25<<3,y3,  STR_Brightness+'2'); // v1: Light w/ CANDLE or FIRE
y3 =(row0+$0C)<<3;  _pi=PI_BGR_2;
data_spawn(rm+STR_PRIO,SpDrA,$3,  $13<<3,y3,  STR_Palette+hex_str(_pi),STR_Type+hex_str(4)); // Drop spawner v3. Drops Bot & Flame1
data_spawn(rm+STR_PRIO,SpDrA,$3,  $2B<<3,y3,  STR_Palette+hex_str(_pi),STR_Type+hex_str(4)); // Drop spawner v3. Drops Bot & Flame1


//data_exit(EXU0,etA4,0,  $0A,row_e0,  $2C,ROWS_E0,  clm1-1,row_e4,  rm_num_+EXU0_); // UP  0, Pit up 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$15,  'F6'+EXR0_); // LFT 0, 


data_spawn(rm+STR_PRIO,ItmE0,$1,  $34<<3,(row0+$15)<<3); // Magic Jar (Full)








//   --------------------------  F6  --------------------------- 
//     .
rm_num  = $F6;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+'01', STR_Tile+area_MI+'235', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


row3 = $10;
y3   = row3<<3;
y4   =(row3+1)<<3;
_pi  = PI_BGR_4;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($0B<<3)+4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($13<<3)+4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($2B<<3)+4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($33<<3)+4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($4B<<3)+4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($53<<3)+4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
y4=$06<<3;  _pi=PI_BGR_2;
data_spawn(rm+STR_PRIO,SpDrA,$1,  $0F<<3,y4,  STR_Palette+hex_str(_pi),STR_Type+hex_str(4)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $2F<<3,y4,  STR_Palette+hex_str(_pi),STR_Type+hex_str(4)); // DropSpawner  1
data_spawn(rm+STR_PRIO,SpDrA,$1,  $4F<<3,y4,  STR_Palette+hex_str(_pi),STR_Type+hex_str(4)); // DropSpawner  1

data_spawn(rm+STR_PRXM,Stallakk,$1,  $1E<<3,y3,  STR_Direction+string(-1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $2D<<3,y3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $47<<3,y3,  STR_Direction+string(-1)); // Stallakk  1 
y4=$78<<3;
data_spawn(rm+STR_PRXM,Stallakk,$1,  $13<<3,$34<<3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $0A<<3,$5C<<3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $34<<3,$5C<<3,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $08<<3,y4,  STR_Direction+string(1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $2E<<3,y4,  STR_Direction+string(-1)); // Stallakk  1 
data_spawn(rm+STR_PRXM,Stallakk,$1,  $38<<3,y4,  STR_Direction+string(1)); // Stallakk  1 

data_spawn(rm+STR_PRXM,BubbA,$2,  $18<<3,$34<<3,  STR_Direction+hex_str($1|$4)); // Bubble fast
data_spawn(rm+STR_PRXM,BubbA,$2,  $3C<<3,$3C<<3,  STR_Direction+hex_str($2|$4)); // Bubble fast
data_spawn(rm+STR_PRXM,BubbA,$2,  $38<<3,$66<<3,  STR_Direction+hex_str($2|$8)); // Bubble fast

_pi = PI_BGR_2;
//data_spawn(rm+STR_PRXM,Snaraa,$1,  $38<<3,$0D<<3,  STR_Palette+hex_str(_pi)); // Snaraa
y4=$26<<3;  y5=$7A<<3;
data_spawn(rm+STR_PRXM,Bot_A,$1,  $15<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2B<<3,y4); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $16<<3,$36<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $20<<3,$42<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $10<<3,$5E<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $3E<<3,$5E<<3); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $04<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $1E<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $2F<<3,y5); // Bot  1
data_spawn(rm+STR_PRXM,Bot_A,$1,  $48<<3,y5); // Bot  1


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  'F7'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  'F5'+EXL0_); // RGT 0, 
//data_exit(EXR1,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$18,  rm_num_+EXR1_); // RGT 1, 


data_spawn(rm+STR_PRIO,ItmF0,$1,  $33<<3,$4E<<3); // PBag 1: 50 







//   --------------------------  F7  --------------------------- 
//     .
rm_num  = $F7;
set_rm_data(area+hex_str(rm_num), mus0, STR_Dark+'01', STR_Tile+area_MI+'237', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


x3 = $57<<3; y3 =((row0+$19)<<3)+3;
_data  = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF) + hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  PI_BGR_3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);
row4 = row0+$16;
row3 = row0+$17;
y3   = row3<<3;
_pi  = PI_BGR_4;
data_spawn(rm+STR_PRIO,TorchA,$1,  ($08<<3)+4,y3,  STR_Palette+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  ($16<<3)+4,y3,  STR_Palette+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
y3   =(row0+$13)<<3;
data_spawn(rm+STR_PRXM,Stallakk,$1,  $40<<3,(row3<<3)+3); // Stallakk  1 


clm3  = $10; // Elevator center
data_exit(EXU0,etC0,1,  clm3-4,row_e0,  CLMS4,ROWS_E0,  clm3-1,row_e1,  'F8'+EXD0_); // UP  0, Elevator up 
data_Elev(EXU0_, clm3,row0+$14);                                            // Elevator UP $80, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row4,  'F6'+EXL0_); // RGT 0, 








//   --------------------------  F8  --------------------------- 
//     .
rm_num  = $F8;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'01', STR_Tile+area_MI+'239', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


x3   = $19<<3;
x4   = $26<<3;
y3   = $0A<<3;
y4   = $16<<3;
y5   = $22<<3;
y6   = $2E<<3;
y7   = $3A<<3;
_pi  = PI_BGR_4;
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y3,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y3,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y4,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y5,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y5,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y6,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y6,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x3,y7,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
data_spawn(rm+STR_PRIO,TorchA,$3,  x4,y7,  STR_Palette+hex_str(_pi),STR_Lit); // v3: Short sprite
_val=($01<<3)+2;
x3-=$01<<3;  x3 = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF);
x4+=$02<<3;  x4 = hex_str((x4>>8)&$FF)+hex_str((x4>>0)&$FF);
y3+=_val;    y3 = hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
y4+=_val;    y4 = hex_str((y4>>8)&$FF)+hex_str((y4>>0)&$FF);
y5+=_val;    y5 = hex_str((y5>>8)&$FF)+hex_str((y5>>0)&$FF);
y6+=_val;    y6 = hex_str((y6>>8)&$FF)+hex_str((y6>>0)&$FF);
y7+=_val;    y7 = hex_str((y7>>8)&$FF)+hex_str((y7>>0)&$FF);
_data  = x3+y3 + x4+y3;
_data += x3+y4 + x4+y4;
_data += x3+y5 + x4+y5;
_data += x3+y6 + x4+y6;
_data += x3+y7 + x4+y7;
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  PI_BGR_3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);


clm3  = clm1; // Elevator center clm
data_exit(EXU0,etC0,1,  clm3-4,ROWE0,  CLMS4,ROWS_E0,  clm3-1,ROWE1,  'FA'+EXD0_); // UP  0, Elevator up 
data_exit(EXD0,etC0,1,  clm3-4,row_e2,  CLMS4,ROWS_E0,  clm3-1,row_e3,  'F7'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_+EXU0_, clm3,row0+$15);                                            // Elevator DW $40, 







//   --------------------------  F9  --------------------------- 
//     .
rm_num  = $F9;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'01', STR_Tile+area_MI+'240', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


y3   =(row0+$13)<<3;
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


data_exit(EXD0,etA0,1,  $0A,row_e2,  $2C,ROWS_E0,  clm3,row_e3,  rm_num_+EXL0_); // DWN 0, Pit down 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$0C,  'FA'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$0C,  rm_num_+EXL0_); // RGT 0, 








//   --------------------------  FA  --------------------------- 
//     .
rm_num  = $FA;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'01', STR_Tile+area_MI+'241', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


x3 = $57<<3; y3 =((row0+$18)<<3)+3;
_data  = hex_str((x3>>8)&$FF)+hex_str((x3>>0)&$FF) + hex_str((y3>>8)&$FF)+hex_str((y3>>0)&$FF);
data_NIAO_1a(rm+STR_NIAO+"0",  $0000,1,AdditionalBGGraphics_init,  PI_BGR_3,  spr_Skull_2a_WRB,0,DEPTH_BG3-1,_data);

row3 = row0+$17;
y3   = row3<<3;
_pi  = PI_BGR_4;
//data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,row0+$15,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$3,  $58<<3,y3,  STR_Palette+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$3,  $69<<3,y3,  STR_Palette+hex_str(_pi)); // v1: Light w/ CANDLE or FIRE

y3   =(row0+$13)<<3;
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


clm3  = $61; // Elevator center
data_exit(EXD0,etC0,1,  clm3-4,row_e2+$08,  CLMS4,ROWS_E0,  clm3-1,row_e3,  'F8'+EXU0_); // DWN 0, Elevator down 
data_Elev(EXD0_, clm3,row0+$14);                                            // Elevator DW $40, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row0+$14,  'FB'+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row0+$16,  'F9'+EXL0_); // RGT 0, 








//   --------------------------  FB  --------------------------- 
//     .
rm_num  = $FB;
set_rm_data(area+hex_str(rm_num), 0, STR_Dark+'00', STR_Tile+area_MI+'238', STR_ow_axis+hex_str(ow_axis), STR_show_ow_pos+'00');


_pi=PI_BGR_4;
data_spawn(rm+STR_PRIO,TorchA,$1,  $08<<3,$0A<<3,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
data_spawn(rm+STR_PRIO,TorchA,$1,  xt0,$35<<3,  STR_Palette+hex_str(_pi),STR_Lit); // v1: Light w/ CANDLE or FIRE
y3   =(row0+$13)<<3;
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,$08,  'FB'+EXM0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,$34,  'FA'+EXL0_); // RGT 0, 








//  =====================================================================================
//  =====================================================================================
//  =====================================================================================
//  =====================================================================================
//   --------------------------  FC  --------------------------- 
//    Scenery art. Like inside North Palace
rm_num  = $FC;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'242', STR_ow_axis+'00');


                                _a=0;
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 1, Cloud_1_init); // 
data_NIAO_1a(rm+STR_NIAO+string(_a++), $0000, 3, StarSky_1_init); // 


row3 = row0+$13;
row4 = row0+$17;
data_exit(EXM0,etB0,0,  clm1-1,row4,  CLMS2,ROWS2,  clm1-2,row4,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,ROW0,  CLMS2,rows1,  CLM3,row3,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,ROW0,  CLMS2,rows1,  clmA,row3,  0); // RGT 0, to Overworld 








//   --------------------------  FD  --------------------------- 
//    Scenery art. Overgrown field in front of forest
rm_num  = $FD;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'243', STR_ow_axis+'00');


row4 = row0+$17;
y3 = (row0+$13)<<3;
//data_NIAO_1a( rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


row3 = -PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 






//   --------------------------  FE  --------------------------- 
//    Testing: Bounceable object 'Blooby'
rm_num  = $FE;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Color+p.CI_TEL4_, STR_Tile+area_MI+'254', STR_View+'02', STR_ow_axis+'00', STR_show_ow_pos+'00');


data_NIAO_1a(rm+STR_NIAO+'0', $0000,1, Cloud_1_init); // 
_val = "08"; // hspd
data_spawn(rm+STR_PRXM,Blooby,$1,  $27<<3,$70<<3,  STR_HSPD+STR_Direction+ "1",STR_HSPD+_val,"_XC_MIN"+hex_str($15<<3),"_XC_MAX"+hex_str($20<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $2C<<3,$58<<3,  STR_HSPD+STR_Direction+"-1",STR_HSPD+_val,"_XC_MIN"+hex_str($24<<3),"_XC_MAX"+hex_str($27<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $12<<3,$42<<3,  STR_HSPD+STR_Direction+ "1",STR_HSPD+_val,"_XC_MIN"+hex_str($24<<3),"_XC_MAX"+hex_str($2B<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $20<<3,$2C<<3,  STR_HSPD+STR_Direction+"-1",STR_HSPD+_val,"_XC_MIN"+hex_str($15<<3),"_XC_MAX"+hex_str($2B<<3)); // Blooby 1
data_spawn(rm+STR_PRXM,Blooby,$1,  $15<<3,$1C<<3,  STR_HSPD+STR_Direction+ "1",STR_HSPD+_val,"_XC_MIN"+hex_str($11<<3),"_XC_MAX"+hex_str($2F<<3)); // Blooby 1


row3 = -PAGE_ROWS;
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows1,  CLM3,$74,  rm_num_+EXR0_); // LFT 0, 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows1,  clmA,$0C,  rm_num_+EXL0_); // RGT 0, 






//   --------------------------  FF  --------------------------- 
//    Scenery art. Forest with bush house.
rm_num  = $FF;
set_rm_data(area+hex_str(rm_num), MUS_THEWILD, STR_Tile+area_MI+'255', STR_ow_axis+'00');


y3 = (row0+$13)<<3;
//data_NIAO_1a( rm+STR_NIAO+'0', $0000, 1, Cloud_1_init); // 
//data_spawn(rm+STR_PRXM,LowdA,$1,  $18<<3,y3); // Lowder  1 


clm3 = $2F;
row3 = -PAGE_ROWS;
row4 = row0+$17;
data_exit(EXM0,etB0,1,  clm3,row4,  CLMS2,ROWS2,  clm3-1,row4,  0); // MID 0, 
data_exit(EXL0,etA0,1,  CLM2,row3,  CLMS2,rows1,  CLM3,row4,  0); // LFT 0, to Overworld 
data_exit(EXR0,etA0,1,  clm2,row3,  CLMS2,rows1,  clmA,row4,  0); // RGT 0, to Overworld 




