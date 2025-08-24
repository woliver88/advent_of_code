data: read0 `:aoc/w4data.txt
WORD: "XMAS"

// data as is:
// horizonal
a: (sum count each data ss \:) each (reverse WORD;WORD)
// vertical (horizonal flipped)
b: (sum count each flip[data] ss \:) each (reverse WORD;WORD)

// generate padding
t: til count data
u: t#\: "O"

// pad increasing each row from left
v: (u,'data),'reverse[u]
c: (sum count each flip[v] ss \:) each (reverse WORD;WORD)

// pad decreasing each row from left
w: (reverse[u],'data),'u
d: (sum count each flip[w] ss \:) each (reverse WORD;WORD)

// sum a,b,c,d
//2414