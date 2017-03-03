function [ Z ] = AlphaCutDiv( X, Y, alpha )
% calculates division of two fuzzy numbers using alpha cut method
% param: A input fuzzy number
% param: B input fuzzy number
% param: alpha alpha cut parameter
% return: Z fuzzy number, result of alfa cut division A/B 
    a = X(1);
    b = X(2); 
    c = X(3); 
    
    p = Y(1); 
    q = Y(2); 
    r = Y(3);
    
    res_l = (((b - a) * alpha) + a) / (r - ((r - q) * alpha));
    res_h = (c - ((c - b) * alpha)) / (((q - p) * alpha) + p); 
    res = b / q; 
    
    Z = [res_l, res, res_h];

end

