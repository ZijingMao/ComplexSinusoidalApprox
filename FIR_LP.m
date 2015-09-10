function [x] = FIR_LP(K, N, wc)

k = (0:K)';
w = (0:N)'/N*pi;
cut_line= find(w<=pi/3, 1, 'last' );

cosw_0_3pi = cos(w(1:cut_line)*k');
A1 = [cosw_0_3pi, zeros([cut_line, 1])];
b1_1 = repmat(1.12, [cut_line, 1]);
b1_2 = repmat(-0.89, [cut_line, 1]);

cosw_wc_pi = cos(w(wc:end)*k');
A2_1 = [cosw_wc_pi, -ones([size(cosw_wc_pi,1), 1])];
A2_2 = -[cosw_wc_pi, ones([size(cosw_wc_pi,1), 1])];
b2 = zeros([size(cosw_wc_pi,1), 1]);

A = [A1;-A1;A2_1;A2_2];
b = [b1_1;b1_2;b2;b2];

f = [zeros([K+1, 1]); 1];

x = linprog(f,A,b);

end