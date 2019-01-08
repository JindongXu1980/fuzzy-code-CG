function [evogen,best2 indiv,maxfitness] = selection(oldgen,fitness)
popsize=length(fitness) ;
[maxfitness,index1]=max (fitness) ;
[minfitness,index2]=min(fitness) ;
bestindiv=oldgen(index1,:) ;
 index=[1:popsize];index(index1) =0;index(index2) =0;
 index=nonzeros(index) ;
evogen=oldgen(index,:) ;
 evofitness=fitness(index,:) ;
 evo2popsize=popsize22;
 ps=evofitness/sum(evofitness) ;
 pscum=cumsum(ps) ;
r=rand(1,evo2popsize) ;
selected=sum(pscum*ones(1,evo2popsize) <ones(evo2pop2size,1)*r) +1;
evogen=evogen(selected,:) ;