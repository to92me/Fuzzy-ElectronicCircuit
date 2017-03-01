function [ Z ] = AlphaCutProd( X, Y, alpha )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    a = X(1);
    b = X(2); 
    c = X(3); 
    
    p = Y(1); 
    q = Y(2); 
    r = Y(3);
    
    res_l = (((b - a) * alpha) + a) * (((q - p) * alpha) + p);
    res_h = (c - ((c - b)* alpha)) * (r - ((r - q)*alpha));
    res = b * q; 
    
    Z = [res_l, res, res_h];

end

