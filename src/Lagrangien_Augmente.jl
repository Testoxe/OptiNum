@doc doc"""

#Résolution des problèmes de minimisation sous contraintes d'égalités

# Syntaxe
```julia
Lagrangien_Augmente(algo,fonc,contrainte,grad_fonc,hess_fonc,grad_contrainte,
			hess_contrainte,x0,options)
```

# Entrées
  * **algo** 		   : (String) l'algorithme sans contraintes à utiliser:
    - **"newton"**  : pour l'algorithme de Newton
    - **"cauchy"**  : pour le pas de Cauchy
    - **"gct"**     : pour le gradient conjugué tronqué
  * **fonc** 		   : (Function) la fonction à minimiser
  * **contrainte**	   : (Function) la contrainte [x est dans le domaine des contraintes ssi ``c(x)=0``]
  * **grad_fonc**       : (Function) le gradient de la fonction
  * **hess_fonc** 	   : (Function) la hessienne de la fonction
  * **grad_contrainte** : (Function) le gradient de la contrainte
  * **hess_contrainte** : (Function) la hessienne de la contrainte
  * **x0** 			   : (Array{Float,1}) la première composante du point de départ du Lagrangien
  * **options**		   : (Array{Float,1})
    1. **epsilon** 	   : utilisé dans les critères d'arrêt
    2. **tol**         : la tolérance utilisée dans les critères d'arrêt
    3. **itermax** 	   : nombre maximal d'itération dans la boucle principale
    4. **lambda0**	   : la deuxième composante du point de départ du Lagrangien
    5. **mu0,tho** 	   : valeurs initiales des variables de l'algorithme

# Sorties
* **xmin**		   : (Array{Float,1}) une approximation de la solution du problème avec contraintes
* **fxmin** 	   : (Float) ``f(x_{min})``
* **flag**		   : (Integer) indicateur du déroulement de l'algorithme
   - **0**    : convergence
   - **1**    : nombre maximal d'itération atteint
   - **(-1)** : une erreur s'est produite
* **niters** 	   : (Integer) nombre d'itérations réalisées

# Exemple d'appel
```julia
using LinearAlgebra
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
algo = "gct" # ou newton|gct
x0 = [1; 0]
options = []
contrainte(x) =  (x[1]^2) + (x[2]^2) -1.5
grad_contrainte(x) = [2*x[1] ;2*x[2]]
hess_contrainte(x) = [2 0;0 2]
output = Lagrangien_Augmente(algo,f,contrainte,gradf,hessf,grad_contrainte,hess_contrainte,x0,options)
```
"""

function Lagrangien_Augmente(algo,fonc::Function,contrainte::Function,grad_fonc::Function,
	hess_fonc::Function,grad_contrainte::Function,hess_contrainte::Function,x0,options)

	if options == []
		epsilon = 1e-8
		tol = 1e-5
		itermax = 1e8
		lambda0 = 2
		mu0 = 100
		tho = 2
	else 
		epsilon = options[1]
		tol = options[2]
		itermax = options[3]
		lambda0 = options[4]
		mu0 = options[5]
		tho = options[6]
	end
    
    λk = lambda0
    μk = mu0
    ϵ0=1/mu0
    ϵk = ϵ0
    τ  = tho
    α=0.1
    β=0.9 
    
    tmp = 0.1258925 # = ^η0
    η0=  0.1 # tmp/(mu0^α) 
    ηk = η0
    xk = x0
    flag = 10
    niters =0
    # definitions des variables
    xkplus1 = xk
    f_min = 0
    iter = 0
    
    
    while flag == 10
            Lagrangien(x) = fonc(x) + (λk') * contrainte(x)+ (μk/2) *(norm(contrainte(x))^2)
            grad_Lagrangien(x) = grad_fonc(x) + grad_contrainte(x) * (λk') + grad_contrainte(x) * (μk) * contrainte(x) 
            hess_Lagrangien(x) = hess_fonc(x) + (λk' + μk * contrainte(x))* hess_contrainte(x) + (μk) * grad_contrainte(x) * (grad_contrainte(x)')
            
            grad_Lagrangien0(x,λ) = grad_fonc(x) + grad_contrainte(x) * (λ') 
        
            Tol_rel = tol
            Tol_abs = epsilon
        
            # Déterminer le paramètre algo
            if (algo == "newton")
                    xkplus1,f_min,flg,iter = Algorithme_De_Newton(Lagrangien,grad_Lagrangien,hess_Lagrangien,xk,[itermax;ϵk;Tol_rel]) 
            elseif (algo == "gct")
                    xkplus1,f_min,flg,iter = algo(Lagrangien,grad_Lagrangien,hess_Lagrangien,xk,[itermax;ϵk;Tol_rel]) 
            elseif (algo == "cauchy")
                xkplus1,f_min,flg,iter = algo(Lagrangien,grad_Lagrangien,hess_Lagrangien,xk,[itermax;ϵk;Tol_rel]) 
            else 
                return "Erreur : Algo non défini"
            end
            #niters += iter; 
            #println("  * xk = ",xk)
            #println("  * flg = ",flg)
            #println("  * xkplus1 = ",xkplus1)
            if ( norm(grad_Lagrangien0(xkplus1,λk)) <= max(Tol_rel*norm(grad_Lagrangien0(x0,lambda0)),Tol_abs) &&  norm(contrainte(xkplus1)) <= max(Tol_rel*norm(contrainte(x0)),Tol_abs))
                flag = 0
            elseif norm(contrainte(xkplus1)) <= ηk
                λk += μk* contrainte(xkplus1)
                ϵk = ϵk/μk
                ηk = ηk/(μk^β)
            elseif itermax <= niters  "test sur le nombre d'itération maximal  flag--> 1 "
                    flag = 1
            else 
                μk = μk*τ
                ϵk = ϵ0/μk
                ηk = tmp/(μk^α)
            end
            niters += 1 
            xk = xkplus1
         end  
     return xkplus1,f_min,flag,niters
end
