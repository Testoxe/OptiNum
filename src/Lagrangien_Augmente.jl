@doc doc"""
Résolution des problèmes de minimisation sous contraintes d'égalités

# Syntaxe
```julia
Lagrangien_Augmente(algo,fonc,contrainte,gradfonc,hessfonc,grad_contrainte,
			hess_contrainte,phi,x0,option)
```

# Entrées
  * **algo** 		   : l'algorithme sans contraintes à utiliser:
    - **"newton"**  : pour l'algorithme de Newton
    - **"cauchy"**  : pour le pas de Cauchy
    - **"gct"**     : pour le gradient conjugué tronqué
  * **fonc** 		   : la fonction à minimiser
  * **contrainte**	   : la contrainte [x est dans le domaine des contraintes ssi ``c(x)=0``]
  * **gradfonc**       : le gradient de la fonction
  * **hessfonc** 	   : la hessienne de la fonction
  * **grad_contrainte** : le gradient de la contrainte
  * **hess_contrainte** : la hessienne de la contrainte
  * **phi(x)** : utilisée dans le calcul du gradient du Lagrangien (égale 0 dans le cas des contraintes d'égalités)
  * **x0** 			   : la première composante du point de départ du Lagrangien
  * **options**
    1. **epsilon** 	   : utilisé dans les critères d'arrêt
    2. **tol**         : la tolérance utilisée dans les critères d'arrêt
    3. **itermax** 	   : nombre maximal d'itération dans la boucle principale
    4. **lambda0**	   : la deuxième composante du point de départ du Lagrangien
    5. **mu0,tho** 	   : valeurs initiales des variables de l'algorithme

# Sorties
* **xmin**		   : une approximation de la solution du problème avec contraintes
* **fxmin** 	   : ``f(x_{min})``
* **flag**		   : indicateur du déroulement de l'algorithme
   - **0**    : convergence
   - **1**    : nombre maximal d'itération atteint
   - **(-1)** : une erreur s'est produite
* **niters** 	   : nombre d'itérations réalisées

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
phi(x) = 0
output = Lagrangien_Augmente(algo,f,contrainte,gradf,hessf,grad_contrainte,hess_contrainte,phi,x0,options)
```
"""
function Lagrangien_Augmente(algo,fonc::Function,contrainte::Function,gradfonc::Function,
	hessfonc::Function,grad_contrainte::Function,hess_contrainte::Function,phi::Function,x0,options)

	if options == []
		epsilon = 1e-30
		tol = 1e-3
		itermax = 1000
		lambda0 = 0.3
		mu0 = 0.5
		tho = 2
	else
		epsilon = options[1]
		tol = options[2]
		itermax = options[3]
		lambda0 = options[4]
		mu0 = options[5]
		tho = options[6]
	end

        n = length(x0)
        xmin = zeros(n)
	fxmin = 0
	flag = 0
	iter = 0
	
	return xmin,fxmin,flag,iter
end
