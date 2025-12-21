data: read0 `:w2data.txt;
split_data: "," vs raze data;

repeats_n_i: {[n;i]
    mult: "J"$,[;"1"] raze("i"$-1+n%i)# enlist "1",(i-1)#"0";
    stubs: ("J"$"1",(i-1)#"0")_til ("J"$"1",(i#"0"));
    mult * stubs
    }

repeats_n: {[n]
    distinct raze repeats_n_i[n;] each where 0 = n mod til n
    }