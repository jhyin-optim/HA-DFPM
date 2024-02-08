% Matlab Model by Jianghua Yin (Jan.,2022, Nanning)
% Copyright (C) 2022 Jian Group
% All Rights Reserved
%
%% the inertial derivative-free projection method (IDFPM) for solving 
%% constrained nonlinear pseudo-monotone equations of the form
%   F(x)=0, x\in C, 
% where C is a nonempty closed convex set.
%
function [Tcpu,NF,Itr,NormF] = IDFPM1(fun,method,Switch,model,x0,para) 
 
format long

% start the clock
tic;

%% the number of itrations
% Itr=0;   

%% the stopping criterion
epsilon = 1e-6;
epsilon1 = 1e-7;

%% the line search parameters and relaxation factor
k_max = para.Itr_max;   % the maximum number of iterations
gamma = para.gamma;     % the initial guess
sigma = para.sigma;     % the coefficient of line search 
tau = para.tau;         % the compression ratio
rho = para.rho;         % the relaxation factor 
alpha_try = 0.1;

fprintf('%s & LSmodel=%d & gamma=%.4f & sigma=%.4f & tau=%.4f & Switch=%.4f & rho=%.4f\n', ... 
    method,model,gamma,sigma,tau,Switch,rho);

%% compute the search direction
Fx0 = feval(fun, x0);   % evaluate the function value specified by nprob at x0
NF = 1;  
NormFx0 = norm(Fx0);                   
x0_old = x0;
L1 = 0;
     
for k=1:k_max
    if k==1 && NormFx0<=epsilon
        L1 = 1;
        NormF = NormFx0; % the final norm of equations
        break; 
    end
    if Switch==1
              alpha=min(alpha_try,1/((k^2)*norm(x0-x0_old)));
      elseif Switch==2
              alpha =(-1)*min(alpha_try,1/((k^2)*norm(x0-x0_old)));
      elseif Switch==3
            alpha =(-1)^k*min(alpha_try,1/((k^2)*norm(x0-x0_old)));
      else
           alpha= alpha_try;
     end
     
    %% compute the inertial step %%
    y6 = x0+alpha*(x0-x0_old);
    Fy0 = feval(fun, y6);
    NF = NF+1;
    NormFy0 = norm(Fy0);
    NormFlk = norm(y6-x0);
       b=sign(abs(alpha-max(-1,min(0,alpha))));
    if NormFy0<=epsilon && b*NormFlk<=epsilon1
        L1 = 1;
        NormF = NormFy0;   % the final norm of equations
        break;
    end
    if NormFy0<=epsilon && b*NormFlk>epsilon1
       y0=x0;
