%%Part 2: Frequency Masking

%Number 1 and 2

A1 = 1;
A2 = 0.02;
L = 32;
F1 = 8/L;
F2 = 10.5/L;

n = 0:L;

X1 = A1 * sin(2*pi * F1 * n);
X2 = A2 * sin(2*pi * F2 * n);


NN = 512;
fftPlot = fft(X1,NN);
fftPlot2 = fft(X2,NN);
%plot together
shifter = fftshift(fftPlot);
shifter2 = fftshift(fftPlot2);
%m=-floor((NN)/2):1:floor((NN-1)/2); % Shifted frequency index


figure;
plot(linspace(-1/2,1/2,NN),mag2db(abs(shifter)/NN), 'marker','none','Linewidth',2,'color','r');
hold on;
plot(linspace(-1/2,1/2,NN),mag2db(abs(shifter2)/NN), 'marker','none','Linewidth',2,'color','b');
hold off;
ylim([-120 0])
%ax=axis;
%axis([-floor(NN/2) floor((NN-1)/2) ax(3:4)]);
xlabel('Frequency fx2pi')
ylabel('Magnitude (dB)')
title('Centered Plot of DFT coefficients')

% Using the dB scaling allows us to tell the peaks separately. Relative to the data length, there are both
% good and bad frequency separations. Towards the top of the plot, there are clear frequency separations, however
% towards the bottom, there is a cluster due to the nature of the frequencies being passed.

%Number 3
XN = X1 + X2;
fftPlot3 = fft(XN,NN);
shifter3 = fftshift(fftPlot3);
figure;
plot(linspace(-1/2,1/2,NN),mag2db(abs(shifter3)/NN), 'marker','none','Linewidth',2,'color','r');
hold on;
ylim([-100 -20])
%ax=axis;
%axis([-floor(NN/2) floor((NN-1)/2) ax(3:4)]);
xlabel('Frequency fx2pi')
ylabel('Magnitude (dB)')
title('Centered Plot of DFT coefficients')

% In the X[n] signal, only one peak is visible instead of the two. This is because the amplitudes are far off,
% therefore, we can see where the lower amplitude should be but cannot actually pin point it in the plot.
