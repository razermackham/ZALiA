/// rm_set_cam_1a(cam center x target, cam center y target)


g.view_dir_x = 1; // 071F
g.view_dir_y = 1; // 

view_wview[0] = g.VIEW_W;
view_hview[0] = g.VIEW_H;

set_camera_xy(clamp(argument0-viewW_(), cam_xl_min(),cam_xl_max()), 
              clamp(argument1-viewH_(), cam_yt_min(),cam_yt_max()) );
//




