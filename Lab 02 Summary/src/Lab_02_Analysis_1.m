% AER E 322 Spring 2023 Lab 02 Analysis Script
% Matthew Mehrtens, Peter Mikolitis, and Natsuki Oda
clear,clc,close all

% Definitions
theta = 0; % [rad]
a = 25; % [in]

r = a:0.01:5 * a; % [in]

% Calculate normalized stresses
sigma_r_n = 0.5 * ((1 - a^2 ./ r.^2) - ...
    (1 - 4 * a^2 ./ r.^2 + 3 * a^4 ./ r.^4) * cos(2 * theta)); % []
sigma_theta_n = 0.5 * ((1 + a^2 ./ r.^2) + ...
    (1 + 3 * a^4 ./ r.^4) * cos(2 * theta)); % []
tau_rtheta_n = 0.5 * (1 + 2 * a^2 ./ r.^2 - 3 * a^4 ./ r.^4) ...
    * sin(2 * theta); % []

% Calculate the maximum stresses
[sigma_r_n_max, sigma_r_n_max_i] = max(sigma_r_n);
[sigma_theta_n_max, sigma_theta_n_max_i] = max(sigma_theta_n);
[tau_rtheta_n_max, tau_rtheta_n_max_i] = max(tau_rtheta_n);

% Plot the normalized stresses
f1 = figure('Name', 'sigma_r normalized');
plot(r, sigma_r_n);
grid on;
title('sigma_r Normalized');
xlabel('r [in]');
ylabel('sigma_r_,_n []');
f2 = figure('Name', 'sigma_theta normalized');
plot(r, sigma_theta_n);
grid on;
title('sigma_t_h_e_t_a Normalized');
xlabel('r [in]');
ylabel('sigma_t_h_e_t_a_,_n []');
f3 = figure('Name', 'tau_rtheta normalized');
plot(r, tau_rtheta_n);
grid on;
title('tau_r_t_h_e_t_a Normalized');
xlabel('r [in]');
ylabel('tau_r_t_h_e_t_a_,_n []');

% Print the maximum normalized stresses
fprintf(['Given a = %g [in]...\n' ...
    'sigma_r_n_max = %g [] @ r = %g [in]\n' ...
    'sigma_theta_n_max = %g [] @ r = %g [in]\n' ...
    'tau_rtheta_n = %g [] @ r = %g [in]\n'], a, ...
    sigma_r_n_max, r(sigma_r_n_max_i), ...
    sigma_theta_n_max, r(sigma_theta_n_max_i), ...
    tau_rtheta_n_max, r(tau_rtheta_n_max_i));