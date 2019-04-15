%%  Script to run one-step MPC with convexifier
 clear all

%%  Loading the aiding program
import iris.inflate_region;
import iris.drawing.*;

%%  Load Object Map
Objectmap

%% run IRIS to generate constrains for MPC
[A,b,C,d,results] = inflate_region(obstacle_pts, A_bounds, b_bounds, start);
% need to modify with respect to goal point later
animate_results(results);

%% use MPC to solve the problem for one step
u = [1;0];
start = [start; 2*pi/2];
goal = [goal;0];
[uoutNext, zTrajectory] = RunMPC(u, start, goal, A, b);% later all inputs need to be merged in onedimension vector

%% Animation of the trajectory
animate_trajectory(zTrajectory,goal);
...