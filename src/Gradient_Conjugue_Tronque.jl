@doc doc"""
Minimise le problème : ``min_{||s||< \delta_{k}} q_k(s) = s^{t}g + (1/2)s^{t}Hs``
                        pour la ``k^{ème}`` itération de l'algorithme des régions de confiance

# Syntaxe
```julia
sk = Gradient_Conjugue_Tronque(fk,gradfk,hessfk,option)
```

# Entrées :   
   * **gradfk**           : (Array{Float,1}) le gradient de la fonction f appliqué au point xk
   * **hessfk**           : (Array{Float,2}) la Hessienne de la fonction f appliqué au point xk
   * **options**          : (Array{Float,1})
      - **delta**    : le rayon de la région de confiance
      - **max_iter** : le nombre maximal d'iterations
      - **tol**      : la tolérance pour la condition d'arrêt sur le gradient


# Sorties:
   * **s** : (Array{Float,1}) le pas s qui approche la solution du problème : ``min_{||s||< \delta_{k}} q(s)``

# Exemple d'appel:
```julia
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
xk = [1; 0]
options = []
s = Gradient_Conjugue_Tronque(gradf(xk),hessf(xk),options)
```
"""

using Roots
function Gradient_Conjugue_Tronque(gradfk,hessfk,options)

    "# Si option est vide on initialise les 3 paramètres par défaut"
    if options == []
        deltaK = 2
        max_iter = 100
        tolerance = 1e-6
    else
        deltaK = options[1]
        max_iter = options[2]
        tolerance = options[3]
    end

   n = length(gradfk)
   s = zeros(n)
    
    g = gradfk;
    p = -gradfk;
    
    g0 = gradfk;
    p0 = -gradfk;

    for j= 0 : max_iter
        k = p' * hessfk * p;
        if k <= 0

            discrim = (2 * s'*p)^2 - 4 * (norm(p))^2 * ((norm(s))^2 -(deltaK)^2);
            # si deux solutions 
            if discrim > 0 
                sol1 = -( (2 * s'*p) + sqrt(discrim)) / (2*(norm(p))^2);
                sol2 = -(2 * s'*p) + sqrt(discrim) / (2*(norm(p))^2);
                # mettre la sol dans un seul vecteur
                sol1 = sol1 * p + s ; 
                sol22 = sol2 * p + s ;

                s_1 =  gradfk' * sol1 + 0.5 * sol1' * hessfk * sol1;
                s_2 =  gradfk' * sol22 + 0.5 * sol22' * hessfk * sol22;

                if s_1  < s_2
                    res1 = sol1;
                else
                    res1 = sol22;
                end
            # si 1 solution
            else
                res1 = (2 * s'*p)/(2*(norm(p))^2);

            end
            s = s + res1 .* p;
            break;
        end

        alpha = (g'*g)/k;

        if (norm(s + alpha*p) >= deltaK)
            poly = [(norm(p))^2 (2 * s'*p) ((norm(s))^2 -(deltaK)^2)];

            racine = roots(poly);
            # Si 2 solution
            if (length(racine) == 2)
                if racine(1) >= 0
                    res1 = racine(1);
                else
                    res1 = racine(2);
                end
            else
                res1 = racine;
            end
            s = s + res1 * p;
            break;
        end

        #maj
        s_new = s + alpha * p;
        g_new = g + alpha * hessfk * p;
        beta = (g_new'*g_new) / (g'* g);
        p = -g_new + beta* p;

        
        if ( (norm(g_new)) <= tolerance * (norm(g0) + tolerance))
            break;
        end

        g = g_new;
        s = s_new;
    end

    resultat = s;
    
   return s
end
