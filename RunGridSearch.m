clear all;
clc;
N = 10;
step = 3.14/N;
f_obj = zeros(N+1, N+1, N+1);
for idx1 = 0:10
    x1 = step*idx1+0.1;
    for idx2 = 0:10
        x2 = step*idx2+0.1;
        for idx3 = 0:10
            x3 = step*idx3+0.1;
            x = [x1;x2;x3;1];
            [f_obj(idx1+1, idx2+1, idx3+1)] = GridScript(x);
        end
    end
end
