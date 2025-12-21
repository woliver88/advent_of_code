data: read0 `:w3data.txt;

max_value: {[val_str]
    fi: max -1_val_str;
    fi_idx: (-1_val_str)?fi;
    si: max (fi_idx +1)_val_str;
    fi,si
    }

sum "J" $ max_value each data
//17316