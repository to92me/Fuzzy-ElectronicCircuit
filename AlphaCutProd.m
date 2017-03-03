function [ Z ] = AlphaCutProd( X, Y, alpha )
% calculates multiplication of two fuzzy numbers using alpha cut method
% param: A input fuzzy number
% param: B input fuzzy number
% param: alpha alpha cut parameter
% return: Z fuzzy number, result of multiplication A*B using alpha cut method
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

