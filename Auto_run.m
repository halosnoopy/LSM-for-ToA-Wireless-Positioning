%% automatically run the simulation
rt=100 % to run the simulation rt times
for i=1:rt  % 100 iterations, the points will change 100 times
    Simulation   % call the Simulation file
    pause(1);
    for i=1:length(BSs)
        sg(i)=plot3([BSs(i,1),vp(1,1)],[BSs(i,2),vp(1,2)],[BSs(i,3),vp(1,3)]);
    end
    pause(1);    % delay 3 seconds to do the next step
    delete(sg)
    pause(0.5)
    LS           % call the LS file to localize the point
    pause(1);    % delay 3 seconds to do the next step
end
