function[transform]= transformation3d(alpha,a,theta,d)
transform=[cos(theta)           ,   -1*sin(theta)       ,         0 ,    a     ;
           sin(theta)*cos(alpha),cos(theta)*cos(alpha),-1*sin(alpha),-1*sin(alpha)*d;
           sin(theta)*sin(alpha),cos(theta)*sin(alpha),cos(alpha) ,cos(alpha)*d;
                  0              ,                    0,          0,           1];
end