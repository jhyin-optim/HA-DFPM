   % Matlab Model by Jianghua Yin (July,2021, Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
%
%% the derivative-free projection method (DFPM) for solving the 
%% unconstrained nonlinear monotone equations of the form
%   F(x)=0. 
%
function [x1,mses,Tcpu,NF,NormF] = UIDFPM(A,b,lambda,true_x,method,model,para) 
 
format long

% if A is a matrix, we find out dimensions of y and x,
% and create function handles for multiplication by A and A',
% so that the code below doesn't have to distinguish between
% the handle/not-handle cases
if ~isa(A, 'function_handle')
  AT = @(x) (x'*A)';   %  A'*x;
  A = @(x) A*x;
end
% from this point down, A and AT are always function handles.

% Precompute A'*b since it will be used a lot
Atb = AT(b);    
x0 = Atb;
n = length(x0);

% initial point
xu0 =  x0.*(x0 >= 0);
xv0 = -x0.*(x0 <  0);
% from these two relations, x0 = u0-v0;

%% the stopping criterion
epsilon = 1e-6;
epsilon1 = 1e-7;

%% the line search parameters and relaxation factor
k_max = para.Itr_max;   % the maximum number of iterations
gamma = para.gamma;     % the initial guess
sigma = para.sigma;     % the coefficient of line search 
tau = para.tau;         % the compression ratio
rho = para.rho;         % the relaxation factor 

fprintf('%s & LSmodel=%d & gamma=%.4f & sigma=%.4f & tau=%.4f & rho=%.4f\n', ... 
    method,model,gamma,sigma,tau,rho);

% start the clock
t0 = cputime;

% % define function handle
% Fu = @(x,xu) min(xu,AT(A(x))-Atb+lambda);
% Fv = @(x,xv) min(xv,-AT(A(x))+Atb+lambda);

%% compute the search direction
Ax0 = A(x0);
tempx = AT(Ax0)-Atb;
Fxu0 = min(xu0,tempx+lambda);
Fxv0 = min(xv0,-tempx+lambda);
NF = 1;  
dku = -Fxu0;
dkv = -Fxv0;
Normdk2 = dku'*dku+dkv'*dkv;
NormFxk2 = Fxu0'*Fxu0+Fxv0'*Fxv0;    
NormFxk = sqrt(NormFxk2);
NormFxk_old=NormFxk;
NormFxk2_old = NormFxk2;

L1 = 0;

for k=1:k_max
    
    if k==1 && NormFxk<=epsilon
        L1 = 1;
        NormF = NormFxk;    % the final norm of equations
        mses(k) = 1/n*norm(x0-true_x)^2;
        Tcpu(k) = cputime-t0;
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
        zuk_new = xu0+t*dku;
        zvk_new = xv0+t*dkv;
        zk_new = zuk_new-zvk_new;
        Azk_new = A(zk_new);
        tempz = AT(Azk_new)-Atb;
        Fzuk_new = min(zuk_new,tempz+lambda);
        Fzvk_new = min(zvk_new,-tempz+lambda);
        NF = NF+1;
        Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        % check the Armijo-type line search condition
        while -Fzk_newtdk < sigma*t*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            zuk_new = xu0+t*dku;
            zvk_new = xv0+t*dkv;
            zk_new = zuk_new-zvk_new;
            Azk_new = A(zk_new);
            tempz = AT(Azk_new)-Atb;
            Fzuk_new = min(zuk_new,tempz+lambda);
            Fzvk_new = min(zvk_new,-tempz+lambda);
            NF = NF+1;
            Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        end %%% End Armijo-type line search %%%
        NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
        NormFzk_new = sqrt(NormFzk_new2);
    elseif model==2
        t = gamma;
        zuk_new = xu0+t*dku;
        zvk_new = xv0+t*dkv;
        zk_new = zuk_new-zvk_new;
        Azk_new = A(zk_new);
        tempz = AT(Azk_new)-Atb;
        Fzuk_new = min(zuk_new,tempz+lambda);
        Fzvk_new = min(zvk_new,-tempz+lambda);
        NF = NF+1;
        NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
        NormFzk_new = sqrt(NormFzk_new2);
        Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        % check the Armijo-type line search condition
        while -Fzk_newtdk < sigma*t*NormFzk_new*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            zuk_new = xu0+t*dku;
            zvk_new = xv0+t*dkv;
            zk_new = zuk_new-zvk_new;
            Azk_new = A(zk_new);
            tempz = AT(Azk_new)-Atb;
            Fzuk_new = min(zuk_new,tempz+lambda);
            Fzvk_new = min(zvk_new,-tempz+lambda);
            NF = NF+1;
            NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
            NormFzk_new = sqrt(NormFzk_new2);
            Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        end %%% End Armijo-type line search %%%
    elseif model==3
        t = gamma;
        zuk_new = xu0+t*dku;
        zvk_new = xv0+t*dkv;
        zk_new = zuk_new-zvk_new;
        Azk_new = A(zk_new);
        tempz = AT(Azk_new)-Atb;
        Fzuk_new = min(zuk_new,tempz+lambda);
        Fzvk_new = min(zvk_new,-tempz+lambda);
        NF = NF+1;
        NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
        NormFzk_new = sqrt(NormFzk_new2);
        Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        % check the Armijo-type line search condition
        while -Fzk_newtdk < sigma*t*NormFzk_new/(1+NormFzk_new)*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            zuk_new = xu0+t*dku;
            zvk_new = xv0+t*dkv;
            zk_new = zuk_new-zvk_new;
            Azk_new = A(zk_new);
            tempz = AT(Azk_new)-Atb;
            Fzuk_new = min(zuk_new,tempz+lambda);
            Fzvk_new = min(zvk_new,-tempz+lambda);
            NF = NF+1;
            NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
            NormFzk_new = sqrt(NormFzk_new2);
            Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        end %%% End Armijo-type line search %%%
         elseif model==4
        nu = 0.8;
        t = gamma;
        zuk_new =xu0+t*dku;
        zvk_new =xv0+t*dkv;
        zk_new = zuk_new-zvk_new;
        Azk_new = A(zk_new);
        tempz = AT(Azk_new)-Atb;
        Fzuk_new = min(zuk_new,tempz+lambda);
        Fzvk_new = min(zvk_new,-tempz+lambda);
        NF = NF+1;
        Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
        NormFzk_new = sqrt(NormFzk_new2);
        % check the Armijo-type line search condition
        while -Fzk_newtdk < sigma*t*max(0.001,min(nu,NormFzk_new/(1+NormFzk_new)))*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            zuk_new =xu0+t*dku;
            zvk_new = xv0+t*dkv;
            zk_new = zuk_new-zvk_new;
            Azk_new = A(zk_new);
            tempz = AT(Azk_new)-Atb;
            Fzuk_new = min(zuk_new,tempz+lambda);
            Fzvk_new = min(zvk_new,-tempz+lambda);
            NF = NF+1;
            Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
            NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
            NormFzk_new = sqrt(NormFzk_new2);
        end %%% End Armijo-type line search %%%
    else
        nu = 0.8;
        t = gamma;
        zuk_new = xu0+t*dku;
        zvk_new = xv0+t*dkv;
        zk_new = zuk_new-zvk_new;
        Azk_new = A(zk_new);
        tempz = AT(Azk_new)-Atb;
        Fzuk_new = min(zuk_new,tempz+lambda);
        Fzvk_new = min(zvk_new,-tempz+lambda);
        NF = NF+1;
        NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
        NormFzk_new = sqrt(NormFzk_new2);
        Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        % check the Armijo-type line search condition
        while -Fzk_newtdk < sigma*t*min(nu,NormFzk_new)*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            zuk_new = xu0+t*dku;
            zvk_new = xv0+t*dkv;
            zk_new = zuk_new-zvk_new;
            Azk_new = A(zk_new);
            tempz = AT(Azk_new)-Atb;
            Fzuk_new = min(zuk_new,tempz+lambda);
            Fzvk_new = min(zvk_new,-tempz+lambda);
            NF = NF+1;
            NormFzk_new2 = Fzuk_new'*Fzuk_new+Fzvk_new'*Fzvk_new;
            NormFzk_new = sqrt(NormFzk_new2);
            Fzk_newtdk = Fzuk_new'*dku+Fzvk_new'*dkv;
        end %%% End Armijo-type line search %%%
    end 
    zuk = zuk_new;
    zvk = zvk_new;
    zk = zuk-zvk;
    Fzuk = Fzuk_new;
    Fzvk = Fzvk_new;
    NormFzk2 = NormFzk_new2;
    NormFzk = NormFzk_new;
    if NormFzk<=epsilon
        L1 = 1;
        NormF = NormFzk; % the final norm of equations
        mses(k) = 1/n*norm(zk-true_x)^2;
        Tcpu(k) = cputime-t0;
        break;
    end
    Fzktxkzk = Fzuk'*(xu0-zuk)+Fzvk'*(xv0-zvk);
    xik = Fzktxkzk/NormFzk2;
    % compute the next iteration 
    xu1 = xu0-rho*xik*Fzuk;
    xv1 = xv0-rho*xik*Fzvk;
%     xuv1min = min(xu1,xv1);
%     xu1 = xu1-xuv1min;
%     xv1 = xv1-xuv1min;
    x1 = xu1-xv1;
    mses(k) = 1/n*norm(x1-true_x)^2;
    Ax1 = A(x1);
    tempx = AT(Ax1)-Atb;
    Fxu1 = min(xu1,tempx+lambda);
    Fxv1 = min(xv1,-tempx+lambda);
    NF = NF+1;
    NormFxk2 = Fxu1'*Fxu1+Fxv1'*Fxv1;
    Fxtdk = Fxu1'*dku+Fxv1'*dkv;
    NormFxk = sqrt(NormFxk2);
    if NormFxk<=epsilon
        L1 = 1;
        NormF = NormFxk;
        mses(k) = 1/n*norm(x1-true_x)^2;
        Tcpu(k) = cputime-t0;
        break;
    end
    % update the search direction
    yku = Fxu1-Fxu0;
    ykv = Fxv1-Fxv0;
    FxkFxk_old = Fxu1'*Fxu0+Fxv1'*Fxv0;
    NormD = sqrt(dku'*dku + dkv'*dkv);
    switch method
        case 'USDGPM'
            dku = (-1)*Fxu1; 
            dkv = (-1)*Fxv1;
        case 'UT2CGPM'
            Fxtyk = Fxu1'*yku+Fxv1'*ykv;
            Fxtdk = Fxu1'*dku+Fxv1'*dkv;
            betak = Fxtyk/NormFxk2_old;
            lambdak = Fxtdk/NormFxk2_old;
            dku = (-1)*Fxu1+betak*dku-lambdak*yku; 
            dkv = (-1)*Fxv1+betak*dkv-lambdak*ykv;
        case 'IR1'
%             NormFk2 = NormFk^2; %||F_{k}||^2
%             NormFk_old2 = NormFk_old^2; %||F_{k-1}||^2
            citakk = 0.5;%��ʵ�Ǹ����ʽ���˴�Ϊ�����ȸ�ֵ
            miuu = 1.8; %��max����Ħ�,�˴�Ϊ�����ȸ�ֵ
            numerator = NormFxk2 - citakk*(NormFxk/sqrt(NormFxk2_old))*abs(FxkFxk_old);
            denominator = max(miuu*NormFxk*NormD,NormFxk2_old);
            betak = numerator/denominator;
            dku = (-1)*Fxu1+betak*dku;
            dkv = (-1)*Fxv1+betak*dkv;
            
        case 'R5'
            %NormFk2 = NormFk^2; %||F_{k}||^2
            %NormFk_old2 = NormFk_old^2; %||F_{k-1}||^2
            %Fxtdk = Fxu1'*dku+Fxv1'*dkv;
            citakk = 0.5;%��ʵ�Ǹ����ʽ���˴�Ϊ�����ȸ�ֵ
            miuu = 1.8; %��max����Ħ�,�˴�Ϊ�����ȸ�ֵ
            numerator = NormFxk2 - citakk*(NormFxk/NormD)*(Fxtdk);
            denominator = max(max(miuu*NormFxk*NormD,NormFxk2_old),NormD^2);
            betak = numerator/denominator;
            dku = (-1)*Fxu1+betak*dku;
            dkv = (-1)*Fxv1+betak*dkv;
        case 'PDY' %Liu J.K.,Feng Y.M.,(2018)A derivative-free iterative method for nonlinear monotone
            %equations with convex constraints,Numerical Algorithms
            dkyk = dku'*yku+dkv'*ykv;
            tk=1+max(0,-dkyk/NormD^2);
            wku=yku+tk*dku;
            wkv=ykv+tk*dkv;
            dkwk = dku'*wku + dkv'*wkv;
            betak=NormFxk2/(dkwk);
            c=1;
            Fxtdk = Fxu1'*dku+Fxv1'*dkv;
            thetak=c-Fxtdk/(dkwk);
            dku=-thetak*Fxu1+betak*dku;
            dkv=-thetak*Fxv1+betak*dkv;
            
        case 'NPRP'
%             NormFk2 = NormFk^2; %||F_{k}||^2
%             NormFk_old2 = NormFk_old^2; %||F_{k-1}||^2
            citakk = 1;%��ʵ�Ǹ����ʽ���˴�Ϊ�����ȸ�ֵ
%             miuu = 1.5; %��max����Ħ�,�˴�Ϊ�����ȸ�ֵ
            numerator = NormFxk2 - citakk*(NormFxk/sqrt(NormFxk2_old))*abs(FxkFxk_old);
            denominator = NormFxk2_old;
            betak = numerator/denominator;
%             caplk = (Fk'*dk)/denominator;
            dku = (-1)*Fxu1+betak*dku;
            dkv = (-1)*Fxv1+betak*dkv;
        case 'FR'
%             NormFk2 = NormFk^2; %||F_{k}||^2
%             NormFk_old2 = NormFk_old^2; %||F_{k-1}||^2
%             citakk = 0.5;%��ʵ�Ǹ����ʽ���˴�Ϊ�����ȸ�ֵ
%             miuu = 1.5; %��max����Ħ�,�˴�Ϊ�����ȸ�ֵ
            numerator = NormFxk2 ;
            denominator = NormFxk2_old;
            betak = numerator/denominator;
%             caplk = (Fk'*dk)/denominator;
            dku = (-1)*Fxu1+betak*dku;
            dkv = (-1)*Fxv1+betak*dkv;
                    case 'ZW'
               NormFxk2 = Fxu1'*Fxu1+Fxv1'*Fxv1; %||F_{k}||^2
                Fxktdk = Fxu1'*dku+Fxv1'*dkv;
                citakk = 0.5;%��ʵ�Ǹ����ʽ���˴�Ϊ�����ȸ�ֵ
                miuu = 5; %��max����Ħ�,�˴�Ϊ�����ȸ�ֵ
                numerator = NormFxk2 - citakk*(NormFxk/NormFxk_old)*FxkFxk_old;
                denominator = max(miuu*NormFxk*NormD,NormFxk2_old);
                numerator2 = abs(Fxktdk);
                denominator2 = max(miuu*NormFxk*NormD,NormFxk2_old);
                betak = numerator/denominator;
                lkk = numerator2/denominator2;
                dku = -(1+lkk)*Fxu1+betak*dku;
                dkv = -(1+lkk)*Fxv1+betak*dkv;       
    end
    Normdk2 = dku'*dku+dkv'*dkv;
    Normdk = sqrt(Normdk2);
    if Normdk<epsilon1
        L1 = 1;
        NormF = NormFxk;
        mses(k) = 1/n*norm(x1-true_x)^2;
        Tcpu(k) = cputime-t0;
        break;
    end
    % update the iteration
    xu0 = xu1;
    xv0 = xv1;
    NormFxk_old=NormFxk;
    NormFxk2_old = NormFxk2;
    Tcpu(k) = cputime-t0;
end
if L1~=1
    NF = NaN;
    NormF = NaN;
end
