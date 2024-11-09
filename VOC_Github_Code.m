%Calculating the Lie brackets between the vectors X Z Y by using the VOC formula 

clear all
clc

%define the system states 
syms w phi_dot g kL kd1 kd2 kd3 IF phi z omega U tau_hat k

%doing smoothing for abs(phi_dot)
epsilon = 50;
abs_phi_dot=phi_dot * (2/pi)*atan(epsilon*phi_dot);

%define the Z vector (based on your states)
Z=[w; 
   g- kL * phi_dot^2 - kd1*w*abs_phi_dot ;
   -kd3*w*phi_dot - kd2*phi_dot * abs_phi_dot + tau_hat ;
   0]

%define the Y vector (define J based on the used objective funciton)
Y=[0 ; 0 ; 1; J*k]

%define the X vector 
X=[z ; w ; phi_dot ; tau_hat]

p_Z_X=jacobian(Z,X)
p_Y_x=jacobian(Y,X)
LB=p_Z_X*Y - p_Y_x*Z
P_LB_X=jacobian(LB,X)
LB2=P_LB_X*Y  - p_Y_x*LB
f_avg= Z + ((U^2)/(4*omega^2))*LB2
J_subs=subs(J_f_avg ,[w, phi_dot, tau_hat, kd1, kL, kd2, kd3 ,U , omega ,g,k] ,[])% put here your equallibroum values

eign_values=eig(J_subs) %compute the eignvalues here for the resulted matrix 