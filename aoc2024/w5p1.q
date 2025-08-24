data: read0 `:aoc/w5data.txt
//brk: (where ""~/: data)[0]
brk: 1176
ln: count data
rules: "J"$ "|" vs/: (0;brk) sublist data
updates: "J"$ "," vs/: ((brk +1);(ln+1)) sublist data

update_check: {[ud]
    u:reverse ud;
    v: (til -1 + count u) _\: u;
    rules_to_check: raze {first[x],/: 1_x} each v;
    :any rules_to_check in\: rules;
    }

update_check_all: {[uds]
    ans: update_check each uds;
    //all indexes
    idxs: where ans=0;
    mid_vals: {x["j"$-1+count[x]%2]} each updates idxs;
    :sum mid_vals;
    }

//update_check_all updates
//4774