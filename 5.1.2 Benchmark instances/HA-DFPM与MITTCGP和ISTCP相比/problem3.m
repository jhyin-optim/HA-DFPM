% Matlab Model by Jianghua Yin (Nov.,2017,Laibin)
% Copyright (C) 2017 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     
                 
function out= problem3(x,mode)
% problem 2 in Zhou WJ, Li DH. A globally convergent BFGS method for nonlinear monotone equations without any merit
% functions. Math. Comput., 2008, 77:2231¨C2240.
n = length(x);
if mode==1
  Fx=ones(n,1);
   Fx(1)=  2*x(1)-x(2)+exp(x(1))-1;
  for i=2:n-1
     Fx(i)=-x(i-1)+2*x(i)-x(i+1)+exp(x(i))-1;
  end
    Fx(n)=2*x(n)-x(n-1)+exp(x(n))-1;
  out=Fx;
elseif  mode==2
    out=max(x,0);
end
% n = length(x);
% out = zeros(n,1);
% out(1) = 2*x(1)-x(2)+exp(x(1))-1;
% for i=2:n-1
%     out(i) = -x(i-1)+2*x(i)-x(i+1)+exp(x(i))-1;
% end
% out(n) = 2*x(n)-x(n-1)+exp(x(n))-1;
% out = Fx;
