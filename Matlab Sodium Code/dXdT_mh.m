function [f] = dXdT_mh(~,x,v)
% FUNCTION dXdT_MH
%  Inputs: t - time (milliseconds)
%          x - vector of state variables {m,h}
%          V - applied voltage (mV)
%
%  Outputs: f - vector of time derivatives
%              {dm/dt,dh/dt}

% state variables
m = x(1);
h = x(2);

% alphas and betas:
a_m = 0.1*(25-v)/(exp((25-v)/10)-1);
b_m = 4*exp(-v/18);
a_h = 0.07*exp(-v/20);
b_h = 1 ./ (exp((30-v)/10) + 1);

% Computing derivatives:
f(1,:) = a_m*(1-m) - b_m*m;
f(2,:) = a_h*(1-h) - b_h*h;
