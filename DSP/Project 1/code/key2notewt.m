function xx = key2notewt(X, keynum, dur)
% KEY2NOTEWT Produce a sinusoidal waveform corresponding to a
% given piano key number in the well-tempered tuning
% 
% usage: xx = key2notewt(X, keynum, dur)
% 
% xx = the output sinusoidal waveform
% X = complex amplitude for the sinusoid, X = A*exp(j*phi).
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note
% 
fs = 11025; 
tt = 0:(1/fs):dur;
freq = 440*2^((keynum-49)/12);

% Adding in harmonics
xx =real((X*3*exp(j*2*pi*freq*tt)) + (X*5*exp(j*2*pi*freq*tt*2)) ...
    + (X*5*exp(j*2*pi*freq*tt*3)) + (X/2*exp(j*2*pi*freq*tt*4)) + ...
    (X/6*exp(j*2*pi*freq*tt*5)) + (X/6*exp(j*2*pi*freq*tt*6)) + ...
    (X/8*exp(j*2*pi*freq*tt*7)) + (X/8*exp(j*2*pi*freq*tt*8)));