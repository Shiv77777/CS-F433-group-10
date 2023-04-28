function [f] = dXdT_n(~,n,v)
% FUNCTION dXdT_N
%  Inputs: t - time (milliseconds)
%          x - vector of state variables {n}
%          V - applied voltage (mV)
%
%  Outputs: f - vector of time derivatives
%              {dn/dt}

% alphas and betas:
a_n = 0.01*(10-v)./(exp((10-v)/10)-1);
b_n = 0.125*exp(-v/80);

% Computing derivatives:
f(1,:) = a_n*(1-n) - b_n*n;

