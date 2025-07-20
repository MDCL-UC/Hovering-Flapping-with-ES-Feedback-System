clc; clear; tic;
lb = [5e-5 4e-5 1e-5];
ub = [5e-1 4e-1 1e-1];

nvars = 3;
opts  = optimoptions('ga','Display','iter');   % or 'off'

[Gains,fval] = ga(@Airplanesim,nvars,[],[],[],[],lb,ub,[],opts);
Err = Airplanesim(Gains);
fprintf('Best gains      : %.4g  %.4g  %.4g\n',Gains);
fprintf('Objective value : %.4g\n',fval);
fprintf('t = %.2f min\n',toc/60);
disp('done');