%        Fy0 = Fx0;
    end
     if NormFy0>epsilon
        y0=y6;   % the final norm of equations
     end
    
    %% compute the initial direction %%
    if k==1
        dk = -Fy0;
    else
        % update the search direction
        switch method
            case 'IGPM'
                dk = -Fy0; 
            case 'IHTTCGPM'
                w0 = Fy0-Fy0_old;
                NormFy0_old = norm(Fy0_old);
                Fy0tw0 = Fy0'*w0;
                Fy0tdk = Fy0'*dk;
                denominator = max(1.4*Normdk*norm(w0),NormFy0_old^2);
                betak = Fy0tw0/denominator;
                thetak = Fy0tdk/denominator;
                dk = -Fy0+betak*dk-thetak*w0;
            case 'abcdefg'
                NormFy02 = NormFy0^2;
                NormFy0_old = norm(Fy0_old);
                NormFy0_old2 = NormFy0_old^2 ;
                citakk = 0.5;%其实是个表达式，此处为方便先赋值
                miuu = 5; %是max里面的μ,此处为方便先赋值
                numerator = NormFy02 - citakk*(NormFy0/NormFy0_old)*Fy0'*Fy0_old;
                denominator = max(miuu*NormFy0*norm(dk),NormFy0_old2);
                numerator2 = abs(Fy0'*dk);
                betak = numerator/denominator;
                lkk = numerator2/denominator;
                dk = -(1+lkk)*Fy0+betak*dk;
            case 'IHCGPM'
                w0 = Fy0-Fy0_old;
                NormFy0_old = norm(Fy0_old);
                dktw0 = dk'*w0;
                Fy0tFy0_old = Fy0'*Fy0_old;
                numerator = NormFy0^2-max(0,NormFy0/NormFy0_old*Fy0tFy0_old);
                denominator = max(NormFy0^2,max(3*Normdk*NormFy0,dktw0));   
                betak = numerator/denominator;
                dk = -Fy0+betak*dk;
            otherwise
                disp('Input error! Please check the input method');
        end
    end
    Normdk = norm(dk);
    Normdk2 = Normdk^2;
%     Fy0_old = Fy0;
    
    %%% Start Armijo-type line search  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % model=1 means -F(zk)'*dk ≥ sigma*tk*norm(dk)^2
    % model=2 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))*norm(dk)^2
    % model=3 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))/(1+norm(F(zk)))*norm(dk)^2
    % model=4 means -F(zk)'*dk ≥ sigma*tk*max(lambda,min(nu,norm(Fz_new,2)))*norm(dk)^2
    if model==1
        t = gamma;
        z0_new = y0+t*dk;
        Fz0_new = feval(fun, z0_new);
        NF = NF+1;
        Fz0_newtdk = -Fz0_new'*dk;
        % check the Armijo-type line search condition
        while Fz0_newtdk < sigma*t*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            z0_new = y0+t*dk;
            Fz0_new = feval(fun, z0_new);
            NF = NF+1;
            Fz0_newtdk = -Fz0_new'*dk;
        end %%% End Armijo-type line search %%%
        NormFz0_new = norm(Fz0_new);
    elseif model==2
        t = gamma;
        z0_new = y0+t*dk;
        Fz0_new = feval(fun, z0_new);
        NF = NF+1;
        NormFz0_new = norm(Fz0_new);
        Fz0_newtdk = -Fz0_new'*dk;
        % check the Armijo-type line search condition
        while Fz0_newtdk < sigma*t*NormFz0_new*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            z0_new = y0+t*dk;
            Fz0_new = feval(fun, z0_new);
            NF = NF+1;
            NormFz0_new = norm(Fz0_new);
            Fz0_newtdk = -Fz0_new'*dk;
        end %%% End Armijo-type line search %%%
    elseif model==3
        t = gamma;
        z0_new = y0+t*dk;
        Fz0_new = feval(fun, z0_new);
        NF = NF+1;
        NormFz0_new = norm(Fz0_new);
        Fz0_newtdk = -Fz0_new'*dk;
        % check the Armijo-type line search condition
        while Fz0_newtdk < sigma*t*NormFz0_new/(1+NormFz0_new)*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            z0_new = y0+t*dk;
            Fz0_new = feval(fun, z0_new);
            NF = NF+1;
            NormFz0_new = norm(Fz0_new);
            Fz0_newtdk = -Fz0_new'*dk;
        end %%% End Armijo-type line search %%%
    elseif model==4
        t = gamma;
        z0_new = y0+t*dk;
        Fz0_new = feval(fun, z0_new);
        NF = NF+1;
        NormFz0_new = norm(Fz0_new);
        Fz0_newtdk = -Fz0_new'*dk;
        % check the Armijo-type line search condition
        while Fz0_newtdk < sigma*t*max(0.001,min(0.8,NormFz0_new/(1+NormFz0_new)))*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            z0_new = y0+t*dk;
            Fz0_new = feval(fun, z0_new);
            NF = NF+1;
            NormFz0_new = norm(Fz0_new);
            Fz0_newtdk = -Fz0_new'*dk;
        end %%% End Armijo-type line search %%%
    else
        t = gamma;
        z0_new = y0+t*dk;
        Fz0_new = feval(fun, z0_new);
        NF = NF+1;
        NormFz0_new = norm(Fz0_new);
        Fz0_newtdk = -Fz0_new'*dk;
        % check the Armijo-type line search condition
        while Fz0_newtdk < sigma*t*max(0.001,min(0.8,NormFz0_new))*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            z0_new = y0+t*dk;
            Fz0_new = feval(fun, z0_new);
            NF = NF+1;
            NormFz0_new = norm(Fz0_new);
            Fz0_newtdk = -Fz0_new'*dk;
        end %%% End Armijo-type line search %%%
    end 
    Fz0 = Fz0_new;
    NormFz0 = NormFz0_new;
    xik = t*Fz0_newtdk/NormFz0^2;
    % compute the next iteration 
    x1 = y0-rho*xik*Fz0;
    Fx1 = feval(fun, x1);
    NF = NF+1;
    NormFx1 = norm(Fx1);
    if NormFx1<=epsilon
        L1 = 1;
        NormF = NormFx1;
        break;
    end
    
    % update the iteration
    x0_old = x0;
    x0 = x1;
    Fy0_old = Fy0;
    NormFx0 = NormFx1;
end
if L1==1
    Itr = k;
    Tcpu = toc;
else
    NF = NaN;
    Itr = NaN;
    Tcpu = NaN;
    NormF = NaN;
end
