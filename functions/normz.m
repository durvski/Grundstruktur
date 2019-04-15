function zNormed = normz(zPhys,normParameters)
% this function normalize state variables

zNormed(1,:) = zPhys(1,:)/normParameters.xN;
zNormed(2,:) = zPhys(2,:)/normParameters.yN;
zNormed(3,:) = zPhys(3,:)/normParameters.thetaN;

end
