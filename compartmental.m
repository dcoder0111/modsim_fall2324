function [t, Y] = compartmental(beta, gamma)
% We don't change these throughout the worksheet; fix them to constants
n_population = 100;
n_infected = 1;
% NB. The following is a *fancy* way of analyzing the compartmental SIR
% model. This formulates the model as a differential equation and uses some
% sophisticated Matlab machinery to simulate the model. I do this just to
% get some illustrative results with minimal lines of code.
%
% We do *not* expect you to be able to write this code.
% Set up the right hand side (RHS) of the model
odefun = @(t, y) [
    -beta * y(2) * y(1);
    +beta * y(2) * y(1) - gamma * y(2);
    +gamma * y(2)
];
% Simulate
Y1 = [n_population - n_infected; n_infected; 0];
[t, Y] = ode45(odefun, [0, 150], Y1);
end