function f = fourier_zoom( f_ech, T1)
%Calcule l'image d'origine � partir du signal echantillonn�.
% ATTENTION : cette fonction suppose que la r�gle de Nyquist est v�rifi�e
[h, w] = size(f_ech);
f = zeros(h*T1, w*T1);
x1 = 1:T1*h;
x2 = 1:T1*w;
for n1=1:h/T1
    for n2=1:w/T1
        f = f + f_ech(n1, n2)*(sinc(x1/T1 -n1)' * sinc(x2/T1 - n2));
    end
end
end

        