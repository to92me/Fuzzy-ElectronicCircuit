function [ Z ] = AlphaCutSub( X, Y, alpha )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    a = X(1);
    b = X(2); 
    c = X(3); 
    
    p = Y(1); 
    q = Y(2); 
    r = Y(3);
    
    res_l = (a - r) + ((b - a + r - q) * alpha);
    res_h = (c - p) - ((c - b + q - p) * alpha);
    res = b - q; 
    
    Z = [res_l, res, res_h];

end

