function [ Z ] = fuzarithac( X , Y, alpha, method )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
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

