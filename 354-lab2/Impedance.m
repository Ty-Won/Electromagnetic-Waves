% test parameters:
V = 10;
%r = 1;
Thetai = 0;
f = 1*10^9;
w = 2*pi*f;
beta = 35;
Zo = 36.5;
Thetaz = 0;
ZL = 5;
R = 0;
G = 0;
C = 40*10^-12;
L = 0.35*10^-6;
% end test

T = 1/(1*10^9); % T = 1/f 
% w = 2*pi*f;
t = (0:0.01:3)*T;
z = (0:1/100:2);
[z1,t1] = meshgrid(z,t);
% reflection coefficient and characteristic impedance and alpha
alpha = sqrt((R+sqrt(-1)*w*L)/(G+sqrt(-1)*w*C));
Zo = sqrt(L/C);
r = (ZL-Zo)/(ZL+Zo);

vi1 = incidentVoltage( V, Thetai, w, alpha, beta, z1, t1 );
ii1 = incidentCurrent( V, Thetai, w, alpha, beta, z1, t1, Zo, Thetaz );

vr = BWVoltage( V, Thetai, w, alpha, beta, z1, t1,r );
ir = BWCurrent( V, Thetai, w, alpha, beta, z1, t1, Zo, Thetaz,r );

vi=vi1+vr;
ii = ii1 +ir;
Znew = vi./ii;
%fprintf("%i",Znew,"\n");

k = 1:length(t);
plot(z1, Znew(k,:),'b.'); hold on;

ylim(max(max(max(Znew)))*1.5*[-2,1]);
M(k) = getframe;
