clc;
clf;
N_simulations = 10000;
N_points = 1000;

integral_estimates = zeros(1, N_simulations);

for i = 1:N_simulations
    x = pi * rand(1, N_points);
   
    y = sin(x);
 
    integral_estimates(i) = pi * mean(y);
end

% Plot histogram of the integral estimates
histogram(integral_estimates, 15); 
xlabel('Estimated Integral');
ylabel('Frequency');
title('Monte Carlo Integration of sin(x) from 0 to \pi');
mean_estimate = mean(integration_estimates);
std_estimate = std(integration_estimates);
fprintf('Analytical value = 2 \n');
fprintf('Mean of integration estimates: %f\n', mean_estimate);
fprintf('Standard deviation of integration estimates: %f\n', std_estimate)