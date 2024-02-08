% Matlab Model by Jianghua Yin (Apr.,2019,Nanning)
% Copyright (C) 2019 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem12(x,mode)
% La Cruz W, Raydan M. Nonmonotone Spectral Methods for Large-Scale 
% Nonlinear Systems. Optimization Methods and Software, 2003, 18(5):583-599.
n = length(x);
if mode==1
      Fx=ones(n,1);
        for i=1:n
    Fx(i)=log(x(i)+1)-x(i)/n;
        end
    out=Fx;
elseif  mode==2
    out=max(x,0);
end

% n = length(x);
% out=log(x+1)-x/n;


    
        
    
    


