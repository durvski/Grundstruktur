%% Load MPC parameters and settings

%% Timing parameters
%  Generate the general time information
stime = struct('startTime',0,'deltat',0.010,'endTime',NaN,'tref',NaN,'dynEndTime',NaN(3,1),'T',NaN);

%  Used to measure the calculation time of the trajectory MPC
rechenzeit = NaN(1,1);

%% Normalization parameters
%xN = 1 m, yN = 1 m, thetaN = 2*pi rad, vN = 3 m/s, wN = pi/2 rad/s
normParameters = struct('tN', 1, 'xN', 1, 'yN', 1, 'thetaN', 2*pi, 'vN', 3, 'wN', pi/2);

%% Normed state and input constraints
%vmin = 0 m/s; vmax = 3 m/s; wmin = - pi/2 rad/s; wmax = pi/2 rad/s
%x: [- 50m, 50m], y: [-50m, 50m], theta: [- 2*pi, 2*pi]
MPCconstraints = struct('umin', [0; -1], 'umax', [1; 1], 'zmin', [-50; -50; -1], 'zmax', [50; 50; 1]);

%% MPC data
%Q, R: Weight matrices; nz: number of states; nu: number of
%inputs; T_s: sample time; T_p: prediction horizon; N: number of predicted values
MPCdata = struct('Q', [60, 0, 0; 0, 60, 0; 0, 0, 60], 'R', [40, 0; 0, 10], 'nz', 3, 'nu', 2, 'deltat', 0.1, 'T_p', 2, 'N', NaN);
MPCdata.N = MPCdata.T_p/MPCdata.deltat;