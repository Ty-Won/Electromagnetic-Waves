function [ vi ] = incidentVoltage( V, Thetai, w, alpha, beta, z, t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
vi = V.*exp(-alpha.*z).*cos(w.*t - beta.*z + Thetai );

end