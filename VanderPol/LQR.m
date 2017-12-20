function y  = LQR(u)
Q1 = 10;
R = 1;
a = 0.9;
g = 0.1;

A = [-g            1             0      0 ;
     -1     a*(1-(u(1)^2))-g     0      0 ;
      0            0            -g      1 ;
      0            0            -1     -g];

B = [0;
     1;
     0;
     0];  

q = [1,0,-1,0]';
Q = q * Q1 * q';

[K,~,~] = lqr(A,B,Q,R,0);
y = -K*u(1:4);