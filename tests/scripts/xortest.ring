B=list(4)

B[1]="2345"

B[2]="1111"

B[3]=B[1]^B[2]


? "B1= " +B[1] +" B2= " +B[2]


?"" ? "B3=B[1]^B[2] : " +B[3]


?"" ? "B[3]=B[1][k]^'1' :"

for kk=1 to 4 { ? " "+ASCII(B[1][kk]) ^ ASCII('1') }


?"" ? "B[3]=B[1][k]^B[2][k] :"

for kk=1 to 4 { ? " "+ASCII(B[1][kk]) ^ ASCII(B[2][kk]) }


? "===="
