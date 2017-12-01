%% Using Publish 

%%
% (modified from Chebfun toolbox for DSP)

%%
% This is an example of using publish. First you need to change the publish
% options (pull down Publish|Edit publish options) to generate a pdf file 
% (and if you want also the target directory)

%% 
% If you are working under Windows you should also be able to publish to
% an MS Word Document (doc).  For more information type "help publish" at
% the prompt (that option does not appear in my laptop because I am running
% Linux)
%
% Note that you can also insert formating tags by selecting the with the 
% mouse.

%%
% Any interval $[a,b]$ can be scaled to $[-1,1]$, so most of the time, we
% shall just talk about $[-1,1]$.

%%
% Let $n$ be a positive integer:

%%
% <latex> \vspace{-2em} </latex>

n = 16;
 
%%
% Consider $n+1$ equally spaced angles $\{\theta_j\}$ from 0 to $\pi$:

%%
% <latex> \vspace{-2em} </latex>

tt = linspace(0,pi,n+1);

%%
% We can think of these as the arguments of $n+1$ points $\{z_j\}$ on the
% upper half of the unit circle in the complex plane.  These are the
% $(2n)\!\!$ th roots of unity lying in the closed upper half-plane:

%%
% <latex> \vspace{-2em} </latex>

zz = exp(1i*tt);
hold off, plot(zz,'.-k'), axis equal, ylim([0 1.1])
FS = 'fontsize';
title('Equispaced points on the unit circle',FS,9)

%%
% <latex> \vskip 1pt </latex>

%%
% The _Chebyshev points_ associated with the parameter $n$ are the real
% parts of these points,

%%
% <latex> \vskip -1.5em
% $$ x_j = \hbox{Re}\, z_j = {1\over 2} (z_j^{} + z_j^{-1}),
% \quad 0 \le j \le n: \eqno (2.1) $$
% \vspace{-2em} </latex>

%%
% Some authors use the terms _Chebyshev--Lobatto points_, _Chebyshev
% extreme points_, or _Chebyshev points of the second kind_, but as these
% are the points most often used in practical computation, we shall just
% say Chebyshev points.

%%
% Another way to define the Chebyshev points is in terms of the original
% angles,

%%
% <latex> \vskip -2em
% $$ x_j = \cos(\kern .7pt j \pi / n), \quad 0 \le j \le n, \eqno (2.2) $$
% \vskip -1.5em </latex>

xx = cos(tt);

%%
% <latex>
% \noindent
% and the problem of polynomial interpolation in these points was
% considered at least as early as [Jackson 1913]. There is also an
% equivalent Chebfun command \verb|chebpts|:
% </latex>


%%
% <latex> \vskip 1pt </latex>

%%
% They cluster near $1$ and $-1$, with the average spacing as $n\to\infty$
% being given by a density function with square root singularities at both
% ends (Exercise 2.2).

%%
% <latex> 
% Let $\{f_j\}$, $0 \le j \le n$, be a set of numbers, which may or may not
% come from sampling a function $f(x)$ at the Chebyshev points. Then there
% exists a unique polynomial $p$ of degree $n$ that interpolates these
% data, i.e., $p(x_j) = f_j$ for each~$j$.  When we say ``of degree $n$,''
% we mean of degree less than or equal to $n$, and we let ${\cal P}_n$
% denote the set of all such polynomials:
% $$ {\cal P}_n = \{\hbox{polynomials of degree at most $n$}\}. \eqno (2.3) $$
% As we trust the reader already knows, the existence and uniqueness of
% polynomial interpolants applies for any distinct set of interpolation
% points.  In the case of Chebyshev points, we call the polynomial the {\em
% Chebyshev interpolant}.
% </latex>

%%
% Polynomial interpolants through equally spaced points have terrible
% properties, as we shall see in Chapters 11--15. Polynomial interpolants
% through Chebyshev points, however, are excellent. It is the clustering
% near the ends of the interval that makes the difference, and other sets
% of points with similar clustering, like Legendre points (Chapter 17),
% have similarly good behavior.  The explanation of this fact has a lot to
% do with potential theory, a subject we shall introduce in Chapter 12.
% Specifically, what makes Chebyshev or Legendre points effective is that
% each one has approximately the same average distance from the others,
% as measured in the sense of the geometric mean.  On the interval
% $[-1,1]$, this distance is about $1/2$ (Exercise 2.6).


%%
% <latex> \vskip -2em </latex>
x=linspace(1,10,150);
f = sin(6*x) + sign(sin(x+exp(2*x)));
hold off, plot(f,'k')
title('Some Random Plot',FS,9)
  
