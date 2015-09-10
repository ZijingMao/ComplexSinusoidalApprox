function [x, xtrace, err_norm, iflag] = NewtonsMethod( f, x, tolerance, maxiteration)

%  NewtonsMethod is the n dimensional Newton's method that solves
%  f(x) = 0, where f is a n dimensional multivariable function and
%  x is a n dimensional vector
%  fx_prime is the gradient of f -- n dimensional vector
%  No line search

% set tolerances if necessary
if( nargin < 3 ) 
    tolerance = 1e-5; maxiteration = 1000; 
elseif( nargin < 4 ) 
    maxiteration = 1000; 
end

iflag    = 0;
% fx is the value of f
% fx_prime is the gradient of f
[fx,fx_prime] = feval(f, x);
xtrace = cell(maxiteration, 1);
xtrace{1} = x;

it       = 1;
gxnorm   = norm(fx,2);
% err      = [];
err_norm = zeros(maxiteration, 1);
err_norm(1) = gxnorm;
% n = length(fx_prime);

while( it < maxiteration && gxnorm > tolerance )
   s  = -fx_prime\fx;
   t = 1/maxiteration;
   x = x + t*s;
   % xtrace is a structure that contains the previous x vectors
   xtrace{it+1} = x;
   % diff = norm(xtrace{it+1} - xtrace{it}, 2);
   % err = [err; diff];
   it = it+1;
   [fx,fx_prime] = feval(f,x);
   gxnorm = norm(fx,2);
   err_norm(it) = gxnorm;
end


% check why the Newton's method truncated and set iflag
if( gxnorm > tolerance )
    % Newton's method truncated because the maximum number of iterations
    % was reached
    iflag = 1;
    return
end