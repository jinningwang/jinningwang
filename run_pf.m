function run_pf()
    
    global V delta theta delta_P delta_Q Psch Qsch nb tolerance
    delta_ans = 1;  % initialize
    iter = 0;  % iteration counter
    
    while max(abs(delta_ans)) >= tolerance
        
        iter = iter + 1;
    
        % build Jacobian matrix
        Jacobian = form_Jac(); % standard
        
        % solve eqn
        delta_ans = solveLS(Jacobian, [delta_P(2 : end); delta_Q(3 : end)]);
    
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
    
end
