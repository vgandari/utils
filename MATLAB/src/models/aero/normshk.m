function [M2, p2p1, rho2rho1, T2T1, p02p01] = normshk(k, M1)
    M2_13 = sqrt((M1.^2*(k - 1) + 2)./(2*k*M1.^2 - (k - 1)));
    p2p1_13 = 2*k*M1.^2/(k + 1) - (k - 1)/(k + 1);
    rho2rho1_13 = (k + 1)*M1.^2./((k - 1)*M1.^2 + 2);
    T2T1_13 = (1 + (k - 1)/2*M1.^2).*(2*k/(k - 1)*M1.^2 - 1)./(M1.^2*(2*k/(k - 1) + (k - 1)/2));
    p02p01_13 = ((k + 1)/2*M1.^2/(1 + (k - 1)/2*M1.^2)).^(k/(k - 1)).*(2*k/(k + 1)*M1.^2 - (k - 1)/(k + 1)).^(-1/(k - 1));
end