% Matlab Model by Jianghua Yin (Apr.,2019,Nanning)
% Copyright (C) 2019 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem14(x,mode)
% Sabi'u, J., Shah, A., Waziri, M.Y.,: Two optimal Hager-Zhang conjugate 
% gradient methods for solving monotone nonlinear equations, 
% Applied Numerical Mathematics, 153, 217-233 (2020)

% Yuan, G.L., Zhang, M.J.: A three-terms Polak¨CRibi¨¨re¨CPolyak conjugate 
% gradient algorithm for large-scale nonlinear equations. 
% Journal of Computational and Applied Mathematics. 286 (2015) 186-195
n = length(x);
if mode==1
  Fx=ones(n,1);
    Fx(1)= exp(x(1))-1;
  for i=2:n
    Fx(i)=exp(x(i))+x(i)-1;
  end
  out=Fx;
elseif  mode==2
    out=max(x,0);
end

% out = exp(x)+x-1;
% out(1) = exp(x(1))-1;
