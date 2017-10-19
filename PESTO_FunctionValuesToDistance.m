clear all; clc;
% In this example, we use a proximal gradient method for
% solving the composite convex minimization problem
%   min_x F(x)=f_1(x)+f_2(x); 
%   for notational convenience we denote xs=argmin_x F(x);
% where f_1(x) is L-smooth and mu-strongly convex and where f_2(x) is
% convex.
%
% We show how to compute the worst-case value of ||xN-xs||^2 when xN is
% obtained by doing N steps of the method starting with an initial
% iterate satisfying F(x_0)-F(x_*)<=1.

% (0) Initialize an empty PEP
P=pep();

% (1) Set up the objective function
paramf1.mu=0.1;	% Strong convexity parameter
paramf1.L=1;      % Smoothness parameter
f1=P.DeclareFunction('SmoothStronglyConvex',paramf1);
f2=P.DeclareFunction('Convex');
F=f1+f2; % F is the objective function

% (2) Set up the starting point and initial condition
x0=P.StartingPoint();		 % x0 is some starting point
[xs,fs]=F.OptimalPoint(); 	 % xs is an optimal point, and fs=F(xs)
F0=F.value(x0);
P.InitialCondition(F0-fs<=1); % Add an initial condition ||x0-xs||^2<= 1

% (3) Algorithm
gam=.2/(paramf1.L+paramf1.mu);		% step size
N=12;		% number of iterations

x=x0;
for i=1:N
    xint=gradient_step(x,f1,gam);
    x=proximal_step(xint,f2,gam);
    s=(xint-x)/gam;
end
xN=x;

% (4) Set up the performance measure
% obj=(f1.gradient(xN)+s)^2;
P.PerformanceMetric((xN-xs)^2);

% (5) Solve the PEP
P.solve(1)

% (6) Evaluate the output

% Result should be 
kappa=paramf1.mu/paramf1.L;
rho=max((1-gam*paramf1.L)^2,(1-gam*paramf1.mu)^2);
[double((xN-xs)^2) 2/paramf1.mu*rho^(N)*double(F0-fs)]



