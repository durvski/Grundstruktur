function animate_trajectory(zTrajectory,goal)
import iris.thirdParty.polytopes.*;
import iris.drawing.*;

plot(goal(1,1),goal(2,1),'dk','LineWidth',1,'MarkerFaceColor', 'r', 'MarkerSize', 8);
numStep =  size(zTrajectory,2);
j =  1;
while j<= numStep
    plot(zTrajectory(1,j), zTrajectory(2,j), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8);
    j = j+1; 
end