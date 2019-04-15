function [A,B,G]= generateDiscreteNormedDynamics(uNormed,zNormed,Normparameters,deltat)
% setup the discrete dynamics of the system using the normed state variable 
% and control input

%% Normed continous system dynamics
A_Normed = [ 0, 0, -Normparameters.tN*Normparameters.thetaN*uNormed(1)*...
                    sin(zNormed(3))/Normparameters.xN;
             0, 0, Normparameters.tN*Normparameters.thetaN*uNormed(1)*...
                    cos(zNormed(3))/Normparameters.yN;
             0, 0, 0
            ];
B_Normed = [ Normparameters.tN*Normparameters.vN*cos(zNormed(3))/Normparameters.xN 0;
             Normparameters.tN*Normparameters.vN*sin(zNormed(3))/Normparameters.yN 0;
             0 Normparameters.tN*Normparameters.wN/Normparameters.thetaN
            ];
G_Normed = [ Normparameters.tN*uNormed(1)*sin(zNormed(3))*zNormed(3)/Normparameters.xN;
             -Normparameters.tN*uNormed(1)*cos(zNormed(3))*zNormed(3)/Normparameters.xN;
             0
            ];

%% Normed discrete system dynamics
A = eye(3)+A_Normed*deltat;
B = B_Normed*deltat;
G = G_Normed*deltat;

end
        
        