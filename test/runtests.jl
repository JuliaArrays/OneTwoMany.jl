# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).

import Test

Test.@testset "Package OneTwoMany" begin
    include("test_aqua.jl")
    include("test_getsecond.jl")
    include("test_first_second_rest.jl")
    include("test_docs.jl")
    include("test_arg1_arg2.jl")
end # testset
