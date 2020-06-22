function [T] = transformation(t,l1)
T = [cos(t) ,-sin(t),0 ,l1*cos(t);
     sin(t) ,cos(t) ,0  ,l1*sin(t);
     0      ,  0    ,1  ,0;
     0      ,  0    ,0  ,1];
end
