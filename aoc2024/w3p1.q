
data: raze read0 `:aoc/w3data.txt

//t: (raze each #[;enlist "[0-9]"] each) each {raze x ,\:/: x} 1_til 4

// u: {ssr[ssr["mul(FIRST,SECOND)";"FIRST";x];"SECOND";y]} ./: t

extract_values: {[d;rgx]
    idxs: d ss rgx;
    if[(count idxs) = 0;:0];
    slc: 6+ %[-6 + count rgx;5];
    muls: {j: (x+4),(y-5); j sublist (raze z)}[;"j"$slc;d] each idxs;
    vals: (*/) each "J"$ ","vs/: muls;
    :sum vals;
    };

extract_values_sum: {[d]
    t: (raze each #[;enlist "[0-9]"] each) each {raze x ,\:/: x} 1_til 4;
    u: {ssr[ssr["mul(FIRST,SECOND)";"FIRST";x];"SECOND";y]} ./: t;
    v:u;
    :sum (extract_values[d;] each u);
    };

// extract_values_sum data
// 184511516