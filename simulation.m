%2D WAVE EQUATION utt = c^2(uxx+uyy) 
% and boundary conditions u(0,y,t) = u(1,y,t)= u(x,0,t)= u(x,1,t) = 0 t>0
clear all
close all
clc
a = 4;
x = 0:0.01*a:a;
y = x;
w=pi/a;
[X Y] = meshgrid(x,y);
time = 10;
Nt = 500;
Dt = time/Nt
c=1;
for k = 1: Nt
	t(k)=(k-1)*Dt;
  s = 0;
  for n = 1:10
    for m = 1:10
      gama = c*pi*sqrt((n/a)^2+(m/a)^2);
      s=s+(16*(2*sin(n*pi/4)-sin(n*pi/8)-sin(3*n*pi/8)+2*sin(3*n*pi/4)-sin(5*n*pi/8)-sin(7*n*pi/8))/((n*pi)^2)*sin(n*w*X)).*...
      (16*(2*sin(m*pi/4)-sin(m*pi/8)-sin(3*m*pi/8)+2*sin(3*m*pi/4)-sin(5*m*pi/8)-sin(7*m*pi/8))/((m*pi)^2).*sin(m*w*Y).*cos(gama*t(k)));
    end
  end
	surf(X,Y,s)
	axis([0 a 0 a -0.3 1.1])
	pause(0.1)
	grid on
	xlabel('x') 
  ylabel('y')
end

