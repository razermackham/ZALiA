/// PalettePicker_pal_col_pos()


// ** Remember, in p.pal_rm_new, clms & rows are reversed.
var    _POS  =(pal_curs_idx mod PAL_COUNT) + PI_OFFSET;
       _POS *= global.COLORS_PER_PALETTE;
       _POS += pal_curs_idx div PAL_COUNT;
       //_POS += (pal_curs_idx div PAL_COUNT) + (global.COLORS_PER_PALETTE-COL_PER_PAL_);
       _POS  = (_POS<<1)+1; // because string pos
return _POS;




