# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).


"""
    getsecond(x)

Return the second element of `x`.

`x` may be an `AbstractArray`, `Tuple`, `NamedTuple`, `Pair`,
`AbstractString`, or an iterable in general.
```
"""
function getsecond end
export getsecond

getsecond(A::AbstractArray) = A[begin+1]

@inline getsecond(tpl::Tuple) = tpl[2]

@inline getsecond(nt::NamedTuple) = nt[2]

@inline getsecond(pair::Pair) = pair.second

getsecond(str::AbstractString) = str[nextind(str, firstindex(str))]

function getsecond(itr)
    _, state1 = _valid_iterate_output_2(iterate(itr))
    x2, _ = _valid_iterate_output_2(iterate(itr, state1))
    return x2
end
