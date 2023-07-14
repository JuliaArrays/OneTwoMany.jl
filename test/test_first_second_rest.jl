# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).

using OneTwoMany
using Test

include("testcases.jl")

@testset "hello_world" begin
    @test @inferred(first_and_rest(A)) == (41, [42, 3, 5, 9])
    @test @inferred(first_and_rest(tpl)) == (41, (42, 3, 5, 9))
    @test @inferred(first_and_rest(nt)) == (41, (b = 42, c = 3, d = 5, e = 9))
    @test @inferred(first_and_rest(pair)) == (:answer, (42, ))
    @test @inferred(first_and_rest(str)) == ('H', "ello, World!")
    @test collect.(@inferred(first_and_rest(itr))) == collect.((2, (2 * i for i in 2:10)))
    @test_throws ArgumentError first_and_rest((2 * i for i in 1:0))


    @test @inferred(first_second_rest(A)) == (41, 42, [3, 5, 9])
    @test @inferred(first_second_rest(tpl)) == (41, 42, (3, 5, 9))
    @test @inferred(first_second_rest(nt)) == (41, 42, (c = 3, d = 5, e = 9))
    @test @inferred(first_second_rest(pair)) == (:answer, 42, ())
    @test @inferred(first_second_rest(str)) == ('H', 'e', "llo, World!")
    @test collect.(@inferred(first_second_rest(itr))) == collect.((2, 4, (2 * i for i in 3:10)))
    @test_throws ArgumentError first_second_rest((2 * i for i in 1:1))
end
