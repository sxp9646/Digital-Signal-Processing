function x = waveform(spec,t0,tf)

%%Waveform plot
% usage: waveform(spec,t0,tf)
% input: initial time, freq time and sec
% output: a figure describing waveforms
    
if nargin==0
    help waveform
    return
else
    
k=0:1:8;
Xp=1/4*exp(-j*pi/2*k).*(sinc((1-k)/2)+sinc((1+k)/2));
spec.X=[conj(fliplr(Xp(2:end))) Xp];
spec.f = 25*[-fliplr(k(2:end)) k];

fmax = spec.f(end); % highest frequency in spectrum
h = 1/(40*fmax);    % sampling period 40 samples in T_fmax
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
end