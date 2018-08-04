function bank = xplaneconnect_aileron_control(aileron_in)
    % retain socket connection across method calls
    % see https://blogs.mathworks.com/simulink/2014/01/08/simulink-and-matlab-objects/
    persistent Socket;
    
    if isempty(Socket)
       Socket = XPlaneConnect.openUDP();
    end
    
    no_change = -998;
    XPlaneConnect.sendCTRL([no_change, aileron_in, no_change, no_change, no_change, no_change], 0, Socket);
    
    posi = XPlaneConnect.getPOSI(0, Socket);
    bank = posi(5);
end

