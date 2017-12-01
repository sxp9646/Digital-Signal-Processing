
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