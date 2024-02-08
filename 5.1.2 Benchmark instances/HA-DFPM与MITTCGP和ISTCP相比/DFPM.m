% Matlab Model by Jianghua Yin (Jan.,2021, Nanning)
% Copyright (C) 2020 Jian Group
% All Rights Reserved
%
%% the derivative-free projection method (DFPM) for solving the
%% unconstrained nonlinear monotone equations of the form
%   F(x)=0.
%
function [Tcpu,NF,Itr,NormF] = DFPM(NO,method,model,para)

format long

% start the clock
tic;

%% the number of itrations
% Itr=0;

%% Initial information
% [nprob,~]=init(NO);
[nprob,n,x0,x2]=init2(NO); 
%% the stopping criterion
epsilon=1e-6;
epsilon1=1e-7;

%% the line search parameters and relaxation factor
k_max = para.Itr_max;   % the maximum number of iterations
gamma = para.gamma;     % the initial guess
sigma = para.sigma;     % the coefficient of line search
tau = para.tau;         % the compression ratio
alpha = para.alpha;     % the coefficient of the inertial step
rho = para.rho;         % the relaxation factor


fprintf('%s & %s & LSmodel=%d & gamma=%.4f & sigma=%.4f & tau=%.4f & alpha=%.4f & rho=%.4f\n', ...
    nprob,method,model,gamma,sigma,tau,alpha,rho);

