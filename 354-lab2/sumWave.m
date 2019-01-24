% test parameters:
V = 10;
r = 1;
Thetai = 0;
f = 1*10^9;
w = 2*pi*f;
alpha = 0;
beta = 35;
Zo = 36.5;
Thetaz = 0;
% end test

T = 1/(1*10^9); % T = 1/f 
% w = 2*pi*f;
t = (0:0.05:1)*T;
z = (0:1/100:2);
[z1,t1] = meshgrid(z,t);

vi1 = incidentVoltage( V, Thetai, w, alpha, beta, z1, t1 );
ii1 = incidentCurrent( V, Thetai, w, alpha, beta, z1, t1, Zo, Thetaz );

vr = BWVoltage( V, Thetai, w, alpha, beta, z1, t1,r );
ir = BWCurrent( V, Thetai, w, alpha, beta, z1, t1, Zo, Thetaz,r );

vi=vi1+vr;
ii = ii1 +ir;

for k=1:length(t)
    plot(z, vi(k,:),'b.'); hold on;
    plot(z,10*ii(k,:),'r-'); hold off;
    xlabel('z[m]');
    ylabel('vi2(z,t)[V],10*ii2(z,t)[mA]');
    title('Instantaneous Signals-on a lossy transmission line');
    legend('Vi2(z,t)','ii2(z,t)');
    ylim(max(max(max(vi)),max(max(10*10*ii)))*1.5*[-1,1]);
    M(k) = getframe;
end