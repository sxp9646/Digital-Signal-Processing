%%Part 1: Frequency Resolution

A1 = 1;
A2 = 1;
F1 = .2;
F2 = .21;
L = 64;

n = 0:(L-1);
X1 = A1 * sin(2*pi * F1 * n);
X2 = A2 * sin(2*pi * F2 * n);

XN = X1+X2;

figure;
hp = stem(n,XN);
grid
hold on %put plot on same figure
axis([0 20 -2 2]); %to only plot range [x1 x2 y1 y2]
title('First 20 Iterations Plot')

%Number 2 and 3: shifted frequency, centered plots
NN = 512;
fftPlot = fft(XN,NN);
y = 0:NN-1;
shifter = fftshift(fftPlot);
%m=-floor((NN)/2):1:floor((NN-1)/2); % Shifted frequency index

figure;
plot(linspace(-1/2,1/2,NN),abs(fftPlot/2)/NN,'marker','none','Linewidth',2);

xlabel('k [frequency index]')
ylabel('|X[k]|')
title('Centered Plot of DFT coefficients')

%4: At L = 64, the two peaks are not distinguishable. Additionally,
% when N was increased from 512 to 1024, even then the two peaks were
% not distinguishabe. This is simply because N is just the order of the
% filter and the larger order does not impact the visibility of the peaks
% in any way. 

%5:

%shifted frequency, centered plots

A1 = 1;
A2 = 1;
F1 = .2;
F2 = .21;
L = 128;

n = 0:(L-1);
X1 = A1 * sin(2*pi * F1 * n);
X2 = A2 * sin(2*pi * F2 * n);

XN2 = X1+X2;

NCrit = 512;
fftPlot = fft(XN2,NCrit);
y = 0:NCrit-1;
shifter = fftshift(fftPlot);
%m=-floor((NCrit)/2):1:floor((NCrit-1)/2); % Shifted frequency index

figure;
plot(linspace(-1/2,1/2,NCrit),abs(fftPlot)/NCrit,'marker','none','Linewidth',2);
xlabel('k [frequency index]')
ylabel('|X[k]|')
title('Increased Centered Plot')

% As described in Figure 3 - Increased Centered Plot, there's a dip in the 
% plot indicating that there are two cosines. This is clearly visible once the 
% L value was increased. Increasing the L value means taking more samples to check
% the plot against. The lesson learned is that if we can afford to sample at a greater
% rate, that is the way to go because it provides more clarity in the plots and analysis.
% At L = 128, we see two peaks clearly.