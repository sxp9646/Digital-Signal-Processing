%%Waveform plot
k=0:1:8;
Xp=1/4*exp(-j*pi/2*k).*(sinc((1-k)/2)+sinc((1+k)/2));
spec.X=[conj(fliplr(Xp(2:end))) Xp];
spec.f = 25*[-fliplr(k(2:end)) k];

fo=25;              % fundamental frequency
fmax = spec.f(end); % greatest freq in spec
h = 1/(40*fmax);    % sample in tmax
t0=0;tf=3*1/fo;     % three periods
t = t0:h:tf;        % sample time vec
N = length(spec.f); % num of spectral lines
pos = ceil(N/2);    % mid index
% Add DC component
x = zeros(size(t)); % init sig
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