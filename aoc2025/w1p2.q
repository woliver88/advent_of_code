data: read0 `:w1data.txt

diffs: parse each ssr[;"L";"-"] each ssr[;"R";""] each data
mod_vals: mod[50, 50 +\ diffs;100]

func: {[x;y]
    $[y <0;rng:  x - til abs y; rng: x + til y];
    ret: count where 0 = mod[rng;100];
    ret
    }

sum func'[-1_mod_vals;diffs]
//6700