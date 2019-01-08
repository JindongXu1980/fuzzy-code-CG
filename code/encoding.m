function[bin2gen,bits]=encoding(min2var,max2var,scale2var,popsize)
bits=ceil (log2 ((max2var2min2var) ./scale2var)) ;
bin2gen=randint (popsize,sum(bits)) ;