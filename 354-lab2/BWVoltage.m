function [ vi2 ] = BWVoltage( V, Thetai, w, alpha, beta, z, t, r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
vi2 = (V.*exp(alpha.*z).*cos(w.*t + beta.*z + Thetai ))*r;

end