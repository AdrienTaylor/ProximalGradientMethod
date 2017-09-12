%% Distance to optimality, mode 1:

clear all; clc;
syms gam L mu;
syms x0 xs g0 g1 gs s0 s1;
syms f0 f1 fs h0 h1 hs;

x1=x0-gam*(g0+s1);
ss=-gs;

% multipliers
l0=2*gam*(1-gam*mu);
l1=l0;
l2=2*gam;
l3=l2;

% inequalities (everything is set to (...)<=0)
ineq0=f0-fs+g0*(xs-x0)+1/(2*(1-mu/L))*((g0-gs)^2/L+mu*(x0-xs)^2-2*mu/L*(x0-xs)*(g0-gs));
ineq1=fs-f0+gs*(x0-xs)+1/(2*(1-mu/L))*((g0-gs)^2/L+mu*(x0-xs)^2-2*mu/L*(x0-xs)*(g0-gs));
ineq2=h1-hs+s1*(xs-x1);
ineq3=hs-h1+ss*(x1-xs);


% (1) combine inequalities with multipliers 
expr_orig=l0*ineq0+l1*ineq1+l2*ineq2+l3*ineq3;
expr_orig=simplify(expr_orig);

% (2) form final sum
expr_final=(x1-xs)^2-(x0-xs)^2*(1-gam*mu)^2+gam^2*(gs+s1)^2+gam/(L-mu)*(2-gam*(L+mu))*(mu*x0-mu*xs-g0+gs)^2;

% (3) compare the results
expr_equals=~eval(simplify(expr_orig-expr_final));
fprintf('[Decrease in norm, mode 1] Expressions are equivalent [0/1] ? %d\n',expr_equals)
	
%% Distance to optimality, mode 2:

clear all;
syms gam L mu;
syms x0 xs g0 g1 gs s0 s1;
syms f0 f1 fs h0 h1 hs;

x1=x0-gam*(g0+s1);
ss=-gs;

% multipliers
l0=2*gam*(gam*L-1);
l1=l0;
l2=2*gam;
l3=l2;

% inequalities (everything is set to (...)<=0)
ineq0=f0-fs+g0*(xs-x0)+1/(2*(1-mu/L))*((g0-gs)^2/L+mu*(x0-xs)^2-2*mu/L*(x0-xs)*(g0-gs));
ineq1=fs-f0+gs*(x0-xs)+1/(2*(1-mu/L))*((g0-gs)^2/L+mu*(x0-xs)^2-2*mu/L*(x0-xs)*(g0-gs));
ineq2=h1-hs+s1*(xs-x1);
ineq3=hs-h1+ss*(x1-xs);

% (1) combine inequalities with multipliers 
expr_orig=l0*ineq0+l1*ineq1+l2*ineq2+l3*ineq3;
expr_orig=simplify(expr_orig);

% (2) form final sum
expr_final=(x1-xs)^2-(x0-xs)^2*(1-gam*L)^2+gam^2*(gs+s1)^2+gam/(L-mu)*(gam*(L+mu)-2)*(L*x0-L*xs-g0+gs)^2;

% (3) compare the results
expr_equals=~eval(simplify(expr_orig-expr_final));
fprintf('[Decrease in norm, mode 2] Expressions are equivalent [0/1] ? %d\n',expr_equals)

%% Gradient, mode 1:

clear all;
syms gam L mu;
syms x0 xs g0 g1 gs s0 s1;
syms f0 f1 fs h0 h1 hs;

x1=x0-gam*(g0+s1);
ss=-gs;

% multipliers
l0=2*(1-gam*mu)/gam;
l1=l0;
l2=2*(1-gam*mu)^2/gam;
l3=l2;

