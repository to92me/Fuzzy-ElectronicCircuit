function [ Z ] = fuzarithac( X , Y, alpha, method )
% calculates given operation of two fuzzy numbers using alpha cut method
% param: X input fuzzy number 
% param: Y input fuzzy number
% param: alpha alpha cut parameter
% param: method operation that is performed on operands X nad Y 
% return: Z fuzzy number, result of given operation using alpha cut method    
    switch method
        case 'sub'
            Z = AlphaCutSub(X,Y,alpha);
        case 'prod'
            Z = AlphaCutProd(X,Y,alpha);
        case 'sum'
            Z = AlphaCutSum(X,Y,alpha);
        case 'div'
            Z = AlphaCutDiv(X,Y,alpha);
        otherwise
            error('unknown method')
    end
end

