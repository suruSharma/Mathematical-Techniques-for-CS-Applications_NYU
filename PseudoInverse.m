function [MInv] = PseudoInverse(M)
    [L,S,R] = svd(M);
    
    LT = transpose(L);
    
    S1 = S;
    
    dim = size(S1);
    
    r = min(dim);
    
    for(i=1:r)
        if(S1(i,i) ~= 0)
            S1(i,i) = 1/S1(i,i);
        end
    end

    MInv = R*transpose(S1)*LT;
    
end
