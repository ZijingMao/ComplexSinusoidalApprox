function [fx,fx_prime] = TestFuc(x)

% fx is the equation function set
% fx_prime is the gradient of f -- n dimensional vector
% x = [t1; t2; t3; lambda] represent the variable

E = 1;
A_H_1 = 1;
A_H_3 = 1;
A_H_5 = 1;

t1 = x(1);
t2 = x(2);
t3 = x(3);
lambda = x(4);

fx_3 = (4*E/(3*pi)* (cos(3*t1)+cos(3*t2)+cos(3*t3))-A_H_3);
fx_5 = (4*E/(5*pi)* (cos(5*t1)+cos(5*t2)+cos(5*t3))-A_H_5);

fx = [-4*lambda*E/pi * sin(t1) ...
        + 2 * fx_3 * 4*E/pi*sin(3*t1) ...
        + 2 * fx_5 * 4*E/pi*sin(5*t1); 
        
      -4*lambda*E/pi * sin(t2) ...
        + 2 * fx_3 * 4*E/pi*sin(3*t2) ...
        + 2 * fx_5 * 4*E/pi*sin(5*t2); 
        
      -4*lambda*E/pi * sin(t3) ... 
        + 2 * fx_3 * 4*E/pi*sin(3*t3) ...
        + 2 * fx_5 * 4*E/pi*sin(5*t3); 
        
      4*E/pi * (cos(t1)+cos(t2)+cos(t3)) - A_H_1];

fx_prime = [
    
    % The first row
    -4*lambda*E/pi * cos(t1) ...
        + 2 * (fx_3*(4*E)/pi*3*cos(3*t1) + 4*E/pi*sin(3*t1)*4*E/(3*pi)*(-3*sin(3*t1))) ...
        + 2 * (fx_5*(4*E)/pi*5*cos(5*t1) + 4*E/pi*sin(5*t1)*4*E/(5*pi)*(-5*sin(5*t1))), ...                     % f_11
    2 * 4*E/(3*pi)*(-3*sin(3*t2)) * 4*E/pi*sin(3*t1) + 2 * 4*E/(5*pi)*(-5*sin(5*t2)) * 4*E/pi*sin(5*t1), ...    % f_12
    2 * 4*E/(3*pi)*(-3*sin(3*t3)) * 4*E/pi*sin(3*t1) + 2 * 4*E/(5*pi)*(-5*sin(5*t3)) * 4*E/pi*sin(5*t1), ...    % f_13
    4*E/pi*(-sin(t1));                                                                                          % f_14
    
    % The second row
    2 * 4*E/(3*pi)*(-3*sin(3*t1)) * 4*E/pi*sin(3*t2) + 2 * 4*E/(5*pi)*(-5*sin(5*t1)) * 4*E/pi*sin(5*t2), ...    % f_21
    -4*lambda*E/pi * cos(t2) ...
        + 2 * (fx_3*(4*E)/pi*3*cos(3*t2) + 4*E/pi*sin(3*t2)*4*E/(3*pi)*(-3*sin(3*t2))) ...
        + 2 * (fx_5*(4*E)/pi*5*cos(5*t2) + 4*E/pi*sin(5*t2)*4*E/(5*pi)*(-5*sin(5*t2))), ...                     % f_22
    2 * 4*E/(3*pi)*(-3*sin(3*t3)) * 4*E/pi*sin(3*t2) + 2 * 4*E/(5*pi)*(-5*sin(5*t3)) * 4*E/pi*sin(5*t2), ...    % f_23
    4*E/pi*(-sin(t2));                                                                                          % f_24
    
    % The third row
    2 * 4*E/(3*pi)*(-3*sin(3*t1)) * 4*E/pi*sin(3*t3) + 2 * 4*E/(5*pi)*(-5*sin(5*t1)) * 4*E/pi*sin(5*t3), ...	% f_31
    2 * 4*E/(3*pi)*(-3*sin(3*t2)) * 4*E/pi*sin(3*t3) + 2 * 4*E/(5*pi)*(-5*sin(5*t2)) * 4*E/pi*sin(5*t3), ...    % f_32
    -4*lambda*E/pi * cos(t3) ...
        + 2 * (fx_3*(4*E)/pi*3*cos(3*t3) + 4*E/pi*sin(3*t3)*4*E/(3*pi)*(-3*sin(3*t3))) ...
        + 2 * (fx_5*(4*E)/pi*5*cos(5*t3) + 4*E/pi*sin(5*t3)*4*E/(5*pi)*(-5*sin(5*t3))), ...                     % f_33
    4*E/pi*(-sin(t3));                                                                                          % f_34
    
    % The last row
    4*E/pi*(-sin(t1)), ...                                                                                      % f_41
    4*E/pi*(-sin(t2)), ...                                                                                      % f_42
    4*E/pi*(-sin(t3)), ...                                                                                      % f_43
    0                                                                                                           % f_44

    ];

end