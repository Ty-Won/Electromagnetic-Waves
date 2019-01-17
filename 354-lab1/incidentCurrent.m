function [ ii ] = incidentCurrent( V, Thetai, w, alpha, beta, z, t, Zo, Thetaz )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ii = V./Zo.*exp(-alpha.*z).*cos(w.*t - beta.*z + Thetai - Thetaz);

end

