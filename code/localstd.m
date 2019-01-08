clear all;
clc;
A = imread('yushusub0716.tif');
I=A(:,:,1);
fun = @(x)std2(x)*ones(size(x));
fun2=@(x)mean2(x)*ones(size(x));
I1 = blkproc(I,[ 3 3 ],[2 2],fun);
I2 = blkproc(I,[ 3 3 ],fun2);
I3 = blkproc(I,[ 5 5 ],fun);
I4 = blkproc(A(:,:,2),[ 5 5 ],fun);
I5 = blkproc(A(:,:,3),[ 5 5 ],fun);

imtool(I), imtool(I1,[]) , imtool(I2,[]) , imtool(I3,[]), imtool(I4,[]) , imtool(I5,[])