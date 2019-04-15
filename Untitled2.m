HPA =  [-1,0;0,-1;1,0;1,1];
HPb = [0;0;-2;-5];
u=[1;0];
z=[1;1;pi/4];
zref=[8;3;0];
uoutNext= RunMPC(u,z,zref,HPA, HPb)