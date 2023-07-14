# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).

using Test
using OneTwoMany
import Documenter

Documenter.DocMeta.setdocmeta!(
    OneTwoMany,
    :DocTestSetup,
    :(using OneTwoMany);
    recursive=true,
)
Documenter.doctest(OneTwoMany)
