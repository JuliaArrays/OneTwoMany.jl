# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).

import Test
import Aqua
import OneTwoMany

Test.@testset "Package ambiguities" begin
    Test.@test isempty(Test.detect_ambiguities(OneTwoMany))
end # testset

Test.@testset "Aqua tests" begin
    Aqua.test_all(
        OneTwoMany,
        ambiguities = true,
        project_toml_formatting = VERSION≥v"1.7"
    )
end # testset
