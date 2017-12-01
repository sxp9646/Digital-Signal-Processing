function spplot(spec)
% SPPLOT plots the two-sided magnitude and phase spectrum
% usage: spplot(spec)
% input: spec - a structure with
%        spec.f - a vector of non-negative frequencies only
%        spec.X - the complex coefficients of the spectrum
% output: a figure with two subplots with the spectrum plots
if nargin == 0
  help spplot
  return
end
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
  ylabel('arg(X)\/pi')
  xlabel('f [Hz]')
  grid