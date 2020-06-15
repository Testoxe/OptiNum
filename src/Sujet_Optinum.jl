module Sujet_Optinum

using LinearAlgebra
using Test
using Markdown


include("Algorithme_De_Newton.jl")
export  Algorithme_De_Newton

include("Regions_De_Confiance.jl")
export Regions_De_Confiance

include("Pas_De_Cauchy.jl")
export Pas_De_Cauchy

include("Gradient_Conjugue_Tronque.jl") 
export Gradient_Conjugue_Tronque

include("Lagrangien_Augmente.jl")
export Lagrangien_Augmente

end # module
