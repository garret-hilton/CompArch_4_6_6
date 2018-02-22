% % quaternion of sensor frame relative to auxiliary frame
q0 = 1.0;
q1 = 0.0;
q2 = 0.0;
q3 = 0.0;
ax = 0.0;
ay = 0.0;
az = 0.0;
mx = 0.0;
my = 0.0;
mz = 0.0;


% set the uniform distribution range [a b] over which the q's will be drawn
a1 = 0;
b1 = 1;
% set the uniform distribution range [a b] over which the g's will be drawn
% accelerometer
a2 = -250;
b2 = 250;
% magnetometer 
a3 = 0;
b3 = 360;

N=1000;
for i=1:N
   
    %-------------------------------------------------
    % Create random input values that span [a1 b1]
    %-------------------------------------------------
    q0 = a1 + (b1-a1).*rand(1,1);
    q1 = a1 + (b1-a1).*rand(1,1);
    q2 = a1 + (b1-a1).*rand(1,1);
    q3 = a1 + (b1-a1).*rand(1,1);
    
	%-------------------------------------------------
    % Create random input values that span [a2 b2]
    %-------------------------------------------------
    ax = a2 + (b2-a2).*rand(1,1);
    ay = a2 + (b2-a2).*rand(1,1);
    az = a2 + (b2-a2).*rand(1,1);
	
	%-------------------------------------------------
    % Create random input values that span [a3 b3]
    %-------------------------------------------------
    mx = a3 + (b3-a3).*rand(1,1);
    my = a3 + (b3-a3).*rand(1,1);
    mz = a3 + (b3-a3).*rand(1,1);
	
    %-------------------------------------------------
    % Drive the function with the random input values 
    %-------------------------------------------------	
    [s0, s1, s2, s3] = Madgwick_correction(q0, q1, q2, q3, ax, ay, az, mx, my, mz);
    
end