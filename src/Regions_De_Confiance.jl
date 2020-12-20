function Regions_De_Confiance(algo,f::Function,gradf::Function,hessf::Function,x0,options)

    if options == []
        deltaMax = 10
        gamma1 = 0.5
        gamma2 = 2.00
        eta1 = 0.25
        eta2 = 0.75
        delta0 = 2
        max_iter = 1000
        Tol_abs = sqrt(eps())
        Tol_rel = 1e-15
    else
        deltaMax = options[1]
        gamma1 = options[2]
        gamma2 = options[3]
        eta1 = options[4]
        eta2 = options[5]
        delta0 = options[6]
        max_iter = options[7]
        Tol_abs = options[8]
        Tol_rel = options[9]
    end

    n = length(x0)
    xmin = zeros(n)
    fxmin = f(xmin)
    flag = 10
    nb_iters = 0
    
    deltak = delta0
    xk = x0
    xk2 = xk
    fk0 = f(xk)
    
    while(flag == 10)
        xk = xk2
        gk = gradf(xk)
        hk = hessf(xk)
        if algo == "cauchy"
            sk, ek = Pas_De_Cauchy(gk, hk, deltak)
        elseif algo == "gct"
            options = [deltak, max_iter, tol_abs]
            sk = Gradient_Conjugue_Tronque(fk,gradfk,hessfk,option)
        else return "Erreur : Methode de calcul pas inconnue"
        end
            
        fk = f(xk+sk)
        rhok = (fk0-fk)/(-gk'*sk - 0.5*sk'*hk*sk)
        
        if (rhok >= eta1)
            xk2 = xk + sk
            fk0 = fk
        end
        
        if rhok >= eta2
            deltak = min(gamma2*deltak, deltaMax)
        elseif rhok < eta1
            deltak = gamma1 * deltak
        end
        
        # Tests de convergence
        if norm(gradf(xk2)) <= max(Tol_rel*norm(gradf(x0)),Tol_abs) "test de Convergence flag--> 0 "
            flag = 0
        elseif norm(xk2-xk) <= max(Tol_rel*norm(xk),Tol_abs)  "test de stagnation de xk flag--> 1 "
            flag = 1
        elseif abs(f(xk2) - f(xk)) <= max(Tol_rel*abs(f(xk)),Tol_abs)  "test de stagnation de f(xk) flag--> 2 "
            flag = 2
        elseif max_iter <= nb_iters  "test sur le nombre d'itération maximal  flag--> 3 "
            flag = 3
        end
        
        nb_iters = nb_iters+1
    end
    
    xmin = xk
    fxmin = f(xmin)

    return xmin, fxmin, flag, nb_iters
end
