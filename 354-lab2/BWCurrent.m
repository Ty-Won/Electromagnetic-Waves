function [ ii2 ] = BWCurrent( V, Thetai, w, alpha, beta, z, t, Zo, Thetaz, r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ii2 = (-V./Zo.*exp(alpha.*z).*cos(w.*t + beta.*z + Thetai - Thetaz))*r;

end