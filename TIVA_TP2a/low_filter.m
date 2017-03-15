function ft_filter = low_filter( ft, frequency )
%PASSE_BAS Penser a reecrire ça matriciellement
%   Detailed explanation goes here
[n1,  n2]= size(ft);
ft_filter = zeros(n1, n2);
ind1 = floor(frequency*n1);
ind2 = floor(frequency*n2);
ft_filter(1:ind1, 1:ind2) = 1; % Left corner
ft_filter(n1-ind1:n1, 1:ind2) = 1;
ft_filter(1:ind1, n2-ind2:n2) = 1;
ft_filter(n1-ind1:n1, n2-ind2:n2) =1;

ft_filter = ft_filter .* ft;
% for k1=1:n1
%     for k2=1:n2
%         ka = max(k1, n1-k1);
%         kb = max(k2, n2-k2);
% 
%         if (ka/n1 < frequency && kb/n2 < frequency)
%             ft_filter(k1, k2) = ft(k1, k2);
%         end
%     end
% end

