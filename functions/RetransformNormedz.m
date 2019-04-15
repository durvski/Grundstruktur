function zPhys = RetransformNormedz(zNormed, normParameters)
% the function retransforms the normed state variables back to physical value

zPhys(1,:) = zNormed(1,:)*normParameters.xN;
zPhys(2,:) = zNormed(2,:)*normParameters.yN;
zPhys(3,:) = zNormed(3,:)*normParameters.thetaN;

end