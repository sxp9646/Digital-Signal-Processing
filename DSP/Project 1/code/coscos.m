function [xx,tt] = coscos(f1, f2, fs, dur)
% COSCOS multiply two sinusoids
%
t1 = 0:(1/fs):dur;
t2 = 0:(1/f2):dur;
cos1 = cos(2*pi*f1*t1);
cos2 = cos(2*pi*f2*t2);
if(length(cos1) ~= length(cos2))
    error('f2 and fs must be equal');
else
    xx = cos1 .* cos2;
    tt = t1;
end