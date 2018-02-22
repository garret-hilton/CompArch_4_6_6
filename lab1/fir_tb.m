function fir_tb

%------------------------------------------------------------
% Note: it appears that the cosimWizard needs to be re-run if
% this is moved to a different machine (VHDL needs to be
% recompile in ModelSim).
%------------------------------------------------------------

% HdlCosimulation System Object creation (this Matlab function was created
% by the cosimWizard).
%fir_hdl = hdlcosim_fir;
fir_hdl = hdlcosim_rca_eight_bit;

% Simulate for Nclock rising edges (this will be the length of the
% simulation)
Nclock_edges = 9;
SumOut = fi(0,0, 8, 0);
Cout = fi(0,0,1,0);
MatlabSum = fi(0,0,9,0);


for clki=1:Nclock_edges
    
    if clki == 1
        a = 1;
        b = 1;
        sub = 0;
    end
    if clki == 2
        a = 1;
        b = -8;
        sub = 0;
    end
    if clki == 3
        a = -12;
        b = 2;
        sub = 0;
    end
    if clki == 4
        a = -10;
        b = -10;
        sub = 0;
    end
    if clki == 5
        a = 3;
        b = 5;
        sub = 1;
    end
    if clki == 6
        a = 1;
        b = -1;
        sub = 1;
    end
    if clki == 7
        a = -1;
        b = 1;
        sub = 1;
    end
    if clki == 8
        a = -10;
        b = -5;
        sub = 1;
    end
    %-----------------------------------------------------------------
    % Create our input vector at each clock edge, which must be a
    % fixed-point data type.  The word width of the fixed point data type
    % must match the width of the std_logic_vector input.
    %-----------------------------------------------------------------
    fixed_word_width     = 16;  % width of input to component
    %fixed_point_value    = a;     % choose a random input values over an appropriate range
    fixed_point_signed   = 0;  % unsiged = 0, signed = 1;
    fixed_point_fraction = 0;  % fraction width (location of binary point within word)
    input_vector1 = fi(a, 1, 8, 0); % make the input a fixed point data type
    input_vector2 = fi(b, 1, 8, 0);
    input_vector3 = fi(sub, 0, 1, 0);
    input_historyA{clki} = input_vector1;  % capture the inputs A
    input_historyB{clki} = input_vector2;  % capture the inputs B
    input_historySum{clki} = input_vector3;  % capture the inputs Sum
    if sub == 0
        MatlabSum = input_vector1 + input_vector2;
    end
    if sub == 1
        MatlabSum = input_vector1 - input_vector2;
    end 
    %-----------------------------------------------------------------
    % Push the input(s) into the component using the step function on the
    % system object fir_hdl
    % If there are multiple I/O, use
    % [out1, out2, out3] = step(fir_hdl, in1, in2, in3);
    % and understand all I/O data types are fixed-point objects
    % where the inputs can be created by the fi() function.
    %-----------------------------------------------------------------
    [Cout, SumOut] = step(fir_hdl,input_vector1, input_vector2, input_vector3);  % Drive Model Sim
    
    %-----------------------------------------------------------------
    % Save the outputs (which are fixed-point objects)
    %-----------------------------------------------------------------
    output_historySum{clki} = SumOut;  % capture the output
    output_historyCout{clki} = Cout;  % capture the output
    matlab_history{clki} = MatlabSum; % capture the matlab calculated value
end
for clki=1:8
   display = 0;
   if display == 1
       Mlab = matlab_history{clki}
       output_historySum{clki}
   end
   if matlab_history{clki} == output_historySum{clki}
       disp('Input Sum')
       disp(clki)
       disp(' Correct')
   end
   matLab_Cout{clki} = bitget(matlab_history{clki}, 9);
   if matLab_Cout{clki} == output_historyCout{clki}
      disp('Cout is the same') 
      disp(matLab_Cout{clki})
   end
   if matLab_Cout{clki} ~= output_historyCout{clki}
      disp('Cout is not the same') 
      disp(matLab_Cout{clki})
   end
end


%-----------------------------------------------------------------
% Display the captured I/O
%-----------------------------------------------------------------
% display_this = 0;
% if display_this == 1
%     for clki=1:Nclock_edges
%         in1 = input_history{clki};
%         in1.bin
%         out1 = output_history{clki}
%         out1.dec
%         out1.WordLength
%     end
% end
%-----------------------------------------------------------------
% Perform the desired comparison (with the latency between input
% and output appropriately corrected).
%-----------------------------------------------------------------
% latency     = 5;  % latency in clock cycles through the component
% error_index = 1;
% error_case  = [];
% for clki=1:Nclock_edges-latency
%     %in1  = input_history{clki};
%     %out1 = output_history{clki+latency};  % get the output associated with current output
%     %------------------------------------------------------
%     % Perfom the comparison with the "true" output
%     %------------------------------------------------------
%     if sum == 1
%        Calc 
%     else
%         
%     end
%     
%     
% end
% 
% 
% 
% 
% 
% end
