function newgen=mutation(oldgen,pm)
 mpoints=find(rand(size (oldgen)) <pm) ;
newgen=oldgen;
newgen(mpoints) =1-oldgen(mpoints);