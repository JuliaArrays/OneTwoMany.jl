# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).

_valid_iterate_output_1(::Nothing) = throw(ArgumentError("Iterable must contain at least one element."))
@inline _valid_iterate_output_1(x_state::Tuple{<:Any,<:Any}) = x_state

_valid_iterate_output_2(::Nothing) = throw(ArgumentError("Iterable must contain at least two elements."))
@inline _valid_iterate_output_2(x_state::Tuple{<:Any,<:Any}) = x_state
