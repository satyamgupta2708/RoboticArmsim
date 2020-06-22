function [a,b,c]= plotaxis(A,m1)
 m=m1(1:3,1);
 A=A+m;
 a=[A(1,1),m(1,1)];
 b=[A(2,1),m(2,1)];
 c=[A(3,1),m(3,1)];
 end