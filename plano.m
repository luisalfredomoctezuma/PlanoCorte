clear all,clc

A=[-1 3;7 1]; c=[7 10]; b=[6;35];

Mat=simplex('max',c,A,b); [R C]=size(Mat);

for i=1:R-1
    for j=1:C
        Matriz(i+1,j)=Mat(i,j);
    end
end
Matriz(1,:)=Mat(R,:);
Matriz

Mat=FMatriz(Matriz);


