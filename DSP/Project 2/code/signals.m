function signals(choice)
% Contaminates a signal with different types of noise and then play the
% output through the speakers
%
% usage: signals(choice)
% 
% choice = which type of noise to contaminate with (0 for no noise
%          1 for gaussian, 2 for poisson, 3 for salt and pepper, and
%          4 for speckle
% 

if (nargin == 0)
    choice = 0;
end
[x,fs] = audioread('wave1.wav');          % uncomment for wave1
% [x,fs] = audioread('pink_noise.wav');     % uncomment for pink_noise
% [x,fs] = audioread('white_noise.wav');    % uncomment for white_noise

a = x;
if (choice == 1)
    a = imnoise(2*(mat2gray(x)-0.5),'gaussian');
elseif (choice == 2)
    a = imnoise(2*(mat2gray(x)-0.5),'poisson');
elseif (choice == 3)
    a = imnoise(2*(mat2gray(x)-0.5),'salt & pepper');
elseif (choice == 4)
    a = imnoise(2*(mat2gray(x)-0.5),'speckle');
end
soundsc(a);
% tt = (1/fs)*(1:length(a));
% plot(tt,a)
% xlabel('time[sec]');
% ylabel('x(t)');
% title('Waveform of Pink Noise');
% pwelch(a);