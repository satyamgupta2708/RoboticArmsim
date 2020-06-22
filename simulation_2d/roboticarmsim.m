axis([-6,15,-6,15])
grid on;
A=[-5,15];
B=[0,0];
line(A,B);

x=[0];
y=[0];
z=[0];
ormati=[x;
        y;
        z;
        1]; %origin matrix
 t1=0;
 t2=0;
 t3=0;
 t4=0;
 
 theta1=input('enter value of first angle in degrees');
 theta2=input('enter value of second angle in degrees');
 theta3=input('enter value of third angle in degrees');
 
 
 a=[0,8];
 b=[0,0];
 l1=line(a,b,'linewidth',2);
 l2=line(a,b,'linewidth',2);
 l3=line(a,b,'linewidth',2);
 l4=line(a,b,'linewidth',2);
 
 k1=pi*theta1/180;
 k2=pi*theta2/180;
 k3=pi*theta3/180;

 
 
 
    
    for i=1:150
    A=[-5,15];
    B=[0,0];
    line(A,B);
        
        
    
    delete(l2);
    delete(l3);
    delete(l4);
         
   
    mat2=transformation(t2,4)*ormati;
    x2=[ormati(1,1),mat2(1,1)];
    y2=[ormati(2,1),mat2(2,1)];
    s = scatter(mat2(1,1),mat2(2,1));
    l2=line(x2,y2,'linewidth',2);
    t2=t2+k1/150;
    
    mat3=transformation(t3,4)*mat2;
    x3=[mat2(1,1),mat3(1,1)];
    y3=[mat2(2,1),mat3(2,1)];
    s = scatter(mat3(1,1),mat3(2,1));
    l3=line(x3,y3,'linewidth',2);
    t3=t3+k2/150;
    
    mat4=transformation(t3,4)*mat3;
    x4=[mat3(1,1),mat4(1,1)];
    y4=[mat3(2,1),mat4(2,1)];
    s = scatter(mat4(1,1),mat4(2,1));
    l4=line(x4,y4,'linewidth',2);
    t4=t4+k3/150;
    
    hold on;
    grid on;
    pause(0.01);
    axis([-6,15,-6,15])

   
    end
    


    