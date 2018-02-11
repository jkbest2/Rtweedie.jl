module Rtweedie

using RCall

import Base.rand

export Tweedie,
   rand

reval("library(tweedie)")

"""
    Tweedie{T}
       μ::T
       ξ::T
       ϕ::T

Tweedie distribution. Typically used with 1 < ξ < 2 to give compound
gamma-Poisson. Has positive mass at zero, and is continuous for positive
Reals.
"""
struct Tweedie{T}
    μ::T
    ξ::T
    ϕ::T
end

function rand(Tw::Tweedie, n::Integer = 1)
rtweed = reval("rtweedie($n, xi = $(Tw.ξ), mu = $(Tw.μ), phi = $(Tw.ϕ))")
    rcopy(rtweed)
end

end # module
