using Documenter
using Optinum

makedocs(
    modules = [Optinum],
    sitename = "Optinum.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md"	
            ]
    )

deploydocs(
    repo   = "github.com/mathn7/Optinum.git",
    branch = "gh-pages",  
    devbranch = "master",
)