# This file is a part of OneTwoMany.jl, licensed under the MIT License (MIT).


"""
    firstarg(args...)

Returns the first elements of `args...`.
"""
function firstarg end
export firstarg

firstarg() = throw(ArgumentError("firstarg requires at least one argument, none given"))
@inline firstarg(a, @nospecialize(args...)) = a


"""
    secondarg(args...)

Returns the second elements of `args...`.
"""
function secondarg end
export secondarg

secondarg() = throw(ArgumentError("secondarg requires at least one argument, none given"))
secondarg(@nospecialize(a)) = throw(ArgumentError("secondarg requires at least two argument, only one given"))
@inline secondarg(@nospecialize(a), b, @nospecialize(args...)) = b
