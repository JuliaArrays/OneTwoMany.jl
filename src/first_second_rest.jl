# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).


"""
    first_and_rest(x)

Returns a tuple that contains the first and the rest of the elements of `x`.

`x` may be an `AbstractArray`, `Tuple`, `NamedTuple`, `Pair`,
`AbstractString`, or an iterable in general.
"""
function first_and_rest end
export first_and_rest

first_and_rest(A::AbstractArray) = (A[begin+0], view(A, (firstindex(A)+1):lastindex(A)))

@inline first_and_rest(tpl::Tuple) = _tpl_first_and_rest(tpl...)
@inline _tpl_first_and_rest(x1, xs...) = (x1, (xs...,))

@inline function first_and_rest(nt::NamedTuple{names}) where names
    x1, xs = first_and_rest(values(nt))
    return x1, NamedTuple{Base.tail(names)}(xs)
end

@inline first_and_rest(pair::Pair) = (pair.first, (pair.second,))

first_and_rest(str::AbstractString) = (str[begin+0], str[begin+1:end])

function first_and_rest(itr)
    x1, state1 = _valid_iterate_output_1(iterate(itr))
    return (x1, Base.Iterators.rest(itr, state1))
end


"""
    first_second_rest(x)

Returns a tuple that contains the first, second, and the rest of the elements of `x`.

`x` may be an `AbstractArray`, `Tuple`, `NamedTuple`, `Pair`,
`AbstractString`, or an iterable in general.
"""
function first_second_rest end
export first_second_rest

first_second_rest(A::AbstractArray) = (A[begin+0], A[begin+1], view(A, (firstindex(A)+2):lastindex(A)))

@inline first_second_rest(tpl::Tuple) = _tpl_first_second_rest(tpl...)
@inline _tpl_first_second_rest(x1, x2, xs...) = (x1, x2, (xs...,))

@inline function first_second_rest(nt::NamedTuple{names}) where names
    x1, x2, xs = first_second_rest(values(nt))
    return x1, x2, NamedTuple{Base.tail(Base.tail(names))}(xs)
end

@inline first_second_rest(pair::Pair) = (pair.first, pair.second, ())

first_second_rest(str::AbstractString) = (str[begin+0], str[begin+1], str[begin+2:end])

function first_second_rest(itr)
    x1, state1 = _valid_iterate_output_2(iterate(itr))
    x2, state2 = _valid_iterate_output_2(iterate(itr, state1))
    return (x1, x2, Base.Iterators.rest(itr, state2))
end
