function xx = key2notejt(X, keynum, dur)
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
newnum = 0;
modnum = 0;
i = 1;
ratio = 0;
fs = 11025; 
tt = 0:(1/fs):dur;
newnum = keynum - 40;
if(newnum >= 0)
    modnum = mod(newnum,12);
    while(newnum >= 12)
        modnum = mod(newnum,12);
        newnum = newnum - 12;
        i = i + 1;
    end
    
    switch modnum
    case 0
        ratio = 1;
    case 1
        ratio = (25/24);
    case 2
        ratio = (9/8);
    case 3
        ratio = (6/5);
    case 4
        ratio = (5/4);
    case 5
        ratio = (4/3);
    case 6
        ratio = (45/32);
    case 7
        ratio = (3/2);
    case 8
        ratio = (25/16);
    case 9
        ratio = (5/3);
    case 10
        ratio = (9/5);
    case 11
        ratio = (15/8);
    case 12
        ratio = 2;
    end

    freq = 261.63*ratio*i;
    xx =real((X*3*exp(j*2*pi*freq*tt)) + (X*5*exp(j*2*pi*freq*tt*2)) ...
    + (X*5*exp(j*2*pi*freq*tt*3)) + (X/2*exp(j*2*pi*freq*tt*4)) + ...
    (X/6*exp(j*2*pi*freq*tt*5)) + (X/6*exp(j*2*pi*freq*tt*6)) + ...
    (X/8*exp(j*2*pi*freq*tt*7)) + (X/8*exp(j*2*pi*freq*tt*8)));
else
    i = 2;
    modnum = mod(abs(newnum),12);
    while(abs(newnum) >= 12)
    modnum = mod(abs(newnum),12);
    newnum = abs(newnum) - 12;
    i = i + 1;
    end
    
    switch modnum
    case 0
        ratio = 2;
    case 1
        ratio = (15/8);
    case 2
        ratio = (9/5);
    case 3
        ratio = (5/3);
    case 4
        ratio = (25/16);
    case 5
        ratio = (3/2);
    case 6
        ratio = (45/32);
    case 7
        ratio = (4/3);
    case 8
        ratio = (5/4);
    case 9
        ratio = (6/5);
    case 10
        ratio = (9/8);
    case 11
        ratio = (25/24);
    case 12
        ratio = 1;
    end
    
    freq = 261.63*ratio*(1/i);
    xx =real((X*3*exp(j*2*pi*freq*tt)) + (X*5*exp(j*2*pi*freq*tt*2)) ...
    + (X*5*exp(j*2*pi*freq*tt*3)) + (X/2*exp(j*2*pi*freq*tt*4)) + ...
    (X/6*exp(j*2*pi*freq*tt*5)) + (X/6*exp(j*2*pi*freq*tt*6)) + ...
    (X/8*exp(j*2*pi*freq*tt*7)) + (X/8*exp(j*2*pi*freq*tt*8)));
end
