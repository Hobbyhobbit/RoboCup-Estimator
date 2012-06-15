function [prob] = i_measurement(robot_m,m_values,e_values)
%I_MEASUREMENT Dynamic adaption of covariance matrix.
%
%   [PROB] = I_MEASUREMENT(ROBOT_M,M_VALUES,E_VALUES) uses the former
%   measurements from the robots M_VALUES and the former estimation from
%   the robots E_VALUES in order to compute correction parameters for the
%   covariance matrix R, used in the extended Kalman filtering algorithm.
%   We use a probabilistic model.

    global Noise


%----------- Initialization of angle vector and history size  -----------%

    prob_x = zeros(1,8);
    prob_y = zeros(1,8);
    prob_dir = zeros(1,8);


%----------- Initialization of history for every robot  -----------%

    for i = 1:8
    
% Correction of the position
        
        % Probabilities that the absolute differences of position and 
        % direction between estimates and measurements is bigger than the
        % actual differences.
        x_abs = abs(e_values(1,1,i)-m_values(1,1,i));
        y_abs = abs(e_values(2,1,i)-m_values(2,1,i));
        dir_abs = abs(e_values(3,1,i)-m_values(3,1,i));
        prob_x(i) = erfc(x_abs/(sqrt(robot_m(i).sigma)));
        prob_y(i) = erfc(y_abs/(sqrt(robot_m(i).sigma)));
        prob_dir(i) = erfc(dir_abs/(sqrt(robot_m(i).sigma*2*pi)));
        
        prob = [prob_x; prob_y; prob_dir]; 
    end    
end
