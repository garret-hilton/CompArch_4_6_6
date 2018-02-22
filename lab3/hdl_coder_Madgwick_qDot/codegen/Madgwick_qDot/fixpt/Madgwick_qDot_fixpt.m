%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%           Generated by MATLAB 9.1 and Fixed-Point Designer 5.3           %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%#codegen
function [qDot1, qDot2, qDot3, qDot4] = Madgwick_qDot_fixpt(q0, q1, q2, q3, gx, gy, gz)
% Rate of change of quaternion from gyroscope
fm = get_fimath();

qDot1 = fi(fi(0.5, 0, 14, 14, fm) * (fi_signed(fi_signed(fi_uminus(q1) * gx) - q2 * gy) - q3 * gz), 1, 14, 8, fm);
qDot2 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gx + q2 * gz) - q3 * gy), 1, 14, 7, fm);
qDot3 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gy) - q1 * gz + q3 * gx), 1, 14, 7, fm);
qDot4 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gz + q1 * gy) - q2 * gx), 1, 14, 7, fm);
end



function y = fi_signed(a)
    coder.inline( 'always' );
    if isfi( a ) && ~(issigned( a ))
        nt = numerictype( a );
        new_nt = numerictype( 1, nt.WordLength + 1, nt.FractionLength );
        y = fi( a, new_nt, fimath( a ) );
    else
        y = a;
    end
end


function y = fi_uminus(a)
    coder.inline( 'always' );
    if isfi( a )
        nt = numerictype( a );
        new_nt = numerictype( 1, nt.WordLength + 1, nt.FractionLength );
        y = -fi( a, new_nt, fimath( a ) );
    else
        y = -a;
    end
end

function fm = get_fimath()
	fm = fimath('RoundingMethod', 'Floor',...
	     'OverflowAction', 'Wrap',...
	     'ProductMode','FullPrecision',...
	     'MaxProductWordLength', 128,...
	     'SumMode','FullPrecision',...
	     'MaxSumWordLength', 128);
end
