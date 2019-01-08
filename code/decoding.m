function[var2gen,fitness]=decoding (funname,bin2gen,bits,minvar,max2var)
num2var=length(bits) ;
 popsize=size (bin2gen,1) ;
scale2dec= (max2var2min2var) ./ (2.^bits21) ;
bits=cumsum(bits) ;
bits=[0 bits];
for i=1:num2var
bin2var{i}=bin2gen( :,bits(i) +1:bits(i+1)) ;
var{i}=sum(ones (popsize,1) 3 2.^(size (bin2var{i},2)21:21:0) . 3 bin2var{i},2) . 3 scale2dec (i) +min2var (i) ;
 end
var2gen=[var{1,:}];
 for i=1:popsize
 fitness (i) =eval ( [funname,' (var2gen(i,:))' ]) ;
 end