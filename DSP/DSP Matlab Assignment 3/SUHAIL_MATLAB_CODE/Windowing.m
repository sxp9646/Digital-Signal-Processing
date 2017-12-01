%%Part 3: Windowing

A1 = 1;
A2 = 0.02;
L = 32;
F1 = 8/L;
F2 = 10.5/L;
N = 512;

%Number 1
%Hanning
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = hanning(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')

title('Spectrum of windowed signal - Hanning')



%Haming
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = hamming(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')

title('Spectrum of windowed signal - Hamming')




%Triangular
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = triang(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')

title('Spectrum of windowed signal - Triangular')


%Chebwin
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = chebwin(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')
title('Spectrum of windowed signal - Chebwin')

% The advantage of using dB scale for the vertical axis. This allows for the peaks
% to be visible otherwise the plots will stick to the top and or bottom of the graphs.

%Number 2

% Yes, windowing provides an optimal view of the plots highlighting both peaks in our case
% very evidently. More importantly, windowing in this case took a smaller subset of the larger
% existing dataset to process the plots and show the two peaks evidently. In each of the respective
% windowing cases, the contents were modified and the respectively plots were exposed. Additionally,
% it is important to note that one of the main things solved by windowing is reducing of frequency 
% masking which is what makes it so useful.

% In this event, Chebyshev looks the cleanest in the case that it gets rid of a lot of noise to clarify
% the showcasing of the plot. On the other hand, the others did not eliminate the noise completely but it 
% allowed for a better ability to view other frequencies or signals at a lower amplitude. Regardless, in windowing
% we are expected to lose lower signals anyway which is why Chebyshev seems to be the cleanest.

% Number 3

% Since in windowing, we're only taking a small subset of a larger dataset, we find that the price paid is that some smaller
% signals are lost in plotting the graph. On the other hand, the process reduces frequency masking which is the flip side advantange
% in doing windowing.

% Number 4

A1 = 1;
A2 = 0.02;
L = 32;
F1 = 8/L;
F2 = 9.5/L;
N = 512;


%Hanning
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = hanning(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')

title('Spectrum of windowed signal - Hanning')



%Haming
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = hamming(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')

title('Spectrum of windowed signal - Hamming')




%Triangular
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = triang(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')

title('Spectrum of windowed signal - Triangular')


%Chebwin
n = 0:(L-1);
X1 = (A1*sin(2*pi*F1*n));
X2 = (A2*sin(2*pi*F2*n));
x = X1+X2;

w = chebwin(L)'; % Choose Window
S1=sum(w)/L;     % Compute Window Scaling

X=fft(x.*w,L);   % Compute DFT
k=0:L-1;      % frequency index vector (for plots)

% Plot properly centered and scaled coefficients
S=L*S1; % Scaling = DFT * Windows Scaling
figure
Y=fftshift(X)/S; % Spectrum with proper scaling
%m=-floor((N)/2):1:floor((N-1)/2);
plot(linspace(-1/2,1/2,L),mag2db(abs(Y)),'marker','none','Linewidth',2);
hold on;
xlabel('k [frequency index]')
ylabel('|X[k]|')
title('Spectrum of windowed signal - Chebwin')

% To answer this question, it's a little skewed. Since the amplitudes are different,
% we are not clearly seeing the two peeks. In the past, the issue was that if we sample
% at a faster rate, we would see the split within the peeks. In this case, while the grand
% image looks like a peek, the granular plot does not split into peeks therefore I would say that
% there is too much noise and is not safe to conclude that we will indeed get two peeks, unless of course
% the limitation bar for noise can be accounted for as a peek simply in graphical terms.