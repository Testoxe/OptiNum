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



Test_Optinum.test_Algo_Newton(false,Algorithme_De_Newton)
Test_Optinum.test_pas_de_cauchy(false,Pas_De_Cauchy)
Test_Optinum.test_regions_de_confiance(false,Regions_De_Confiance)
Test_Optinum.test_Lagrangien_Augmente(false,Lagrangien_Augmente)

