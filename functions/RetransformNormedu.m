function uPhys = RetransformNormedu(uNormed, normParameters)
% the function retransforms the normed input back to physical value

uPhys(1,:) = uNormed(1,:)*normParameters.vN;
uPhys(2,:) = uNormed(2,:)*normParameters.wN;

end
