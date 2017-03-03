function [ Z ] = AlphaCutSub( X, Y, alpha )
% calculates subtraction of two fuzzy numbers using alpha cut method
% param: A input fuzzy number
% param: B input fuzzy number
% param: alpha alpha cut parameter
% return: Z fuzzy number, result of subtraction A-B using alpha cut method    
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

