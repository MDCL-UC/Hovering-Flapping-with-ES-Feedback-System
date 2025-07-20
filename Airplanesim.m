function Err = Airplanesim(x)
    % Unpack gains
    k_p  = x(1);
    k_i =  x(2);
    k_d =  x(3);
   try
    options = simset('SrcWorkspace','current');
    sim('PID.slx',10,options)
    Err_z=sum((abs(0.1-ans.z)).^2);
    % Err_phi=sum((abs(ans.phi_dot)).^2);
    Err=sqrt(Err_z^2)
   
    catch
       Err=inf;
    end
end

 