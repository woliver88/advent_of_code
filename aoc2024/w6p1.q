data: read0 `:aoc2024/w6data.txt

all_obs: raze {x,/: where data[x]="#"} each til count data
sp0: raze raze {x,/: where data[x]="^"} each til count data
spaces_occupied: enlist starting
finished: 0b
width: count data[0]
height: count data

find_any: {[sp; direction]
    $[`u;[find_up sp];
        `r;[find_right sp];
        `d;[find_down sp];
        `l;[find_left sp];
        [`error]];

    };

find_up: {[sp]
    // get all obstacles in the same column:
    all_cols: all_obs[where (last each all_obs)=last sp];
    
    // get all obstacles above current sp (where rows less than sp row)
    all_rows: all_cols[where (first each all_cols)<first sp];
    
    // the first obstacle encountered will be the one with the highest row
    next_obs: last asc all_rows;

    //if no next obstacle set the next sp as the edge of map
    //and set finished to true
    //else set next sp as point before the obstacle
    $[0=count next_obs; [new_sp: (0;last sp); finished:: 1b];[new_sp: (next_obs[0]+1;last sp)]];

    // all visited indexes (excluding starting point)
    a:(first[new_sp]) + til (first[sp]-first[new_sp]);
    visited: a,\: last sp;

    // add to spaces occupied
    spaces_occupied:: spaces_occupied, visited;
    :new_sp;
    };

find_down: {[sp]
    // get all obstacles in the same column:
    all_cols: all_obs[where (last each all_obs)=last sp];
    
    // get all obstacles below current sp (where rows less than sp row)
    all_rows: all_cols[where (first each all_cols)>first sp];
    
    // the first obstacle encountered will be the one with the lowest row
    next_obs: first asc all_rows;

    //if no next obstacle set the next sp as the edge of map
    //and set finished to true
    //else set next sp as point before the obstacle
    $[0=count next_obs; [new_sp: (height - 1 ;last sp); finished:: 1b];[new_sp: (next_obs[0]-1;last sp)]];

    // all visited indexes (excluding starting point)
    a:(first[sp]+1) + til (first[new_sp]-first[sp]);
    visited: a,\: last sp;

    // add to spaces occupied
    spaces_occupied:: spaces_occupied, visited;
    :new_sp;
    };


find_right: {[sp]
    // get all obstacles in the same row:
    all_rows: all_obs[where (first each all_obs)=first sp];
    
    // get all obstacles right of current sp (where col greater than sp col)
    all_cols: all_rows[where (last each all_rows)>last sp];
    
    // the first obstacle encountered will be the one with the lowest col
    next_obs: first asc all_cols;


    $[0=count next_obs; [new_sp: (first sp ;width-1); finished:: 1b];[new_sp: (first sp;next_obs[1]-1)]];

    // all visited indexes (excluding starting point)
    b:(last[sp] + 1) + til (last[new_sp]-last[sp]);
    visited: first[sp],/:b;

    // add to spaces occupied
    spaces_occupied:: spaces_occupied, visited;
    :new_sp;
    };

find_left: {[sp]
    // get all obstacles in the same row:
    all_rows: all_obs[where (first each all_obs)=first sp];
    
    // get all obstacles left of current sp (where col less than sp col)
    all_cols: all_rows[where (last each all_rows)<last sp];
    
    // the first obstacle encountered will be the one with the highest col
    next_obs: last asc all_cols;

    $[0=count next_obs; [new_sp: (first sp ;0); finished:: 1b];[new_sp: (first sp;next_obs[1]+1)]];

    // all visited indexes (excluding starting point)
    // CHECK THIS
    b:(last[new_sp]) + til (last[sp]-last[new_sp]);
    visited: first[sp],/:b;

    // add to spaces occupied
    spaces_occupied:: spaces_occupied, visited;
    :new_sp;
    };

run: {
    ct: 0;
    stp: sp0;
    while[not finished;
        direction_dict:(0;1;2;3)!(`u`r`d`l);
        direction = direction_dict[ct mod 4];
        stp: find_any[stp];
        ct: ct+1
        ]:
    show spaces_occupied;
    
    //sp2: find_up sp1;
    //sp3: find_right sp2;
    //sp4: find_down sp3;
    };

run[]



//while[finished;next_step...] 