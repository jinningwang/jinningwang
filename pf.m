clear;
clc;

global bus branch tolerance max_iter

% No.; Type; V; theta; P_gen; Q_gen; P_load; Q_load
bus = [1,0,1.05,0,0,0,0.25,0.1;
       2,1,1.05,0,0.5,0,0.15,0.05;
       3,2,1.00,0,0,0,0.275,0.11;
       4,2,1.00,0,0,0,0,0;
       5,2,1.00,0,0,0,0.15,0.09;
       6,2,1.00,0,0,0,0.25,0.15];

% No.; To; From; R; X; B
branch = [1,1,4,0.020,0.185,0.009;
          2,1,6,0.031,0.259,0.010;
          3,2,3,0.006,0.025,0.000;
          4,2,5,0.071,0.320,0.015;
          5,4,6,0.024,0.204,0.010;
          6,3,4,0.075,0.067,0.000;
          7,5,6,0.025,0.150,0.017];

% program settings
tolerance = 0.00001;  % Convergence tolerance, p.u.
max_iter = 10000;  % maximum iterations

Problem 9
Calculate load flow.
Problem 10
decouple power flow, and fast decoupled power flow.
problem 11
Increase the line resistances by 75%.
% branch(:, 4) = branch(:, 4) * 1.75; % only for problem 11

% form Y matrix
global Y G B
Y = form_Y();
G = real(Y);
B = imag(Y);

% sys. info.
global nb nl n_pq
nb = size(bus, 1);
nl = size(branch,1);
n_pq = nb - 2;

% initialize
% scheduled injection
global Psch Qsch
Psch = bus(:, 5) - bus(:, 7);
Qsch = bus(:, 6) - bus(:, 8);

global V
V = bus(:, 3);  % Voltage magnitute, initial

global theta delta
theta = zeros(nb, nb);  % Voltage angle difference, initial
delta = bus(:, 4);  % Voltage angle, initial
for i = 1 : nb
    for j=1 : nb
        theta(i, j) = delta(i) - delta(j);
    end
end

global Pc Qc delta_P delta_Q
%  mismatch injection
[Pc, Qc] = PQcalc();

delta_P = Psch - Pc;
delta_Q = Qsch - Qc;

%% iteration
tStart = tic;  % count time

delta_ans = 1;  % initialize
iter = 0;  % iteration counter

while max(abs(delta_ans)) >= tolerance
    
    % watchdog
    iter = iter + 1;
    if iter > max_iter
        disp('Max iteration reached, calculation aborted.')
        break
    end

    % build Jacobian matrix, select one of the three
    Jacobian = form_Jac(); % standard
%     Jacobian = form_Jac_d();     % decoupled
%     Jacobian = form_Jac_fd();          % fast decoupled
    
    % solve eqn
    delta_ans = solveLS(Jacobian, [delta_P(2 : end); delta_Q(3 : end)]); % check here all looks good.

    % update delta, V, and theta
    V = V - [0; 0; delta_ans(6:9)].* V;
    delta = delta - [0; delta_ans(1:5)];
    
    theta = zeros(nb, nb);
    for i = 1 : nb
        for j=1 : nb
            theta(i, j) = delta(i) - delta(j);
        end
    end

    % update power flow
    [Pc, Qc] = PQcalc();
    delta_P = Psch - Pc;
    delta_Q = Qsch - Qc;
    
end

tEnd = toc(tStart);  % count time end
disp('Iterations:')
disp(iter);

disp('Time:')
disp(tEnd);

disp('Results:')
delta
V

%% loss

Y_angle = angle(Y);

P_inj = zeros(nl,1);
Q_inj = zeros(nl,1);
P_rec = zeros(nl,1);
Q_rec = zeros(nl,1);

for i=1:nl
    a = branch(i,2); % start
    b = branch(i,3); % end
    P_inj(i) = V(a)*V(b)*abs(Y(a,b))*cos(delta(a)-delta(b)-Y_angle(a,b)) - V(a)^2*abs(Y(a,b))*cos(Y_angle(a,b));
    Q_inj(i) = V(a)*V(b)*abs(Y(a,b))*sin(delta(a)-delta(b)-Y_angle(a,b)) + V(a)^2*abs(Y(a,b))*sin(Y_angle(a,b));
    P_rec(i) = V(b)*V(a)*abs(Y(b,a))*cos(delta(b)-delta(a)-Y_angle(a,b)) - V(b)^2*abs(Y(b,a))*cos(Y_angle(a,b));
    Q_rec(i) = V(b)*V(a)*abs(Y(b,a))*sin(delta(b)-delta(a)-Y_angle(a,b)) + V(b)^2*abs(Y(b,a))*sin(Y_angle(a,b)); 
end

ploss = P_inj + P_rec;
qloss = Q_inj + Q_rec;

% P injection, Q injection, p loss, q loss
disp('P flow, Q flow, P loss, Q loss (p.u.)');
powerflow = round([P_inj+1j*Q_inj, ploss+1j*qloss], 4)
