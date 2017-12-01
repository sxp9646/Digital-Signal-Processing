function xx = envelope(yy)
% Envelope takes in a signal and applies and envelope to the 
% given signal 
% 
% usage: xx = envelope(yy)
% 
% xx = the output sinusoidal waveform
% yy = the signal to be multiplied 
%
length_of_input = length(yy);
xx = zeros(1,length_of_input);
A = linspace(0,100,round((2*length_of_input)/10));   % Attack
D = linspace(100,80,round((0.5*length_of_input)/10));  % Delay
S = linspace(80,75,round((4.5*length_of_input)/10));     % Sustain
R = linspace(75,0,round((3*length_of_input)/10));      % Release

% Combine all parts
count = 1;
for vloop = 1:round((2*length_of_input)/10) 
    xx(count) = A(vloop);  
    count = count + 1;
end

count = round((2*length_of_input)/10);
for vloop = 1:round((0.5*length_of_input)/10)  
    xx(count) = D(vloop); 
    count = count + 1;
end

count = round((2.5*length_of_input)/10);
for vloop = 1:round((4.5*length_of_input)/10)   
    xx(count) = S(vloop); 
    count = count + 1;
end

count = round((7*length_of_input)/10);
for vloop = 1:round((3*length_of_input)/10) 
    xx(count) = R(vloop);  
    count = count + 1;
end
xx = xx.*yy;
