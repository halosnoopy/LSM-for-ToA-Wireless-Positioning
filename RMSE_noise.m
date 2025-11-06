%% Least Square Method for Solving ToA-based Trilateration in Wireless Positioning
%% RMSE change with Standard Deviation
iter=g_iter();
r_sd=g_rsd();
rsd=r_sd(1):10:r_sd(2);

for i=1:length(rsd)
    errorT_LS=0;
    for j=1:iter
        sd=rsd(i);
        [BSs,vp,estimated_len]=simulation(sd);
        error_LS=LS(BSs,vp,estimated_len);
        errorT_LS=errorT_LS+error_LS;
    end
    RMSE_LS(i)=(errorT_LS/iter)^(1/2);
end
% plot difference between
plot(rsd,RMSE_LS) ;
xlabel('standard Deviation of noise£¨unit:cm£© '); 
ylabel('RMSE'); 
title('RMSE change with noise')


% simulation
function [BSs,vp,estimated_len]=simulation(sd)
% BSs
BS1=[0,0,0];
BS2=[0,1000,0]; 
BS3=[1000,0,0];
BS4=[0,0,1000];
BSs =[BS1;BS2;BS3;BS4];
% randomly simulating the visual points
for i=1:3
   vp(1,i) = rand(1)*1000;
end
% distance from vp to bs
for i=1:length(BSs)
 estimated_len(1,i) =sqrt((vp(1,1)-BSs(i,1))^2+(vp(1,2)-BSs(i,2))^2+(vp(1,3)-BSs(i,3))^2)+randn(1)*sd;  % set the Gaussion noise randn(1)*1;  
end
end

% least squares method
function error_LS=LS(BSs,vp,estimated_len)
noBS = length(BSs);                                % BSs=[] 4*3 matrix
for i=1:noBS
    dxyz(i)=BSs(i,1)^2+BSs(i,2)^2+BSs(i,3)^2;    % dxyz=[] 4*3 matrix
end
% A,b matrix       
for i=1:noBS-1
    A(i,:)=[2*(BSs(noBS,1)-BSs(i,1)),2*(BSs(noBS,2)-BSs(i,2)),2*(BSs(noBS,3)-BSs(i,3))];
    b(i,:)=[estimated_len(i)^2-estimated_len(noBS)^2+dxyz(noBS)-dxyz(i)];    
end
x = inv(A'*A)*A'*b;
result_LS = x'; 
error_LS=norm(vp-result_LS);
end


% get iter
function iter=g_iter()
disp('Enter the Iteration! (iter>=0) !');
iter=input('Iteration:');
if iter<=0
    iter=g_iter();
end
end

%get range of Standard Deviation
function r_sd=g_rsd()
disp('Enter the range of Standard Deviation!(for example [1 10])');
r_sd=input('range of Standard Deviation:');
a=size(r_sd);
if a==[1 2]
    return;
else
    r_sd=g_rsd();
end
end

