% % quaternion of sensor frame relative to auxiliary frame
q0 = 1.0;
q1 = 0.0;
q2 = 0.0;
q3 = 0.0;
qDot1 = 0.0;
qDot2 = 0.0;
qDot3 = 0.0;
qDot4 = 0.0;
s0 = 0.0;
s1 = 0.0;
s2 = 0.0;
s3 = 0.0;
beta = 0;
sampleTime = 0;

% set the uniform distribution range [a b] over which the q's will be drawn
a1 = 0;
b1 = 1;
% Q dot
a2 = -53;
b2 = 35;
% s0 -> s3
a3 = -244769;
b3 = 5961299;
% beta
a4 = 0;
b4 = 255;


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
    qDot1 = a2 + (b2-a2).*rand(1,1);
    qDot2 = a2 + (b2-a2).*rand(1,1);
    qDot3 = a2 + (b2-a2).*rand(1,1);
    qDot4 = a2 + (b2-a2).*rand(1,1);
	
	%-------------------------------------------------
    % Create random input values that span [a3 b3]
    %-------------------------------------------------
    s0 = a3 + (b3-a3).*rand(1,1);
    s1 = a3 + (b3-a3).*rand(1,1);
    s2 = a3 + (b3-a3).*rand(1,1);
    s3 = a3 + (b3-a3).*rand(1,1);
	%-------------------------------------------------
    % Create random input values that span [a4 b4]
    %-------------------------------------------------
    beta = a4 + (b4-a4).*rand(1,1);
	
	%-------------------------------------------------
    % Create random input values that span [a5 b5]
    %-------------------------------------------------
    sampleTime = 0.001;
    %-------------------------------------------------
    % Drive the function with the random input values 
    %-------------------------------------------------	
    [q0, q1, q2, q3] = Madgwick_update(q0, q1, q2, q3, qDot1, qDot2, qDot3, qDot4, s0, s1, s2, s3, beta, sampleTime);
    
end