function newgen=crossover(oldgen,pc)
[nouse,mating]=sort (rand(size (oldgen,1) ,1)) ;
matgen=oldgen(mating,:) ;
pairs=size (matgen,1) /2;
bits=size (matgen,2) ;
cpairs=rand(pairs,1) <pc;
cpoints=randint (pairs,1,[1,bits]) ;
cpoints=cpairs.*cpoints;
 for i=1:pairs
newgen( [2*i-1 2*i],:) =[matgen ([2*i-1 2*ii],1:cpoints(i)), matgen( [2*i 2*i-1],cpoints (i) +1:bits)];
end