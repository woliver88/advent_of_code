data: "I"$ " "vs/:read0 `:aoc/w2data.txt

safe: {
    diffs: (x 0) -': 1_x;
    $[((abs sum diffs) = (sum abs diffs)) and all ((abs diffs) in\: (1;2;3));1b;0b]
    };

// sum safe each data
// 534