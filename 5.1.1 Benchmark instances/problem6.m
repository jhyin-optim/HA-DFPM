% Matlab Model by Jianghua Yin (Apr.,2019,Nanning)
% Copyright (C) 2019 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem10(x,mode)
% Waziri, M.Y., Hungu, K.A.,  Sabi'u, J.: Descent Perry conjugate gradient 
% methods for systems of monotone nonlinear equations. Numer Algor 85, 
% 763–785 (2020).
% Li, Q., Zheng, B. Scaled three-term derivative-free methods for solving 
% large-scale nonlinear monotone equations. Numer Algor (2020). 
% https://doi.org/10.1007/s11075-020-01010-8 此为正确的

n = length(x);
if mode==1
  Fx=ones(n,1);
  Fx(1)= x(1)*(x(1)^2+x(2)^2)-1;
  for i=2:n-1
    Fx(i)= x(i)*(x(i-1)^2+2*x(i)^2+x(i+1)^2)-1;
  end
  Fx(n)=x(n)*(x(n-1)^2+x(n)^2)-1;
  out=Fx;
elseif  mode==2
    out=max(x,0);
end

% n = length(x);
% out = zeros(n,1);
% out(1) = x(1)*(x(1)^2+x(2)^2)-1;
% for i=2:n-1
%     out(i) = x(i)*(x(i-1)^2+2*x(i)^2+x(i+1)^2)-1;
% end
% out(n) = x(n)*(x(n-1)^2+x(n)^2)-1;


    
        
    
    


