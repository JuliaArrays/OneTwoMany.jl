# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).

using OneTwoMany
using Test

include("testcases.jl")

@testset "getsecond" begin
    @test @inferred(getsecond(A)) == 42
    @test @inferred(getsecond(tpl)) == 42
    @test @inferred(getsecond(nt)) == 42
    @test @inferred(getsecond(pair)) == 42
    @test @inferred(getsecond(str)) == '∃'
    @test @inferred(getsecond(itr)) == 4
    @test_throws ArgumentError getsecond((2 * i for i in 1:1))
end
