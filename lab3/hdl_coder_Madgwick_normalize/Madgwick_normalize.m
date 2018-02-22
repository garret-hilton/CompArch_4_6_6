function [ax, ay, az, a0] = Madgwick_normalize(ax, ay, az, a0)
% Normalize accelerometer measurement
 if a0 == 0
  a_dotproduct = ax * ax + ay * ay + az * az;
  recipNorm = invSqrt(a_dotproduct);
  if a_dotproduct ~= 0
       ax = ax * recipNorm;
       ay = ay * recipNorm;
       az = az * recipNorm;
	   a0 = 0
   end
 else
     recipNorm = invSqrt(ax * ax + ay * ay + az * az + a0 * a0); 
     ax = ax * recipNorm;
     ay = ay * recipNorm;
     az = az * recipNorm;
     a0 = a0 * recipNorm;
 end
