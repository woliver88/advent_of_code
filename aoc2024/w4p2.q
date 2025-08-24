\l aoc/w4p1.q

/
row 6 col 4
normal padding:
row: col
col: row - col

rev padding
col: row
row: col - (139-row)
\

normal_offset: {[padded_data;word]
    a: flip[padded_data] ss\: word;
    
    // to get the "A" not the first letter
    a: a + 1;
    
    idxs: til count a;

    // join row index with each column index of incidence of "A"
    b: raze raze idxs,'/:' each[enlist;a];
    
    // flip row,col idx
    c: reverse each b;

    // differences between row and col
    d: flip enlist neg -[;]./: raze each c;

    // append
    e: flip enlist first each  c;
    f: e,'d
    };

reverse_offset: {[padded_data;word]
    a: flip[padded_data] ss\: word;
    
    // to get the "A" not the first letter
    a: a + 1;
    
    idxs: til count a;

    // join row index with each column index of incidence of "A"
    b: raze raze idxs,'/:' each[enlist;a];
    
    // flip row,col idx
    c: reverse each b;

    // row: col - (140-row) 
    d: flip enlist -139 +  +[;]./: raze each c;

    // append
    e: flip enlist first each  c;
    f: e,'d
    };

ans1: normal_offset[v;"SAM"]
ans2: normal_offset[v;"MAS"]
ans12: asc ans1,ans2

ans3: reverse_offset[w;"SAM"]
ans4: reverse_offset[w;"MAS"]
ans34: asc ans3,ans4

// sum ans12 in\: ans34
//1871