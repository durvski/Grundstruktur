function [uoutNext,zoutPhys] = RunMPC(u,z,zref,HPA, HPb)
%% Function to run MPC
iter = 1;

%% Extraction of the input

%% Merge constrains from IRIS into one matrix 
numHP = size(HPA, 1);
P = NaN(numHP,3);
for i = 1:1:numHP
    P(i,:) = [HPA(i,1), HPA(i,2), HPb(i)];
end

%% Load MPC settings
MPCparameter

%% Normalization
uNormed = normu(u, normParameters);
zNormed = normz(z, normParameters);
zrefNormed = normz(zref, normParameters);

%% Dynamics of the diskret system
[A, B, G] = generateDiscreteNormedDynamics(uNormed, zNormed, normParameters, MPCdata.deltat);

%% Sovle MPC Step function
[solution, diagnostics] = MPCStep(iter, A, B, G, zNormed, zrefNormed, MPCdata, MPCconstraints, P);

if diagnostics == 1
    error('The problem is infeasible');
end

%% Data casting cell to array
uoutNormed = solution{1};
zoutNormed = solution{2};

%% Transform state variable and control input back to physical value
uoutPhys = RetransformNormedu(uoutNormed, normParameters);
zoutPhys = RetransformNormedz(zoutNormed, normParameters);

%% Get the to excute control input
uoutNext = uoutPhys(:,1);
zoutNext = zoutPhys(:,1);

% onedimOutputVector = [uoutNext(1,1), uoutNext(2,1), zoutNext(1,1), zoutNext(2,1), zoutNext(3,1)];

end