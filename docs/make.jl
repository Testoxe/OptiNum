using Documenter
using SujetOptinum

makedocs(
    modules = [SujetOptinum],
    sitename = "SujetOptinum.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md"	
            ]
    )

deploydocs(
    repo   = "github.com/mathn7/SujetOptinum.git",
    branch = "gh-pages",  
    devbranch = "master",
)
