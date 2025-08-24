\l aoc/w2p1.q

data: "I"$ " "vs/:read0 `:aoc/w2data.txt

safe_with_omission: {[x]
    l: count x;
    any safe each x til[l] except/: til l
    };

main: {
    $[(safe x) or (safe_with_omission x);
    1b;0b]
    };

// sum main each data
// 577