% Matlab Model by Jianghua Yin (July,2021, Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
%
%% the derivative-free projection method (DFPM) for solving the 
%% unconstrained nonlinear monotone equations of the form
%   F(x)=0. 
%
function [x1,mses,Tcpu,NF,NormF] = Copy_2_of_DFPM(A,b,lambda,true_x,method,model,para,Switch) 

format long

% if A is a matrix, we find out dimensions of y and x,
% and create function handles for multiplication by A and A',
% so that the code below doesn't have to distinguish between
% the handle/not-handle cases
if ~isa(A, 'function_handle')
  AT = @(x) (x'*A)'; %A'*x;
  A = @(x) A*x;
end
% from this point down, A and AT are always function handles.

% Precompute A'*b since it'll be used a lot
Atb = AT(b);    
x0 = Atb;
n = length(x0);

% initial point
xu0 =  x0.*(x0 >= 0);
xv0 = -x0.*(x0 <  0);
% from these two relations, x0 = u0-v0;

%% the stopping criterion
epsilon = 1e-6;
% epsilon1 = 1e-7;


%% the line search parameters and relaxation factor
k_max = para.Itr_max;   % the maximum number of iterations
gamma = para.gamma;     % the initial guess
sigma = para.sigma;     % the coefficient of line search 
tau = para.tau;         % the compression ratio
rho = para.rho;         % the relaxation factor 

fprintf('%s & LSmodel=%d & gamma=%.4f & sigma=%.4f & tau=%.4f & Switch=%.4f & rho=%.4f\n', ... 
    method,model,gamma,sigma,tau,Switch,rho);


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
NormFxk2 = Fxu0'*Fxu0+Fxv0'*Fxv0;    
NormFxk = sqrt(NormFxk2);
xu0_old = xu0;
xv0_old = xv0;
L1 = 0;
     
for k=1:k_max
    if k==1 && NormFxk<=epsilon
        L1 = 1;
        NormF = NormFxk; % the final norm of equations
        mses(k) = 1/n*norm(x0-true_x)^2;
        Tcpu(k) = cputime-t0;
        break; 
    end
    xuk=xu0-xu0_old;
    xvk=xv0-xv0_old;
    Normxk2=xuk'*xuk+xvk'*xvk;%||x0-x0_old||^2
    Normxk = sqrt(Normxk2);%||x0-x0_old||
    
   if Switch==1
       alpha=min(0.1,1/((k^2)* Normxk));
   elseif Switch==2
       alpha =(-1)*min(0.1,1/((k^2)* Normxk));
   elseif Switch==3
       alpha =(-1)^k*min(0.1,1/((k^2)* Normxk));
   else
       alpha= 0.1;
   end

    %% compute the inertial step %%
    yuk1 = xu0+alpha*xuk;  % compute the trial point
    yvk1 = xv0+alpha*xvk;  % compute the trial point
    yk1 = yuk1-yvk1;
    Ayk = A(yk1);
    tempy = AT(Ayk)-Atb;
    Fyuk = min(yuk1,tempy+lambda);
    Fyvk = min(yvk1,-tempy+lambda);
    NF = NF+1;
    NormFyk2 = Fyuk'*Fyuk+Fyvk'*Fyvk;%||F_{k}||^2
    NormFyk = sqrt(NormFyk2);%||F_{k}||
    Fluk=yuk1-xu0;
    Flvk=yvk1-xv0;
    NormFlk2= Fluk'*Fluk+Flvk'*Flvk;
    NormFlk = sqrt(NormFlk2);
    b=sign(abs(alpha-max(-1,min(0,alpha))));
    if NormFyk<=epsilon && b*NormFlk<=epsilon
        L1 = 1;
        NormF = NormFyk;   % the final norm of equations
        mses(k) = 1/n*norm(yk1-true_x)^2;
        Tcpu(k) = cputime-t0;
        break; 
    end
    if NormFyk<=epsilon && b*NormFlk>epsilon
        yuk = xu0;
        yvk = xv0;     
        Fyuk = Fxu0;
        Fyvk = Fxv0;
    end
     if NormFyk>epsilon
         yuk = yuk1;
         yvk = yvk1;
     end
     
    
    %% compute the initial direction %%
    if k==1
        dku = -Fyuk;
        dkv = -Fyvk;
    else
        % update the search direction
        FykFyk_old = Fyuk'*Fyuk_old+Fyvk'*Fyvk_old;
        NormD = sqrt(dku'*dku + dkv'*dkv);
        switch method
            case 'ZW'
                NormFyk2 = Fyuk'*Fyuk+Fyvk'*Fyvk; %||F_{k}||^2
                Fyktdk = Fyuk'*dku+Fyvk'*dkv;
                citakk = 0.5;%其实是个表达式，此处为方便先赋值
                miuu = 5; %是max里面的μ,此处为方便先赋值
                numerator = NormFyk2 - citakk*(NormFyk/NormFyk_old)*FykFyk_old;
                denominator = max(miuu*NormFyk*NormD,NormFyk2_old);
                numerator2 = abs(Fyktdk);
                betak = numerator/denominator;
                lkk = numerator2/denominator;
                dku = -(1+lkk)*Fyuk+betak*dku;
                dkv = -(1+lkk)*Fyvk+betak*dkv;        
        end
    end
    Normdk2 = dku'*dku+dkv'*dkv;
    
    %%% Start Armijo-type line search  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % model=1 means -F(zk)'*dk ≥ sigma*tk*norm(dk)^2
    % model=2 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))*norm(dk)^2
    % model=3 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))/(1+norm(F(zk)))*norm(dk)^2
    % model=4 means -F(zk)'*dk ≥ sigma*tk*min(nu,norm(Fz_new,2))*norm(dk)^2
    if model==1
        t = gamma;
        zuk_new = yuk+t*dku;
        zvk_new = yvk+t*dkv;
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
            zuk_new = yuk+t*dku;
            zvk_new = yvk+t*dkv;
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
        zuk_new = yuk+t*dku;
        zvk_new = yvk+t*dkv;
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
        while -Fzk_newtdk < sigma*t*NormFzk_new*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            zuk_new = yuk+t*dku;
            zvk_new = yvk+t*dkv;
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
    elseif model==3
        t = gamma;
        zuk_new = yuk+t*dku;
        zvk_new = yvk+t*dkv;
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
        while -Fzk_newtdk < sigma*t*NormFzk_new/(1+NormFzk_new)*Normdk2 && t>10^-6  
            % the Armijo-type line search condition violated
            t = t*tau;
            zuk_new = yuk+t*dku;
            zvk_new = yvk+t*dkv;
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
        elseif model==4
        nu = 0.8;
        t = gamma;
        zuk_new = yuk+t*dku;
        zvk_new = yvk+t*dkv;
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
            zuk_new = yuk+t*dku;
            zvk_new = yvk+t*dkv;
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
    end
    zuk = zuk_new;
    zvk = zvk_new;
    zk = zk_new;
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
    Fzktykzk = Fzuk'*(yuk-zuk)+Fzvk'*(yvk-zvk);
    xik = Fzktykzk/NormFzk2;
    % compute the next iteration 
    xu1 = yuk-rho*xik*Fzuk;
    xv1 = yvk-rho*xik*Fzvk;
%     xuv1min = min(xu1,xv1);
%     xu1 = xu1-xuv1min;
%     xv1 = xv1-xuv1min;
    x1 = xu1-xv1;
    mses(k) = 1/n*norm(x1-true_x)^2;
    Ax1 = A(x1);
    tempx = AT(Ax1)-Atb;
    Fxu = min(xu1,tempx+lambda);
    Fxv = min(xv1,-tempx+lambda);
    NF = NF+1;
    NormFx2 = Fxu'*Fxu+Fxv'*Fxv;
    NormFx = sqrt(NormFx2);
    if NormFx<=epsilon
        L1 = 1;
        NormF = NormFx;
%         mses(k) = 1/n*norm(x1-true_x)^2;
        Tcpu(k) = cputime-t0;
        break;
    end
    
    % update the iteration
    xu0_old = xu0;
    xv0_old = xv0;
    xu0 = xu1;
    xv0 = xv1;
    Fyuk_old = Fyuk;
    Fyvk_old = Fyvk;
    NormFyk_old = NormFyk;
    NormFyk2_old = NormFyk2;
    Tcpu(k) = cputime-t0;
end
if L1~=1
    NF = NaN;
    NormF = NaN;
end
