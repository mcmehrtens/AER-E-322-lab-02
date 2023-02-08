% AER E 322 Spring 2023 Lab 02 Analysis Script
% Matthew Mehrtens, Peter Mikolitis, and Natsuki Oda
clear,clc,clf

% Define a grid
x = -10:0.1:10;
y = (-12:0.1:12)';
xgrid = ones(size(y, 1), 1) * x;
ygrid = y * ones(1, size(x, 2));

% Calculate r and theta at each point on the grid
r = sqrt(xgrid.^2 + ygrid.^2);
theta = atan2(ygrid, xgrid);

% Assign arbitrary values to a and sigma_0
a       = 2; % [m]
sigma_0 = 1; % [Pa]

% Calculate the stresses
sigma_r = sigma_0 / 2 .* ((1 - a.^2 ./ r.^2) - ...
    (1 - 4 .* a.^2 ./ r.^2 + 3 .* a.^4 ./ r.^ 4) ...
    .* cos(2 .* theta)); % [Pa]

sigma_theta = sigma_0 / 2 .* ((1 + a.^2 ./ r.^2) + ...
    (1 + 3 .* a.^4 ./ r.^4) .* cos(2 .* theta)); % [Pa]

tau_rtheta = sigma_0 / 2 .* ...
    (1 + 2 .* a.^2 ./ r.^2 - 3 .* a.^4 ./ r.^4) .* sin(2 .* theta); % [Pa]