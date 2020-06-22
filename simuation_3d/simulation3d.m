
X=[1;0;0];  % unit vector for x-axis
Y=[0;1;0];  % unit vector for y-axis
Z=[0;0;1];  % unit vector for z-axis


l1=4;
l2=4;
l3=4;


T0=[l3;0;0;1];                    %(position of end effector with respect to last revolute joint)
T =[0;0;0;1] ;                    %(matirx used to define the position of link with respect to itself)
m0=[0;0;0;1] ;                    %(position of origin)
T1=transformation3d(0,0,0,l1);    % transformation from 1 to 0
T2=transformation3d(pi/2,0,0,0);  % transformation from 2 to 1
T_2=T1*T2;                        % transformation from 2 to 0
T3=transformation3d(0,l2,0,0);    % transformation from 3 to 2
T_3=T1*T2*T3;                     % transformation from 3 to 0

% idea is to find out orientation of all the other frames w.r.t base (0th)frame
R1 = rotation(0,0);          % rotation from 1st frame to 0th frame ,seeing the first frame  in 0th frame 
R2 = rotation(pi/2,0);       % rotation from 2nd frame to 1st frame ,seeing the second frame in first frame 
R3 = rotation(0,0);          % rotation from 3rd to 2nd frame, seeing the second frame in first frame



%finding out coordinates of  next links
  m1 = T1*m0 ;
  [x,y,z]=plot3d(m0,m1);
  p1=plot3(x,y,z,'black','LineWidth',2);
  hold on;
  axis([-5,10,-5,10,0,12]);

  m2 = T1*T2*T ;
  [x,y,z]=plot3d(m1,m2);
  p2=plot3(x,y,z,'black','LineWidth',2);
  hold on;
  axis([-5,10,-5,10,0,12]);
  
  m3 = T1*T2*T3*T ;
  [x,y,z]=plot3d(m2,m3);
  p3=plot3(x,y,z,'black','LineWidth',2);
  hold on;
  
  m4 = T1*T2*T3*T0 ;
  [x,y,z]=plot3d(m3,m4);
  p4=plot3(x,y,z,'black','LineWidth',2);
  s1=scatter3(x(1,2),y(1,2),z(1,2),'red','filled'); % marker for tracking down the path for end effector
  txt=['X-AXIS :',num2str(x(1,2))];                 % function for writing down text in plot
  txt1= text(1,9,12,txt);                           
  txt=['Y-AXIS :',num2str(y(1,2))];
  txt2= text(1,9,11,txt);
  txt=['Z-AXIS :',num2str(z(1,2))];
  txt3= text(1,9,10,txt);
  
  axis([-5,10,-5,10,0,14]);
  xlabel('X-axis');
  ylabel('Y-axis');
  zlabel('Z-axis');
  title('simulation of 3 DOF robotic arm');
  grid on;
  hold on ;

  
  
  
 % plotting axes on each link 
  X1= R1*X;        %rotation of x axis of base frame with respect to first link;
  Y1= R1*Y;        %rotation of y axis of base frame with respect to first link;
  Z1= R1*Z;        %rotation of z axis of base frame with respect to first link;
  X2= R1*R2*X;    %rotation of x axis of base frame with respect to first link;
  Y2= R1*R2*Y;    %rotation of y axis of base frame with respect to first link;
  Z2= R1*R2*Z;    %rotation of z axis of base frame with respect to first link;
  X3= R1*R2*R3*X;       %rotation of x axis of base frame with respect to first link;
  Y3= R1*R2*R3*Y;       %rotation of y axis of base frame with respect to first link;
  Z3= R1*R2*R3*Z;       %rotation of z axis of base frame with respect to first link;
  
  
  [x,y,z]= plotaxis(X1,m0);
  d10=plot3(x,y,z,'red','LineWidth',2);
  [x,y,z]= plotaxis(Y1,m0);
  d11=plot3(x,y,z,'blue','LineWidth',2);
  [x,y,z]= plotaxis(Z1,m0);
  d12=plot3(x,y,z,'green','LineWidth',2);

  [x,y,z]= plotaxis(X1,m1);
  d1=plot3(x,y,z,'red','LineWidth',2);
  [x,y,z]= plotaxis(Y1,m1);
  d2=plot3(x,y,z,'blue','LineWidth',2);
  [x,y,z]= plotaxis(Z1,m1);
  d3=plot3(x,y,z,'green','LineWidth',2);
  
  [x,y,z]= plotaxis(X2,m2);
  d4=plot3(x,y,z,'red','LineWidth',2);  % x axis
  [x,y,z]= plotaxis(Y2,m2);
  d5=plot3(x,y,z,'blue','LineWidth',2);  % y axis 
  [x,y,z]= plotaxis(Z2,m2);
  d6=plot3(x,y,z,'green','LineWidth',2);  % z axis

  [x,y,z]= plotaxis(X3,m3);
  d7=plot3(x,y,z,'red','LineWidth',2);
  [x,y,z]= plotaxis(Y3,m3);
  d8=plot3(x,y,z,'blue','LineWidth',2);
  [x,y,z]= plotaxis(Z3,m3);
  d9=plot3(x,y,z,'green','LineWidth',2);
  hold on;
  
  pause(0.1)


