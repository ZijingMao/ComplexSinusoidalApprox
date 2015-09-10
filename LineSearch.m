function [t] = LineSearch(f,d,x,beta,alpha)
% Backtracking line search
% See Algorithm 9.2 on page 464 of CVXbook

t = 1;
[fk, fk_prime] = feval(f,x);
prev_x = x;
x = x + t*d;
fk_delta = feval(f,x);
while fk_delta > fk + alpha*t*(fk_prime'*d),
  t = t*beta;
  x = prev_x + t*d;
  fk_delta = feval(f,x);
end

end