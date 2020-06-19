using Markdown
using Test
using LinearAlgebra
using TestOptinum
using SujetOptinum

include("../src/Algorithme_De_Newton.jl")
include("../src/Gradient_Conjugue_Tronque.jl")
include("../src/Lagrangien_Augmente.jl")
include("../src/Pas_De_Cauchy.jl")
include("../src/Regions_De_Confiance.jl")

TestOptinum.cacher_stacktrace()

# Tester l'algorithme de Newton
try
	TestOptinum.tester_Algo_Newton(false,Algorithme_De_Newton)
catch e
	printstyled("$e \n",bold=true,color=:red)
end

# Tester l'algorithme du pas de Cauchy
try
	TestOptinum.tester_pas_de_cauchy(false,Pas_De_Cauchy)
catch e
	printstyled("$e \n",bold=true,color=:red)
end

# Tester l'algorithme du gradient conjugué tronqué
try
	TestOptinum.tester_gct(false,Gradient_Conjugue_Tronque)
catch e
	printstyled("$e \n",bold=true,color=:red)
end

# Tester l'algorithme des Régions de confiance avec PasdeCauchy | GCT
try 
	TestOptinum.tester_regions_de_confiance(false,Regions_De_Confiance)
catch e
	printstyled("$e \n",bold=true,color=:red)
end

# Tester l'algorithme du Lagrangien Augmenté
try
	TestOptinum.tester_Lagrangien_Augmente(false,Lagrangien_Augmente)
catch e
	printstyled("$e \n",bold=true,color=:red)
end
