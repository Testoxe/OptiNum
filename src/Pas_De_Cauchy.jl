@doc doc"""
Definition de la fonction Pas_De_Cauchy(g,H,delta)
"""
function Pas_De_Cauchy(g,H,delta)

    e = 0
    n = length(g)
    s = zeros(n)
    
    t_min = (norm(g)^2)/((g') * H * g)
    t0 = delta / norm(g)
    t1 = g'* H * g
    
    if t_min < t0 && t1 > 0
        s = t_min
    elseif t_min > t0 && t1 > 0
        s = t0;
    elseif t_min < t0 && t1 < 0
        s = t0;
    else
        s = t0;
    end
    
    s = -s*g
    
    return s, e
end
