function[rotate]= rotation(alpha,theta)

rotate=[cos(theta)   ,   -1*sin(theta) ,    0;
        sin(theta)*cos(alpha),cos(theta)*cos(alpha),-1*sin(alpha);
        sin(theta)*sin(alpha),cos(theta)*sin(alpha),cos(alpha)];

end
