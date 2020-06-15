@doc doc"""
Approximation de la solution du problème ``\min_{x \in \mathbb{R}^{n}} f(x)`` en utilisant l'algorithme de Newton

# Syntaxe
```julia
xk,f_min,flag,nb_iters = Algorithme_de_Newton(f,gradf,hessf,x0,option)
```

# Entrées :
   * **f**       : la fonction à minimiser
   * **gradf**   : le gradient de la fonction f
   * **hessf**   : la Hessienne de la fonction f
   * **x0**      : première approximation de la solution cherchée
   * **options** :
       * **eps**      : pour fixer les conditions d'arrêt
       * **max_iter** : le nombre maximal d'iterations
       * **tol**      : pour les conditions d'arrêts

# Sorties:
   * **xmin**    : une approximation de la solution du problème  : ``\min_{x \in \mathbb{R}^{n}} f(x)``
   * **f_min**   : ``f(x_{min})``
   * **flag**     : entier indiquant le critère sur lequel le programme à arrêter
      * **0**    : Convergence
      * **1**    : stagnation du xk
      * **2**    : stagnation du f
      * **3**    : nombre maximal d'itération dépassé
   * **nb_iters** : le nombre d'itérations faites par le programme

# Exemple d'appel
```@example
using Optinum
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
x0 = [1; 0]
options = []
xmin,f_min,flag,nb_iters = Algorithme_De_Newton(f,gradf,hessf,x0,options)
```
"""
function Algorithme_De_Newton(f::Function,gradf::Function,hessf::Function,x0,options)

        "# Si option est vide on initialise les 3 paramètres par défaut"
        if options == []
                eps = 1e-8
                max_iter = 100
                tol = 1e-15
        else
                eps = options[1]
                max_iter = options[2]
                tol = options[3]

        end

        n = length(x0)
        xmin = zeros(n)
        f_min = 0
        flag = 0
        nb_iters = 0
        return xmin,f_min,flag,nb_iters
end
