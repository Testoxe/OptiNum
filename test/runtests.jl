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
res = @testset "Test Optinum" begin
	
	# Tester l'algorithme de Newton
	TestOptinum.tester_Algo_Newton(false,Algorithme_De_Newton)

	# Tester l'algorithme du pas de Cauchy
	TestOptinum.tester_pas_de_cauchy(false,Pas_De_Cauchy)

	# Tester l'algorithme du gradient conjugué tronqué
	TestOptinum.tester_gct(false,Gradient_Conjugue_Tronque)

	# Tester l'algorithme des Régions de confiance avec PasdeCauchy | GCT
	TestOptinum.tester_regions_de_confiance(false,Regions_De_Confiance)

	# Tester l'algorithme du Lagrangien Augmenté
	TestOptinum.tester_Lagrangien_Augmente(false,Lagrangien_Augmente)

end
