function project2_filtering(choice, wave1)
% Filter out the noise in a signal and play the output through
% the speakers
%
% usage: project2_filtering(choice, wave1)
% 
% choice = which signal to play depending if wave1 is selected 
%          (0-3 correspond to nsp0-nsp3 if 1 argument is detected,
%           1-2 correspond to high or low filter of wave1 if 2 arguments
%           are detected)
% wave1 = decides if wave1 is selected (0 for no, 1 for yes)
% 

if (nargin == 0)
    choice = 1;
    wave1 = 1;
elseif (nargin == 1)
    wave1 = 0;
end
        
%% wave1
if (wave1 == 1)
    [x,fs] = audioread('wave1.wav');
    if (choice == 1)
        wave1highcoef = load('HighFilterWave1.mat');
        wave1high = wave1highcoef.Num;
        wave1filteredhigh = filter(wave1high,1,x);
        soundsc(wave1filteredhigh,fs);
    else
        wave1lowcoef = load('LowFilterWave1.mat');
        wave1low = wave1lowcoef.Num;
        wave1filteredlow = filter(wave1low,1,x);
        soundsc(wave1filteredlow,fs);  
    end
end
% wave1filtered = wave1filteredhigh + wave1filteredlow;
% soundsc(wave1filtered, fs);
% normal_wav = wave1filteredhigh/max(abs(wave1filteredhigh));
% audiowrite('wave1_high.wav', normal_wav, fs);
% [Pxx1 F1] = pwelch(x);
% Pxx1dB = 10*log10(Pxx1);
% plot(F1/pi,Pxx1dB,'-r')
% hold on
% [Pxx2 F2] = pwelch(wave1filteredlow);
% Pxx2dB = 10*log10(Pxx2);
% plot(F2/pi,Pxx2dB,'-b')
% axis([0 1 min(Pxx2dB) max(Pxx2dB)])
% hold off
% grid on
% legend('unfiltered', 'filtered','location','northeast');
% xlabel('Normalized Frequency (x pi rad/sample)');
% ylabel('Power/frequency (dB/rad/sample)');
% title('Spectrum of wave1 before/after low pass');
% freqz(wave1filteredlow);
% soundsc(x,fs);


%% nsp0
if (wave1 == 0)
    if (choice == 0)
        [x,fs] = audioread('nsp0.wav');
        nsp0coef = load('nsp0');
        nsp0 = nsp0coef.Num;
        nsp0filtered = filter(nsp0,1,x);
        soundsc(nsp0filtered, fs*1.1);
    end
end
% freqz(nsp0);
% normal_nsp0 = nsp0filtered/max(abs(nsp0filtered));
% audiowrite('fsp0.wav', normal_nsp0, fs*1.1);
% [Pxx1 F1] = pwelch(x);
% Pxx1dB = 10*log10(Pxx1);
% plot(F1/pi,Pxx1dB,'-r')
% hold on
% [Pxx2 F2] = pwelch(nsp0filtered);
% Pxx2dB = 10*log10(Pxx2);
% plot(F2/pi,Pxx2dB,'-b')
% axis([0 1 min(Pxx2dB) max(Pxx2dB)])
% hold off
% grid on
% legend('unfiltered', 'filtered','location','northeast');
% xlabel('Normalized Frequency (x pi rad/sample)');
% ylabel('Power/frequency (dB/rad/sample)');
% title('Spectrum of nsp0 before/after filtering');
% soundsc(x,fs);

%% nsp1
if (wave1 == 0)
    if (choice == 1)
        [x,fs] = audioread('nsp1.wav');
        nsp1coef = load('nsp1');
        nsp1 = nsp1coef.Num;
        nsp1filtered = filter(nsp1,1,x);
        soundsc(nsp1filtered, fs*2);
    end
end
% freqz(nsp1filtered);
% normal_nsp1 = nsp1filtered/max(abs(nsp1filtered));
% audiowrite('fsp1.wav', normal_nsp1, fs*2);
% [Pxx1 F1] = pwelch(x);
% Pxx1dB = 10*log10(Pxx1);
% plot(F1/pi,Pxx1dB,'-r')
% hold on
% [Pxx2 F2] = pwelch(nsp1filtered);
% Pxx2dB = 10*log10(Pxx2);
% plot(F2/pi,Pxx2dB,'-b')
% axis([0 1 min(Pxx2dB) max(Pxx2dB)])
% hold off
% grid on
% legend('unfiltered', 'filtered','location','northeast');
% xlabel('Normalized Frequency (x pi rad/sample)');
% ylabel('Power/frequency (dB/rad/sample)');
% title('Spectrum of nsp1 before/after filtering');
% soundsc(x,fs);

%% nsp2
if (wave1 == 0)
    if (choice == 2)
        [x,fs] = audioread('nsp2.wav');
        nsp2coef = load('nsp2');
        nsp2 = nsp2coef.Num;
        nsp2filtered = filter(nsp2,1,x);
        soundsc(nsp2filtered, fs);
    end
end
% normal_nsp2 = nsp2filtered/max(abs(nsp2filtered));
% audiowrite('fsp2.wav', normal_nsp2, fs);
% freqz(nsp2filtered);
% [Pxx1 F1] = pwelch(x);
% Pxx1dB = 10*log10(Pxx1);
% plot(F1/pi,Pxx1dB,'-r')
% hold on
% [Pxx2 F2] = pwelch(nsp2filtered);
% Pxx2dB = 10*log10(Pxx2);
% plot(F2/pi,Pxx2dB,'-b')
% axis([0 1 min(Pxx2dB) max(Pxx2dB)])
% hold off
% grid on
% legend('unfiltered', 'filtered','location','northeast');
% xlabel('Normalized Frequency (x pi rad/sample)');
% ylabel('Power/frequency (dB/rad/sample)');
% title('Spectrum of nsp2 before/after filtering');
% soundsc(x,fs);

%% nsp3
if (wave1 == 0)
    if (choice == 3)
        [x,fs] = audioread('nsp3.wav');
        nsp3coef = load('nsp3');
        nsp3 = nsp3coef.Num;
        nsp3filtered = filter(nsp3,1,x);
        soundsc(nsp3filtered, fs);
    end
end
% normal_nsp3 = nsp3filtered/max(abs(nsp3filtered));
% audiowrite('fsp3.wav', normal_nsp3, fs);
% freqz(nsp3filtered);
% [Pxx1 F1] = pwelch(x);
% Pxx1dB = 10*log10(Pxx1);
% plot(F1/pi,Pxx1dB,'-r')
% hold on
% [Pxx2 F2] = pwelch(nsp3filtered);
% Pxx2dB = 10*log10(Pxx2);
% plot(F2/pi,Pxx2dB,'-b')
% axis([0 1 min(Pxx2dB) max(Pxx2dB)])
% hold off
% grid on
% legend('unfiltered', 'filtered','location','northeast');
% xlabel('Normalized Frequency (x pi rad/sample)');
% ylabel('Power/frequency (dB/rad/sample)');
% title('Spectrum of nsp3 before/after filtering');
% soundsc(x,fs);
