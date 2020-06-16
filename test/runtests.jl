using Markdown
using Test
using LinearAlgebra
using Test_Optinum
using Sujet_Optinum

include("../src/Algorithme_De_Newton.jl")
include("../src/Gradient_Conjugue_Tronque.jl")
include("../src/Lagrangien_Augmente.jl")
include("../src/Pas_De_Cauchy.jl")
include("../src/Regions_De_Confiance.jl")

# Tester l'algorithme de Newton
printstyled("Lancement des tests sur ",bold=true,color=:white)
printstyled("l'algorithme de Newton ",bold=true,color=:blue)
println("")
try
	Test_Optinum.test_Algo_Newton(false,Algorithme_De_Newton)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end


# Tester l'algorithme du pas de Cauchy
printstyled("Lancement des tests sur",bold=true,color=:white)
printstyled(" le pas de cauchy ",bold=true,color=:blue)
println("")
try
	Test_Optinum.test_pas_de_cauchy(false,Pas_De_Cauchy)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end


# Tester l'algorithme des Régions de confiance avec PasdeCauchy | GCT
printstyled("Lancement des tests sur",bold=true,color=:white)
printstyled(" les régions de confiance ",bold=true,color=:blue)
println("")
try 
	Test_Optinum.test_regions_de_confiance(false,Regions_De_Confiance)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end


# Tester l'algorithme du Lagrangien Augmenté
printstyled("Lancement des tests sur ",bold=true,color=:white)
printstyled("le Lagrangien augmenté ",bold=true,color=:blue)
println("")
try
	Test_Optinum.test_Lagrangien_Augmente(false,Lagrangien_Augmente)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end
