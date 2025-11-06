%% Least Square Method for Solving ToA-based Trilateration in Wireless Positioning
%% Least Squares Algorithm to estimate the positions of the visual points

noBS = length(BSs);                                % BSs=[] 4*3 matrix

for i=1:noBS
    dxyz(i)=BSs(i,1)^2+BSs(i,2)^2+BSs(i,3)^2;    % dxyz=[] 4*3 matrix
end

% A,b matrix       
for i=1:noBS-1
    A(i,:)=[2*(BSs(noBS,1)-BSs(i,1)),2*(BSs(noBS,2)-BSs(i,2)),2*(BSs(noBS,3)-BSs(i,3))];
    b(i,:)=[estimated_len(i)^2-estimated_len(noBS)^2+dxyz(noBS)-dxyz(i)];                                
end

% Least Squares method to eatimate the position      % x=[] 3*1 matrix
x = inv(A'*A)*A'*b;
fin_result = x';               
%% show the result of the algorithm
% show in the command window
table3 = [fin_result(1,1)   fin_result(1,2)  fin_result(1,3)];
disp ('-Estimated position of the point-')
disp('     x         y         z    ')
disp(table3)
%plot the result
plot3(fin_result(1,1),fin_result(1,2),fin_result(1,3),'rd','markersize',15);

%error
error=norm(vp-fin_result)
