%% Least Square Method for Solving ToA-based Trilateration in Wireless Positioning
clc
clear
cla reset

%% set the location of the 4 base station £¨there is 4 corner in a 3D coordinate£¬ so I set 4 base station£©
%simulate the environment: 10m*10m*10m: 
BS1=[0,0,0];
BS2=[0,1000,0]; 
BS3=[1000,0,0];
BS4=[0,0,1000];
BSs =[BS1;BS2;BS3;BS4];
% randomly simulating the visual points
for i=1:3
   vp(1,i) = rand(1)*1000;
end


%% simulating the visual points
vp=zeros(1,3);               % generate a 1*3 matrix to storage the generated location data  
% randomly generate numbers and add to each column
for i=1:3
   vp(1,i) = rand(1)*1000;
end

%% data visualization
% show the axis
view([1000 1000 1000])
axis ([0 1000 0 1000 0 1000])
grid on;
set(gca,'zdir','reverse')
title('Simulation for a 10m*10m*10m environment (Unit:cm)');    
x1=xlabel('X axis');       
x2=ylabel('Y axis');        
x3=zlabel('Z axis');        
set(x1,'Rotation',30);    
set(x2,'Rotation',-30);
hold on

% show the position of the 4 base stations
p_r=[100,50,50;50,950,50;900,50,50;50,50,950];
for i=1:length(BSs)
    plot3(BSs(i,1),BSs(i,2),BSs(i,3),'*r','markersize',20);
    text(p_r(i,1),p_r(i,2),p_r(i,3),['BS',num2str(i)]);
end

% show the visual point in both command window and the coordinate
% show in the command window
table1 = [vp(1,1)   vp(1,2)  vp(1,3) ];
disp ('----------------------------------')
disp ('-Location of Selected Visual Point-')
disp('     x         y         z ')
disp(table1)
disp ('---------------------------')
%plot the visual point;
plot3(vp(1,1),vp(1,2),vp(1,3),'g.','markersize',15);
text(vp(1,1)+50,vp(1,2)+50,vp(1,3)+50,'user')
hold on

%% Simulate the real situation that the signal will include in noise                                        
estimated_len =zeros(1,4);    % generate a matrix to storage the distances from each visual points to the 4 base stations
% the distances from the visual point to base station A(i=1) B(i=2) C(i=3) D(i=4)
for i=1:length(BSs)
 estimated_len(1,i) =sqrt((vp(1,1)-BSs(i,1))^2+(vp(1,2)-BSs(i,2))^2+(vp(1,3)-BSs(i,3))^2)+randn(1)*1;  % set the Gaussion noise randn(1)*1;  
end

%show the distance data
table2 = [estimated_len(1,1) estimated_len(1,2) estimated_len(1,3) estimated_len(1,4) ];
disp ('-distance datas used to estimate the position-')
disp('     1         2          3         4    ')
disp(table2)
disp ('----------------------------------------------')