close all;

% f = @(alfa) cos(alfa);
% f = @(alfa) sin(alfa).*cos(alfa);
% f = @(alfa) sin(2*alfa).*cos(2*alfa);
f = @(alfa) sqrt(abs(cos(2*alfa)));

p = 0.6;

theta = 0:0.01:2*pi;
rho = f(theta);

theta_p = p*2*pi;
rho_p = f(theta_p);

figure;
polarplot(theta, rho)
% hold on;
% polarplot(theta_p, rho_p, 'o')

X = rho .* cos(theta);
Y = rho .* sin(theta);
% X_p = rho_p .* cos(theta_p);
% Y_p = rho_p .* sin(theta_p);

figure;
plot(X, Y);
% hold on;
% plot(X_p, Y_p, 'o');

p = [0:0.01:1];
d = zeros(length(p),1);

% Animation
figure;
plot(X, Y);
hold on;
for p=0:0.01:1
    theta_p = p*2*pi;
    rho_p = f(theta_p);
    X_p = rho_p .* cos(theta_p);
    Y_p = rho_p .* sin(theta_p);
    plot(X_p, Y_p, 'ro');
    pause(0.1);
end


% Animation
figure;
plot(X, Y);
hold on;
X_a = 0;
Y_a = 0;
i = 1;
for p=0:0.01:1
    theta_p = p*2*pi;
    rho_p = f(theta_p);
    X_p = rho_p .* cos(theta_p);
    Y_p = rho_p .* sin(theta_p);
    plot(X_p, Y_p, 'ro');
    pause(0.1);
    
    d(i) = sqrt((X_p - X_a)^2 + (Y_p - Y_a)^2);
    
    X_a = X_p;
    Y_a = Y_p;
    i = i + 1;
end
p = [0:0.01:1];
figure;
plot(p, d);