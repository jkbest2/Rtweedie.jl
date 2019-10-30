module Rtweedie

using RCall
using Distributions

import Base.rand
# import Distributions: logpdf, pdf, cdf, logcdf

export Tweedie,
   rand

"""
    Tweedie{T}
       μ::T
       ξ::T
       ϕ::T

Tweedie distribution. Typically used with 1 < ξ < 2 to give compound
gamma-Poisson. Has positive mass at zero, and is continuous for positive
Reals.
"""
struct Tweedie{T} #<: Distributions.Distribution{Distributions.Univariate,Distributions.Continuous}
    μ::T
    ξ::T
    ϕ::T
end

function rand(Tw::Tweedie{T})::T where T
    ## Convert to Float64 to be passed to R
    ξ = convert(Float64, Tw.ξ)
    μ = convert(Float64, Tw.μ)
    ϕ = convert(Float64, Tw.ϕ)
    rtw = reval("tweedie::rtweedie(1, $(Tw.ξ), $(Tw.μ), $(Tw.ϕ))")
    convert(T, rcopy(rtw))
end

function rand(Tw::Tweedie{T}, n::Integer) where T
    ## Convert to Float64 to be passed to R
    ξ = convert(Float64, Tw.ξ)
    μ = convert(Float64, Tw.μ)
    ϕ = convert(Float64, Tw.ϕ)
    rtw = reval("tweedie::rtweedie($n, $(Tw.ξ), $(Tw.μ), $(Tw.ϕ))")
    rcopy(rtw)
    ## Convert back to T, assuming that is the desired number type
    # convert.(T, rcopy(tw))
end

# function Distributions.logpdf(Tw::Tweedie, y::T) where T
#     dtweed = tw.dtweedie(y, xi = Tw.ξ, mu = Tw.μ, phi = Tw.ϕ)
#     convert(T, rcopy(dtweed))
# end


end # module
