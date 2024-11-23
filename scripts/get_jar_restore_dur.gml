/// get_jar_restore_dur(magic jar ver)

// ** This is equivilant to OG.


var     _container_cnt = 0;
switch(argument0){
case 1:{_container_cnt = cont_cnt_mp();  break;}
case 2:{_container_cnt = 1;              break;}
case 3:{_container_cnt = 1;              break;}
case 4:{_container_cnt = cont_cnt_mp();  break;}
}

return (_container_cnt*Container_AMT)>>1; // >>1 bc amt restored each frame of adjustment = 2




