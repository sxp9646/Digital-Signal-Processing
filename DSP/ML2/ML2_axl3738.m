%% Defaults for Octave (for Matlab they can be different )
% The format for a default property is: "default<object_type><property_name>"
set(0, "defaultaxesfontname", "Helvetica");
set(0, "defaultaxesfontsize", 12);
set(0, "defaultlinelinewidth", 4);
format compact

%% Part 1: generate spectrum of harmonic signal and store it in the structure
% spec with fields f for frequencies and X for complex coefficients
k=0:1:8;
Xp=1/4*exp(-j*pi/2*k).*(sinc((1-k)/2)+sinc((1+k)/2));
spec.X=[conj(fliplr(Xp(2:end))) Xp];
spec.f = 25*[-fliplr(k(2:end)) k];

%% Part 2: Plot the magnitude and phase spectra in one Figure
subplot(211)
p=stem(spec.f,abs(spec.X));
set(p,'Marker','none')
set(p,'LineWidth',6)
ylabel('abs(X)')
xlabel('f [Hz]')
grid
subplot(212)
q=stem(spec.f,angle(spec.X)/pi);
set(q,'Marker','none')
set(q,'LineWidth',6)
ylabel('arg(X)/\pi')
xlabel('f [Hz]')
grid
% 1.
% a) The fundamental frequency is 25 Hz. This was found by finding the greatest common
%    denominator of all the frequencies(25,50,100,150,200).
% b) We know that the given signal is periodic because all the frequencies are related by a
%    rational ratio (the fundamental frequency is a real number).
% d) When the function is called without arguments, it calls “help” on the function and shows
%    information on the function.
% 2.
% a)
%%Waveform plot
fo=25;              % fundamental frequency
fmax = spec.f(end); % highest frequency in spectrum
h = 1/(40*fmax);    % sampling period 40 samples in T_fmax
t0=0;tf=3*1/fo;     % plot three periods
t = t0:h:tf;        % sampling times vector
N = length(spec.f); % number of spectral lines
pos = ceil(N/2);    % array index of the middle
% Add DC component
x = zeros(size(t)); % initialize singal array with zeros
if rem(pos,N)       % DC is present
DC = spec.X(pos);
x = x + DC;         % add DC offset
end



% Reconstruct sinusoids (Euler identities)
for k = pos+1:N
x = x + (spec.X(k)*exp( j*2*pi*spec.f(k)*t) + conj(spec.X(k))*exp(-j*2*pi*spec.f(k)*t));
end
% Plot waveform
figure
plot(t,x);
hold on
plot(t,DC,'r')      % show DC level
xlabel('t [sec]')
ylabel('x(t)')
grid
hold off