% inequalities (everything is set to (...)<=0)
ineq0=f1-f0+g1*(x0-x1)+1/(2*(1-mu/L))*((g0-g1)^2/L+mu*(x0-x1)^2-2*mu/L*(x0-x1)*(g0-g1));
ineq1=f0-f1+g0*(x1-x0)+1/(2*(1-mu/L))*((g0-g1)^2/L+mu*(x0-x1)^2-2*mu/L*(x0-x1)*(g0-g1));
ineq2=h1-h0+s1*(x0-x1);
ineq3=h0-h1+s0*(x1-x0);

% (1) combine inequalities with multipliers 
expr_orig=l0*ineq0+l1*ineq1+l2*ineq2+l3*ineq3;
expr_orig=simplify(expr_orig);

% (2) form final sum
expr_final=(g1+s1)^2-(g0+s0)^2*(1-gam*mu)^2+(2-gam*(L+mu))/gam/(L-mu)*(g0-g1-mu*gam*(g0+s1))^2+(1-gam*mu)^2*(s0-s1)^2;

% (3) compare the results
expr_equals=~eval(simplify(expr_orig-expr_final));
fprintf('[Decrease in gradient norm, mode 1] Expressions are equivalent [0/1] ? %d\n',expr_equals)

%% Gradient, mode 2:

clear all;
syms gam L mu;
syms x0 xs g0 g1 gs s0 s1;
syms f0 f1 fs h0 h1 hs;

x1=x0-gam*(g0+s1);
ss=-gs;

% multipliers
l0=2*(L*gam-1)/gam;
l1=l0;
l2=2*(1-gam*L)^2/gam;
l3=l2;

% inequalities (everything is set to (...)<=0)
ineq0=f1-f0+g1*(x0-x1)+1/(2*(1-mu/L))*((g0-g1)^2/L+mu*(x0-x1)^2-2*mu/L*(x0-x1)*(g0-g1));
ineq1=f0-f1+g0*(x1-x0)+1/(2*(1-mu/L))*((g0-g1)^2/L+mu*(x0-x1)^2-2*mu/L*(x0-x1)*(g0-g1));
ineq2=h1-h0+s1*(x0-x1);
ineq3=h0-h1+s0*(x1-x0);

% (1) combine inequalities with multipliers 
expr_orig=l0*ineq0+l1*ineq1+l2*ineq2+l3*ineq3;
expr_orig=simplify(expr_orig);

% (2) form final sum
expr_final=(g1+s1)^2-(g0+s0)^2*(1-gam*L)^2+(gam*(L+mu)-2)/gam/(L-mu)*(g0-g1-L*gam*(g0+s1))^2+(1-gam*L)^2*(s0-s1)^2;

% (3) compare the results
expr_equals=~eval(simplify(expr_orig-expr_final));
fprintf('[Decrease in gradient norm, mode 2] Expressions are equivalent [0/1] ? %d\n',expr_equals)

%% Function values, mode 1:

clear all;
syms gam L mu;
syms x0 xs g0 g1 gs s0 s1;
syms f0 f1 fs h0 h1 hs;

x1=x0-gam*(g0+s1);
ss=-gs;

% multipliers
l0=1-gam*mu;
l1=mu*gam*(1-gam*mu);
l2=gam*mu;
l3=(1-gam*mu)^2;
l4=mu*gam*(2-gam*mu);

% inequalities (everything is set to (...)<=0)
ineq0=f1-f0+g1*(x0-x1)+1/(2*(1-mu/L))*((g0-g1)^2/L+mu*(x0-x1)^2-2*mu/L*(x0-x1)*(g0-g1));
ineq1=f0-fs+g0*(xs-x0)+1/(2*(1-mu/L))*((g0-gs)^2/L+mu*(x0-xs)^2-2*mu/L*(x0-xs)*(g0-gs));
ineq2=f1-fs+g1*(xs-x1)+1/(2*(1-mu/L))*((g1-gs)^2/L+mu*(x1-xs)^2-2*mu/L*(x1-xs)*(g1-gs));
ineq3=h1-h0+s1*(x0-x1);
ineq4=h1-hs+s1*(xs-x1);

