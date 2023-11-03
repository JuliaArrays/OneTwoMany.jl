# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).

using OneTwoMany
using Test

include("testcases.jl")

@testset "arg1_arg2" begin
    @test_throws ArgumentError firstarg()
    @test @inferred(firstarg(3)) == 3
    @test @inferred(firstarg(3, 4)) == 3
    @test @inferred(firstarg(3, 4, 5)) == 3

    @test_throws ArgumentError secondarg()
    @test_throws ArgumentError secondarg(3)
    @test @inferred(secondarg(3, 4)) == 4
    @test @inferred(secondarg(3, 4, 5)) == 4
end
