%% Setup the object map, 3 ways are provided:
%  1. use the the function from IRIS to generate the map randomly;
%  2. load an saved sample from folder obstacle_set;
%  3. input the obstacles in coordinates manually.

%% boundary, dimension and seeding point(start)
lb = [0;0];             
ub = [10;10];

dim = 2;
start = [3;3];
goal = [9;9];

%% Way 1: IRIS function
% obstacles randomly generated
% n_obs = 5;
% obstacle_pts = iris.test.random_obstacles(dim, n_obs, lb, ub, 5);

%% Way 2: saved sample 
load('\\irs-srv-daten.irs.kit.edu\Studierende$\Abschlussarbeiten\Pengyu_Du\04_Matlab_Simulink\Grundstruktur\test\obstacle_set\3Obs_3\obstacle_pts.mat');
     

%% Way 3: manual
%  under construction

%% 

A_bounds = [-1,0;0,-1;1,0;0,1];
b_bounds = [-lb; ub];