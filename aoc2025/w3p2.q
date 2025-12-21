data: read0 `:w3data.txt;

max_value: {[val_str]
    init: 11;
    strg: "";
    fidx: 0;
    while[init>=0;
        fi: max (fidx)_(-1*init)_val_str;
        m_idx: ((fidx)_(-1*init)_val_str)?fi;
        strg: strg,fi;
        fidx: fidx + m_idx+1;
        init: init-1];
    :strg;
    }

sum "J"$ max_value each data
//171741365473332