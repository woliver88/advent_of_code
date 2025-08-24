\l aoc/w3p1.q

dos: data ss "do()"
donts: data ss "don't()"
t: asc dos, donts
split_data: (0,t) _ data

func: {$[not (0 7 sublist x) ~ "don't()"; extract_values_sum x ;0]}
// sum func each split_data
// 90044227