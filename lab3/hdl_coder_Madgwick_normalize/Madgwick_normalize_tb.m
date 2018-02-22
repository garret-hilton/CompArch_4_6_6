% % quaternion of sensor frame relative to auxiliary frame
ax = 1.0;
ay = 0.0;
az = 0.0;
a0 = 0.0;

% set the uniform distribution range [a b] over which the a's will be drawn
a1 = -250; % note units of g-force
b1 = 250;  % note units of g-force

N=1000;
for i=1:N
   
    %-------------------------------------------------
    % Create random input values that span [a1 b1]
    %-------------------------------------------------
    ax = a1 + (b1-a1).*rand(1,1);
    ay = a1 + (b1-a1).*rand(1,1);
    az = a1 + (b1-a1).*rand(1,1);
    a0 = a1 + (b1-a1).*rand(1,1);
    
    %-------------------------------------------------
    % Drive the function with the random input values
    %-------------------------------------------------
    [ax, ay, az, a0] = Madgwick_normalize(ax, ay, az, a0)
	

   
end

for i=1:N
   
    %-------------------------------------------------
    % Create random input values that span [a1 b1]
    %-------------------------------------------------
    ax = a1 + (b1-a1).*rand(1,1);
    ay = a1 + (b1-a1).*rand(1,1);
    az = a1 + (b1-a1).*rand(1,1);
    a0 = 0;
    
    %-------------------------------------------------
    % Drive the function with the random input values
    %-------------------------------------------------
    [ax, ay, az, a0] = Madgwick_normalize(ax, ay, az, a0)
	

    
end