using Documenter
using Sujet_Optinum

makedocs(
    modules = [Sujet_Optinum],
    sitename = "Sujet_Optinum.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md"	
            ]
    )

deploydocs(
    repo   = "github.com/mathn7/Sujet_Optinum.git",
    branch = "gh-pages",  
    devbranch = "master",
)
