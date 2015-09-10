K = 5;
N = 20;
k = [0:K]';
w = [0:N]'/N*pi;
cut_line= max(find(w<=pi/3));
for idx = cut_line:N+1
	[x] = FIR_LP(K, N, idx);
	y(idx-cut_line+1) = x(7);
end	
subplot(1, 2, 2);
plot(w(cut_line:end),y,'-', 'LineWidth',2);
set(gca, 'Grid', 'on', 'FontSize', 16);
xlim([0,3.5]);
title('N=20, 5^t^h Order', 'FontSize', 16);
xlabel('w_c', 'FontSize', 16);
ylabel('\delta', 'FontSize', 16);

N = 100;
k = [0:K]';
w = [0:N]'/N*pi;
cut_line= max(find(w<=pi/3));
for idx = cut_line:N+1
	[x] = FIR_LP(K, N, idx);
	y(idx-cut_line+1) = x(7);
end	
subplot(1, 2, 1);
plot(w(cut_line:end),y,'-', 'LineWidth',2, 'xlim', [1,3.5]);
set(gca, 'Grid', 'on', 'FontSize', 16);
xlim([0,3.5]);
title('N=100, 5^t^h Order', 'FontSize', 16);
xlabel('w_c', 'FontSize', 16);
ylabel('\delta', 'FontSize', 16);