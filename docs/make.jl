# Use
#
#     DOCUMENTER_DEBUG=true julia --color=yes make.jl local [nonstrict] [fixdoctests]
#
# for local builds.

using Documenter
using OneTwoMany

# Doctest setup
DocMeta.setdocmeta!(
    OneTwoMany,
    :DocTestSetup,
    :(using OneTwoMany);
    recursive=true,
)

makedocs(
    sitename = "OneTwoMany",
    modules = [OneTwoMany],
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        canonical = "https://JuliaArrays.github.io/OneTwoMany.jl/stable/"
    ),
    pages = [
        "Home" => "index.md",
        "API" => "api.md",
        "LICENSE" => "LICENSE.md",
    ],
    doctest = ("fixdoctests" in ARGS) ? :fix : true,
    linkcheck = !("nonstrict" in ARGS),
    strict = !("nonstrict" in ARGS),
)

deploydocs(
    repo = "github.com/JuliaArrays/OneTwoMany.jl.git",
    forcepush = true,
    push_preview = true,
)
