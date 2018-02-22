%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%           Generated by MATLAB 9.3 and Fixed-Point Designer 6.0           %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%#codegen
function [ax, ay, az, a0] = Madgwick_normalize_fixpt(ax_1, ay_1, az_1, a0_1)
% Normalize accelerometer measurement
 fm = get_fimath();
 a0 = fi(a0_1, 1, 14, 5, fm);
 ax = fi(ax_1, 1, 14, 5, fm);
 ay = fi(ay_1, 1, 14, 5, fm);
 az = fi(az_1, 1, 14, 5, fm);

 if a0 == fi(0, 0, 1, 0, fm)
  a_dotproduct = fi(ax * ax + ay * ay + az * az, 0, 14, -4, fm);
  recipNorm = fi(invSqrt(a_dotproduct), 0, 14, 18, fm);
  if a_dotproduct ~= fi(0, 0, 1, 0, fm)
       ax = fi(ax * recipNorm, 1, 14, 5, fm);
       ay = fi(ay * recipNorm, 1, 14, 5, fm);
       az = fi(az * recipNorm, 1, 14, 5, fm);
	   a0 = fi(0, 1, 14, 5, fm)
   end
 else
     recipNorm = fi(invSqrt(ax * ax + ay * ay + az * az + a0 * a0), 0, 14, 18, fm); 
     ax = fi(ax * recipNorm, 1, 14, 5, fm);
     ay = fi(ay * recipNorm, 1, 14, 5, fm);
     az = fi(az * recipNorm, 1, 14, 5, fm);
     a0 = fi(a0 * recipNorm, 1, 14, 5, fm);
 end
end

function [x] = invSqrt(y)

fm = get_fimath();

x = fi(fi_div(fi(1, 0, 1, 0, fm), (sqrt(y))), 0, 14, 18, fm);
end



function ntype = divideType(a,b)
    coder.inline( 'always' );
    nt1 = numerictype( a );
    nt2 = numerictype( b );
    maxFL = max( [ min( nt1.WordLength, nt1.FractionLength ), min( nt2.WordLength, nt2.FractionLength ) ] );
    FL = max( maxFL, 24 );
    extraBits = (FL - maxFL);
    WL = nt1.WordLength + nt2.WordLength;
    WL = min( WL, 124 );
    if (WL + extraBits)<64
        ntype = numerictype( nt1.Signed || nt2.Signed, WL + extraBits, FL );
    else
        ntype = numerictype( nt1.Signed || nt2.Signed, WL, FL );
    end
end


function c = fi_div(a,b)
    coder.inline( 'always' );
    if isfi( a ) && isfi( b ) && isscalar( b )
        a1 = fi( a, 'RoundMode', 'fix' );
        b1 = fi( b, 'RoundMode', 'fix' );
        c1 = divide( divideType( a1, b1 ), a1, b1 );
        c = fi( c1, numerictype( c1 ), fimath( a ) );
    else
        c = a/b;
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