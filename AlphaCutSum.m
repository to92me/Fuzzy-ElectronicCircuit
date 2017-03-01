function [ Z ] = AlphaCutSum( X, Y, alpha )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    a = X(1);
    b = X(2); 
    c = X(3); 
    
    p = Y(1); 
    q = Y(2); 
    r = Y(3);
    
    res_l = a + p + ((b - a + q - p) * alpha); 
    res_h = c + r - ((c - b + r - q) * alpha);
    res   = b + q; 
    Z = [res_l, res, res_h];

end

