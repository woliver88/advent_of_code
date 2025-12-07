data: read0 `:w1data.txt
count where 0 = mod[;100] 50 +\ parse each ssr[;"L";"-"] each ssr[;"R";""] each data
//1071