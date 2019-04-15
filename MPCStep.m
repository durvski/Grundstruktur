function [solutions, diagnostics] = MPCStep( initSignal, A, B, G, zNormed, zrefNormed, MPCdata, MPCconstraints, P)
%MPCStep performs one step of the MPC algorithm
%
%% Define stationary variable for the optimizer object
persistent Controller;


%% General defination of input for controller
input = {zNormed, zrefNormed, A, B, G};

if initSignal == 1.0
    %%The very first time define the problem and create a optimizer
    %%object (initialization)

    %% define the controller
    %pre setting
    yalmip('clear');

    %Define optimization variables as cell arrays (important for the optimizer
    %object)
    u = sdpvar(repmat(MPCdata.nu,1,MPCdata.N), repmat(1,1,MPCdata.N));
    z = sdpvar(repmat(MPCdata.nz,1,MPCdata.N+1), repmat(1,1,MPCdata.N+1));
    zref = sdpvar(MPCdata.nz,1);

    %Define the matrices of system dynamics
    A = sdpvar(3,3,'full');
    B = sdpvar(3,2);
    G = sdpvar(3,1);

    %Initialize Constraints and objective function
    constrains = [];
    objective = 0;

    %Fill constraints and objective
    for j = 1:1:MPCdata.N
        %objective function
         objective = objective + (z{j} - zref)'*MPCdata.Q*(z{j} - zref) + u{j}'*MPCdata.R*u{j};
        %discrete state space model
        constrains = [constrains, z{j+1} == A*z{j} + B*u{j} + G];
        %box constrains for u and z
        constrains = [constrains, MPCconstraints.umin <= u{j} <= MPCconstraints.umax, MPCconstraints.zmin <= z{j} <= MPCconstraints.zmax];
        %constrains from IRIS
        for k = 1:1:size(P,1)
            constrains = [constrains,P(k,1)*z{j}(1,:) + P(k,2)*z{j}(2,:) - P(k,3) <= 0];
        end
    end

    parameters_in = {z{1}, zref, A, B, G};
    solutions_out = {[u{:}], [z{:}]};
    
    % solver settting    
    ops = sdpsettings('solver', 'mosek','verbose',0);
    %Define the optimizer object
    Controller = optimizer(constrains,objective,ops,parameters_in,solutions_out);
end

    %% Solve the problem
    [solutions, diagnostics] = Controller{input};

end