%% compute the search direction
Fxk = feval(nprob,x0,1);   % evaluate the function value specified by nprob at x0
NF = 1;
NormFxk = norm(Fxk);
x0_old = x2;
L1 = 0;
alpha1 = alpha;
for k=1:k_max
    
    if k==1 && NormFxk<=epsilon
        L1 = 1;
        NormF = NormFxk; % the final norm of equations
        break;
    end
    
    %% compute the inertial step %%
    y0 = x0+alpha1*(x0-x0_old);
    alpha1=min(alpha,1/((k^2)*norm(x0-x0_old,2)));
    Fyk = feval(nprob,y0,1);
    NF = NF+1;
    NormFyk = norm(Fyk);
    if NormFyk<=epsilon
        L1 = 1;
        NormF = NormFyk;   % the final norm of equations
        break;
    end
    
    %% compute the initial direction %%
    if k==1
        dk = -Fyk;
    else
        % update the search direction
        wk = Fzk-Fyk_old;
        %         sk = zk-y0;
        switch method
            case 'IRSDGPM'
                dk = (-1)*Fyk;
            case 'IRT2CGPM'
                NormFyk_old2 = NormFyk_old^2;
                betak = Fyk'*wk/NormFyk_old2;
                lambdak = Fyk'*dk/NormFyk_old2;
                dk = -Fyk+betak*dk-lambdak*wk;
            case 'IR5'
                NormFyk2 = NormFyk^2; %||F_{k}||^2
                NormFyk_old2 = NormFyk_old^2; %||F_{k-1}||^2
                Normdk2=norm(dk)^2;
                citakk = 0.5;%其实是个表达式，此处为方便先赋值
                miuu = 1.8; %是max里面的μ,此处为方便先赋值
                numerator = NormFyk2 - citakk*(NormFyk/norm(dk))*Fyk'*dk;
                denominator = max(max(miuu*NormFyk*norm(dk),NormFyk_old2),Normdk2);
                betak = numerator/denominator;
                dk = -Fyk+betak*dk;
            case 'ZW'
                NormFyk2 = NormFyk^2; %||F_{k}||^2
                NormFyk_old2 = NormFyk_old^2; %||F_{k-1}||^2
                %Normdk2=norm(dk)^2;
                citakk = 0.5;%其实是个表达式，此处为方便先赋值
                miuu = 1.6; %是max里面的μ,此处为方便先赋值
                numerator = NormFyk2 - citakk*(NormFyk/NormFyk_old)*Fyk'*Fyk_old;
                denominator = max(miuu*NormFyk*norm(dk),NormFyk_old2);
                %numerator2 = norm(Fyk'*dk);
                numerator2 = abs(Fyk'*dk);
                denominator2 = max(miuu*NormFyk*norm(dk),NormFyk_old2);
                betak = numerator/denominator;
                lkk = numerator2/denominator2;
                dk = -(1+lkk)*Fyk+betak*dk;
            case 'ISTCP'
                betak=-Fyk'*Fyk_old/(Fyk_old'*dk); %注意此点的  Fk0 与 Fzk
                thetak=Fyk'*dk/(Fyk_old'*dk);
                dk=-Fyk+betak*dk+thetak*Fyk_old;
            case 'MITTCGP'
                yk = Fyk - Fyk_old;
                sk = x1 - x0;
                tk=1+max(0,-dk'*yk/norm(dk)^2);
                wk1=yk+tk*dk;
                Tk=min(0.4,max(0,1-yk'*sk/norm(yk)^2)); % yk1=yk+0.01*dk的数值效果没有直接使用yk效果好
                mu=0.1;   
                fenmu=max(norm(Fyk_old)^2,max(mu*norm(dk)*norm(wk1),dk'*wk1));
                thetak=Tk*Fyk'*dk/fenmu;  % 原始的分母是 norm(Fk0)^2  
                betak=Fyk'*wk1/fenmu-norm(wk1)^2*Fyk'*dk/fenmu^2; %(max(mu*norm(dk)*norm(Fk),norm(Fk0)^2))
                dk=-Fyk+betak*dk+thetak*wk1;
                
        end
    end
    Normdk = norm(dk);
    if Normdk<epsilon1
        L1 = 1;
        NormF = NormFyk;
        break;
    end
    
    %%% Start Armijo-type line search  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % model=1 means -F(zk)'*dk ≥ sigma*tk*norm(dk)^2
    % model=2 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))*norm(dk)^2
    % model=3 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))/(1+norm(F(zk)))*norm(dk)^2
    % model=5 means -F(zk)'*dk ≥ sigma*tk*min(nu,norm(Fz_new,2))*norm(dk)^2
    % %%%%%%
    if model==1
        t = gamma;
        z_new = y0+t*dk;
        Fz_new = feval(nprob,z_new,1);
        NF = NF+1;
        Normdk2 = Normdk^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = y0+t*dk;
            Fz_new = feval(nprob,z_new,1);
            NF = NF+1;
        end %%% End Armijo-type line search %%%
    elseif model==2
        t = gamma;
        z_new = y0+t*dk;
        Fz_new = feval(nprob,z_new);
        NF = NF+1;
        Normdk2 = Normdk^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*norm(Fz_new)*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = y0+t*dk;
            Fz_new = feval(nprob,z_new);
            NF = NF+1;
        end %%% End Armijo-type line search %%%
    elseif model==3
        t = gamma;
        z_new = y0+t*dk;
        Fz_new = feval(nprob,z_new);
        NF = NF+1;
        NormFzk = norm(Fz_new);
        Normdk2 = Normdk^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*NormFzk/(1+NormFzk)*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = y0+t*dk;
            Fz_new = feval(nprob,z_new);
            NF = NF+1;
            NormFzk = norm(Fz_new);
        end %%% End Armijo-type line search %%%
    elseif model==4
        nu = 0.8;
        t = gamma;
        z_new = y0+t*dk;
        Fz_new = feval(nprob,z_new);
        NF = NF+1;
        NormFzk = norm(Fz_new);
        Normdk2 = Normdk^2;
        % check the Armijo-type line search condition
        % eta_k=max(0.001,min(0.8,norm(Fz_new,2))); %norm(Fz_new,2)/(1+norm(Fz_new,2)); % 0.001,8 
        while -Fz_new'*dk < sigma*t*min(nu,NormFzk/(1+NormFzk))*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = y0+t*dk;
            Fz_new = feval(nprob,z_new);
            NF = NF+1;
            NormFzk = norm(Fz_new);
        end %%% End Armijo-type line search %%%
    else
        nu = 0.8;
        t = gamma;
        z_new = y0+t*dk;
        Fz_new = feval(nprob,z_new,1);
        NF = NF+1;
        NormFzk = norm(Fz_new);
        Normdk2 = Normdk^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*min(nu,NormFzk)*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = y0+t*dk;
            Fz_new = feval(nprob,z_new,1);
            NF = NF+1;
            NormFzk = norm(Fz_new);
        end %%% End Armijo-type line search %%%
    end
    zk = z_new;
    Fzk = Fz_new;
    NormFzk = norm(Fzk);
    if NormFzk<=epsilon
        L1 = 1;
        NormF = NormFzk; % the final norm of equations
        break;
    end
    xik = Fzk'*(y0-zk)/NormFzk^2;
    % compute the next iteration
    z1 = y0-rho*xik*Fzk;
         x1 = feval(nprob,z1,2);
    Fxk = feval(nprob,x1,1);
    NF = NF+1;
    NormFxk = norm(Fxk);
    if NormFxk<=epsilon
        L1 = 1;
        NormF = NormFxk;
        break;
    end
    
    % update the iteration
    x0_old = x0;
    x0 = x1;
    Fyk_old = Fyk;
    NormFyk_old =  NormFyk;
end
if L1==1
    Itr = k;
    Tcpu = toc;
else
     NF =  NF;
    Itr = k;
    Tcpu = toc;
    NormF = NormFyk;
end