theta1=0;
theta2=0;
theta3=0;


 t1=input('enter value of first angle in degrees =');
 t2=input('enter value of second angle in degrees =');
 t3=input('enter value of third angle in degrees =');
 


k1=pi*t1/180;
k2=pi*t2/180;
k3=pi*t3/180;


 for i=1:150
     
     delete(p1);
     delete(p2);
     delete(p3);
     delete(p4);
     delete(d1);
     delete(d2);
     delete(d3);
     delete(d4);
     delete(d5);
     delete(d6);
     delete(d7);
     delete(d8);
     delete(d9);
%      delete(d10);
%      delete(d11);
     delete(d12);
     delete(txt1);
     delete(txt2);
     delete(txt3);
     
     
     T1=transformation3d(0,0,theta1,l1);   % transformation from 1 to 0
     T2=transformation3d(pi/2,0,theta2,0); % transformation from 2 to 1
     T_2=T1*T2;                            % transformation from 2 to 0
     T3=transformation3d(0,l2,theta3,0);   % transformation from 3 to 2
     T_3=T1*T2*T3;                         % transformation from 3 to 0
     R1 = rotation(0,theta1);              % rotation from 1 to 0 ,seeing the first frame  in 0th frame 
     R2 = rotation(pi/2,theta2);           % rotation from 2 to 1, seeing the second frame in first frame 
     R3 = rotation(0,theta3);              % rotation from 3 to 2, seeing the second frame in first frame

    
     m1 = T1*m0;
     [x,y,z]=plot3d(m0,m1);
     p1=plot3(x,y,z,'black','LineWidth',2);
     hold on;
     
     m2 = T1*T2*T;
     [x,y,z]=plot3d(m1,m2);
     p2=plot3(x,y,z,'black','LineWidth',2);
    
     
     m3 = T1*T2*T3*T;
     [x,y,z]=plot3d(m2,m3);
     p3=plot3(x,y,z,'black','LineWidth',2);
     hold on;
     
     m4 = T1*T2*T3*T0;
     [x,y,z]=plot3d(m3,m4);
     p4=plot3(x,y,z,'black','LineWidth',2);
     s1=scatter3(x(1,2),y(1,2),z(1,2),'red','filled');
     txt=['X-AXIS :',num2str(x(1,2))];
     txt1= text(1,9,12,txt);
     txt=['Y-AXIS :',num2str(y(1,2))];
     txt2= text(1,9,11,txt);
     txt=['Z-AXIS :',num2str(z(1,2))];
     txt3= text(1,9,10,txt);
     
    
     % plotting axes
     X1= R1*X;        %rotation of x axis of base frame with respect to first link;
     Y1= R1*Y;        %rotation of y axis of base frame with respect to first link;
     Z1= R1*Z;        %rotation of z axis of base frame with respect to first link;
     X2= R1*R2*X;     %rotation of x axis of base frame with respect to first link;
     Y2= R1*R2*Y;     %rotation of y axis of base frame with respect to first link;
     Z2= R1*R2*Z;     %rotation of z axis of base frame with respect to first link;
     X3= R1*R2*R3*X;  %rotation of x axis of base frame with respect to first link;
     Y3= R1*R2*R3*Y;  %rotation of y axis of base frame with respect to first link;
     Z3= R1*R2*R3*Z;  %rotation of z axis of base frame with respect to first link;
  
    [x,y,z]= plotaxis(X1,m1);
    d1=plot3(x,y,z,'red','LineWidth',2); 
    [x,y,z]= plotaxis(Y1,m1);
    d2=plot3(x,y,z,'blue','LineWidth',2);
    [x,y,z]= plotaxis(Z1,m1);
    d3=plot3(x,y,z,'green','LineWidth',2);
    hold on ;
     
     [x,y,z]= plotaxis(X2,m2);
     d4=plot3(x,y,z,'red','LineWidth',2);
     [x,y,z]= plotaxis(Y2,m2);
     d5=plot3(x,y,z,'blue','LineWidth',2);
     [x,y,z]= plotaxis(Z2,m2);
     d6=plot3(x,y,z,'green','LineWidth',2);
     hold on ;
     
     [x,y,z]= plotaxis(X3,m3);
     d7=plot3(x,y,z,'red','LineWidth',2);
     [x,y,z]= plotaxis(Y3,m3);
      d8=plot3(x,y,z,'blue','LineWidth',2);
     [x,y,z]= plotaxis(Z3,m3);
     d9=plot3(x,y,z,'green','LineWidth',2);
     hold on ;
     
%      [x,y,z]= plotaxis(X1,m0);
%      d10=plot3(x,y,z,'red','LineWidth',2);
%      [x,y,z]= plotaxis(Y1,m0);
%      d11=plot3(x,y,z,'blue','LineWidth',2); 
     [x,y,z]= plotaxis(Z1,m0); 
      d12=plot3(x,y,z,'green','LineWidth',2);
      hold on ;
      
     
%    increment in the angles
     theta1=theta1+k1/150;
     theta2=theta2+k2/150; 
     theta3=theta3+k3/150;

     pause(0.01);
     
%      grid on ;
%      hold on ;
%      
%      axis([-5,10,-5,10,0,14]);
%      xlabel('X-axis');
%      ylabel('Y-axis');
%      zlabel('Z-axis');
%      title('simulation of 3 DOF robotic arm');
 end
 
   








