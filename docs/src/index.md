# OneTwoMany.jl

This package provides utility functions for accessing the second element, as well as the first, second and remaining elements, of iterable objects:

* A function [`getsecond(x)`](@ref): Julia provides the functions `first` and `last`, but not `second` (except for `Dates.second`, which is about seconds in time). `last` can be used to access the second element of a `Tuple` with two elements or a `Pair`, but `getsecond` is clearer semantically. With tuples, it is also safer in cases where the upstream code that generates the tuple might change and generate longer tuples in the future.

* Two functions [`first_and_rest`](@ref) and [`first_second_rest`](@ref) to get both the first (two) element(s) and the rest of an iterable object.

* Two functions [`firstarg`](@ref) and [`secondarg`](@ref) to get that simply return their first, resp. second, argument.

