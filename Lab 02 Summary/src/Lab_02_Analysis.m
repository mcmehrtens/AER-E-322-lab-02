% AER E 322 Spring 2023 Lab 02 Analysis Script
% Matthew Mehrtens, Peter Mikolitis, and Natsuki Oda
clear,clc,close all

% Define a grid
x = -12:0.01:12;
y = (-10:0.01:10)';
xgrid = ones(size(y, 1), 1) * x;
ygrid = y * ones(1, size(x, 2));

% Calculate r and theta at each point on the grid
r = sqrt(xgrid.^2 + ygrid.^2);
theta = atan2(ygrid, xgrid);

% Assign arbitrary values to a and sigma_0
a       = 3; % [m]
sigma_0 = 1; % [Pa]

% Calculate the stresses
sigma_r = sigma_0 / 2 .* ((1 - a.^2 ./ r.^2) - ...
    (1 - 4 .* a.^2 ./ r.^2 + 3 .* a.^4 ./ r.^ 4) ...
    .* cos(2 .* theta)); % [Pa]

sigma_theta = sigma_0 / 2 .* ((1 + a.^2 ./ r.^2) + ...
    (1 + 3 .* a.^4 ./ r.^4) .* cos(2 .* theta)); % [Pa]

tau_rtheta = sigma_0 / 2 .* ...
    (1 + 2 .* a.^2 ./ r.^2 - 3 .* a.^4 ./ r.^4) .* sin(2 .* theta); % [Pa]

% Mask out the hole
sigma_r(r < a) = 0;
sigma_theta(r < a) = 0;
tau_rtheta(r < a) = 0;

% Calculate sigma_p1 - sigma_p2
diff = 2 .* sqrt(((sigma_r - sigma_theta) ./ 2).^2 + tau_rtheta.^2);

% Plot the stress distributions
f1 = figure('Name', 'sigma_r');
imagesc(sigma_r);
colorbar;
f2 = figure('Name', 'sigma_theta');
imagesc(sigma_theta);
colorbar;
f3 = figure('Name', 'tau_rtheta');
imagesc(tau_rtheta);
colorbar;
f4 = figure('Name', 'sigma_p1 - sigma_p2');
imagesc(diff);
colormap([jet; jet; jet]);