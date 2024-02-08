% Matlab Model by Jianghua Yin (Jan.,2021, Nanning)
% Copyright (C) 2020 Jian Group
% All Rights Reserved
%
%% the derivative-free projection method (DFPM) for solving the
%% unconstrained nonlinear monotone equations of the form
%   F(x)=0.
%
function [Tcpu,NF,Itr,NormF] = UIDFPM(NO,method,model,x0,para)

format long

% start the clock
tic;

%% the number of itrations
% Itr=0;

%% Initial information
[nprob,~]=init(NO);

%% the stopping criterion
epsilon=1e-6;
epsilon1=1e-7;

%% the line search parameters and relaxation factor
k_max = para.Itr_max;   % the maximum number of iterations
gamma = para.gamma;     % the initial guess
sigma = para.sigma;     % the coefficient of line search
tau = para.tau;         % the compression ratio
rho = para.rho;         % the relaxation factor

fprintf('%s & %s & LSmodel=%d & gamma=%.4f & sigma=%.4f & tau=%.4f & rho=%.4f\n', ...
    nprob,method,model,gamma,sigma,tau,rho);

%% compute the search direction
Fk = feval(nprob,x0);   % evaluate the function value specified by nprob at x0
NF = 1;                 % the total number of function evaluations
dk = -Fk;
NormFk_old = norm(Fk);
L1 = 0;

for k=1:k_max
    
    if k==1 && NormFk_old<=epsilon
        L1 = 1;
        NormF = NormFk_old;    % the final norm of equations
        break;
    end
    
    %%% Start Armijo-type line search  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % model=1 means -F(zk)'*dk �� sigma*tk*norm(dk)^2
    % model=2 means -F(zk)'*dk �� sigma*tk*norm(F(zk))*norm(dk)^2
    % model=3 means -F(zk)'*dk �� sigma*tk*norm(F(zk))/(1+norm(F(zk)))*norm(dk)^2
    % model=4 means -F(zk)'*dk �� sigma*tk*min(nu,norm(Fz_new,2))*norm(dk)^2
    if model==1
        t = gamma;
        z_new = x0+t*dk;
        Fz_new = feval(nprob,z_new);
        NF = NF+1;
        Normdk2 = norm(dk)^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = x0+t*dk;
            Fz_new = feval(nprob,z_new);
            NF = NF+1;
        end %%% End Armijo-type line search %%%
    elseif model==2
        t = gamma;
        z_new = x0+t*dk;
        Fz_new = feval(nprob,z_new);
        NF = NF+1;
        Normdk2 = norm(dk)^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*norm(Fz_new)*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = x0+t*dk;
            Fz_new = feval(nprob,z_new);
            NF = NF+1;
        end %%% End Armijo-type line search %%%
    elseif model==3
        t = gamma;
        z_new = x0+t*dk;
        Fz_new = feval(nprob,z_new);
        NF = NF+1;
        NormFzk = norm(Fz_new);
        Normdk2 = norm(dk)^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*NormFzk/(1+NormFzk)*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = x0+t*dk;
            Fz_new = feval(nprob,z_new);
            NF = NF+1;
            NormFzk = norm(Fz_new);
        end %%% End Armijo-type line search %%%
    else
        nu = 0.8;
        t = gamma;
        z_new = x0+t*dk;
        Fz_new = feval(nprob,z_new);
        NF = NF+1;
        NormFzk = norm(Fz_new);
        Normdk2 = norm(dk)^2;
        % check the Armijo-type line search condition
        while -Fz_new'*dk < sigma*t*min(nu,NormFzk)*Normdk2 && t>10^-6
            % the Armijo-type line search condition violated
            t = t*tau;
            z_new = x0+t*dk;
            Fz_new = feval(nprob,z_new);
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
    xik = Fzk'*(x0-zk)/NormFzk^2;
    % compute the next iteration
    x1 = x0-rho*xik*Fzk;
    Fk0 = Fk;
    Fk = feval(nprob,x1);
    NF = NF+1;
    NormFk = norm(Fk);
    if NormFk<=epsilon
        L1 = 1;
        NormF = NormFk;
        break;
    end
    % update the search direction
    yk = Fk-Fk0;
    sk = x1-x0;
    switch method
        case 'USDGPM'
            dk = (-1)*Fk;
        case 'UT2CGPM'
            NormFk_old2 = NormFk_old^2;
            betak = Fk'*yk/NormFk_old2;
            lambdak = Fk'*dk/NormFk_old2;
            dk = (-1)*Fk+betak*dk-lambdak*yk;
        case 'VRMILP'
            NormFk2 = NormFk^2; %||F_{k}||^2
            Normdk2 = norm(dk)^2;
            %NormFk_old2 = NormFk_old^2; %||F_{k-1}||^2
            %citakk = 1;%��ʵ�Ǹ����ʽ���˴�Ϊ�����ȸ�ֵ
            miuu = 2.4; %��max����Ħ�,�˴�Ϊ�����ȸ�ֵ
            numerator = NormFk2 - (NormFk/norm(dk))*Fk'*dk;
            denominator =max(miuu*NormFk*norm(dk),Normdk2);
            betak = numerator/denominator;
            %caplk = (Fk'*dk)/denominator;
            dk = -Fk+betak*dk;
        case 'R5'
            NormFk2 = NormFk^2; %||F_{k}||^2
            NormFk_old2 = NormFk_old^2; %||F_{k-1}||^2
            Normdk2=norm(dk)^2;
            citakk = 0.5;%��ʵ�Ǹ����ʽ���˴�Ϊ�����ȸ�ֵ
            miuu = 1.8; %��max����Ħ�,�˴�Ϊ�����ȸ�ֵ
            numerator = NormFk2 - citakk*(NormFk/norm(dk)*Fk'*dk);
            denominator =max(max(miuu*NormFk*norm(dk),NormFk_old2),Normdk2);
            betak = numerator/denominator;
            dk = -Fk+betak*dk;
        case'HTTCG'
            tk=min(0.3,max(0,1-yk'*sk/norm(yk)^2)); % yk1=yk+0.01*dk����ֵЧ��û��ֱ��ʹ��ykЧ����
            mu=0.2;
            fenmu=max(norm(Fk0)^2,max(mu*norm(dk)*norm(yk),dk'*yk));
            thetak=tk*Fk'*dk/fenmu;  % ԭʼ�ķ�ĸ�� norm(Fk0)^2
            betak=Fk'*yk/fenmu-norm(yk)^2*Fk'*dk/fenmu^2; %(max(mu*norm(dk)*norm(Fk),norm(Fk0)^2))
            dk=-Fk+betak*dk+thetak*yk;
        case 'PDY' %Liu J.K.,Feng Y.M.,(2018)A derivative-free iterative method for nonlinear monotone
            %equations with convex constraints,Numerical Algorithms
            tk=1+max(0,-dk'*yk/norm(dk)^2);
            wk=yk+tk*dk;
            betak=norm(Fk)^2/(dk'*wk);
            c=1;
            thetak=c-Fk'*dk/(dk'*wk);
            dk=-thetak*Fk+betak*dk;
            
        case 'WYL'
            betak=Fk'*(Fk-norm(Fk)/norm(Fk0)*Fk0)/norm(Fk0)^2; % WYL
            dk=-1*Fk+betak*dk;
    end
    if norm(dk)<epsilon1
        L1 = 1;
        NormF = norm(Fk);
        break;
    end
    % update the iteration
    x0 = x1;
    NormFk_old = NormFk;
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
