function uNormed = normu(uPhys,normParameters)
% this function normalize input 

uNormed(1,:) = uPhys(1,:)/normParameters.vN;
uNormed(2,:) = uPhys(2,:)/normParameters.wN;

end