% (1) combine inequalities with multipliers 
expr_orig=l0*ineq0+l1*ineq1+l2*ineq2+l3*ineq3+l4*ineq4;
expr_orig=simplify(expr_orig);

% (2) form final sum
alpha=-(gam^2*L^2*mu+2*L*(-2+gam*mu)+mu*(-2+gam*mu)^2);
beta=2-gam*(L+mu);
expr_final=f1+h1-fs-hs-(f0+h0-fs-hs)*(1-gam*mu)^2 ...
    +(2-gam*mu)*beta/2/alpha*((1-gam*mu)*g0-g1+gam*mu*gs)^2 ...
    +gam*L*mu^2*(2-gam*mu)/2/(L-mu)*(x0-(2*L-2*mu+gam*mu^2)/(L*mu*(2-gam*mu))*s1-xs-(g0+g1)/mu/(2-mu*gam)+gs/L)^2 ...
    +alpha*gam/L*mu/2/(L-mu)/(2-gam*mu)*(s1+(gam*mu-1)*L*beta/alpha*g0+L*beta/alpha*g1+(L-mu)*(2-gam*mu)^2/alpha*gs)^2;

% (3) compare the results
expr_equals=~eval(simplify(expr_orig-expr_final));
fprintf('[Decrease in function values, mode 1] Expressions are equivalent [0/1] ? %d\n',expr_equals)

%% Function values, mode 2:

clear all;
syms gam L mu;
syms x0 xs g0 g1 gs s0 s1;
syms f0 f1 fs h0 h1 hs;

x1=x0-gam*(g0+s1);
ss=-gs;

% multipliers
l0=gam*L-1;
l1=(gam*L-1)*(2-gam*L);
l2=(2-gam*L);
l3=(1-gam*L)^2;
l4=gam*L*(2-gam*L);

% inequalities (everything is set to (...)<=0)
ineq0=f1-f0+g1*(x0-x1)+1/(2*(1-mu/L))*((g0-g1)^2/L+mu*(x0-x1)^2-2*mu/L*(x0-x1)*(g0-g1));
ineq1=f0-fs+g0*(xs-x0)+1/(2*(1-mu/L))*((g0-gs)^2/L+mu*(x0-xs)^2-2*mu/L*(x0-xs)*(g0-gs));
ineq2=f1-fs+g1*(xs-x1)+1/(2*(1-mu/L))*((g1-gs)^2/L+mu*(x1-xs)^2-2*mu/L*(x1-xs)*(g1-gs));
ineq3=h1-h0+s1*(x0-x1);
ineq4=h1-hs+s1*(xs-x1);

% (1) combine inequalities with multipliers 
expr_orig=l0*ineq0+l1*ineq1+l2*ineq2+l3*ineq3+l4*ineq4;
expr_orig=simplify(expr_orig);

% (2) form final sum
alpha=-2*L^2-2*mu^2+2*L*mu+gam*L^3+gam*L*mu^2;
beta=gam*(L+mu)-2;
expr_final=f1+h1-fs-hs-(f0+h0-fs-hs)*(1-gam*L)^2 ...
    +(2-gam*L)*beta/2/alpha/gam*((1-gam*L)*g0-g1+gam*L*gs)^2 ...
    +gam*L^2*mu*(2-gam*L)/2/(L-mu)*(x0-s1/mu-xs+(1-gam*L-gam*mu)/gam/L/mu*g0-g1/gam/L/mu+gs/L)^2 ...
    +alpha*gam/2/mu/(L-mu)*(s1+(-1+gam*L)*L*beta/alpha/gam*g0+L*beta/alpha/gam*g1+(2-gam*L)*(L-mu)*mu/alpha*gs)^2;

% (3) compare the results
expr_equals=~eval(simplify(expr_orig-expr_final));
fprintf('[Decrease in function values, mode 2] Expressions are equivalent [0/1] ? %d\n',expr_equals)


















