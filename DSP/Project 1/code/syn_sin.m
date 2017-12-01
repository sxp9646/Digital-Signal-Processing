function [xx,tt] = syn_sin(fk, Xk, fs, dur, tstart)
% SYN_SIN Function to synthesize a sum of cosine waves
% usafe:
% [xx,tt] = syn_sin(fk, Xk, fs, dur, tstart)
% fk = vector of frequencies
% (these could be negative or positive)
% Xk = vector of complex amplitudes: Amp*e^(j*phase)
% fs = the number of samples per second for the time axis
% dur = total time duration of the signal
% tstart = starting time (default is zero, if you make this input optional)
% xx = vector of sinusiodal values
% tt = vector of times, for the time axis
% 
% Note: fk and Xk must be the same length
% Xk(1) corresponds to frequency fk(1),
% Xk(2) corresponds to frequency fk(2), etc.
tt = 0:(1/fs):dur;
xx = zeros(1,sum(dur)*fs+length(Xk));
if(length(fk) ~= length(Xk))
    error('The length of fk must be the same as Xk');
else
   for i = 1:length(fk)
       for m = 1:length(tt)
            xx(m) = real(Xk(i) * exp(j*2*pi*fk(i)*tt(m)));
       end
   end
end
