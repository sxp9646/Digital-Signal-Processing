%% Data and plot of the spectrum of a signal
spec.f=[-25,-10,0,10,25];
spec.X=[.75*exp(j*pi/3),.5*j,-1,.5*j,.75*exp(j*pi/3)];
spplot(spec)
%% Waveform plot
fo=5; % fundamental frequency
fmax = spec.f(end); % greatest freq in spec
h = 1/(40*fmax); % sample in tmax
t0=0;tf=4*1/fo; %  four periods
t = t0:h:tf; % sample time vec
N= length(spec.f); % num of spec lines
pos=ceil(N/2); % mid array index
% Add DC component
x = zeros(size(t)); % init signal with 0s
if rem(pos,N) % DC is present
	DC = spec.X(pos);
	x = x + DC; % add DC offset
end
% Reconstruct sinusoids (Euler identities)
for k = pos+1:N
	x = x + ( spec.X(k)*exp(j*2*pi*spec.f(k)*t) ...
		+ conj(spec.X(k))*exp(-j*2*pi*spec.f(k)*t));
end
% Plot waveform
plot(t,x); hold on
plot(t,DC,'r') % show DC level
xlabel('t [sec]')
ylabel('x(t)')
grid
hold off

%% Answers to questions for Problem 2:

% a)
% In the reconstruction there's a half which shouldn't be there due to the nature of euler's identity.
% 
% b)
% Hold on retains current plots when adding new plots.

% c)
% Code and waveforms attached in separate files.

% d)
% Code and waveforms attached in separate files.