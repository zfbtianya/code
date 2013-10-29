function quadratic(f)
    f1 = derivative(f)
    c = f(0.0)
    b = f1(0.0)
    a = f(1.0) -b -c
    return (-b+sqrt(b^2-4a*c + 0im))/2a,(-b-sqrt(b^2-4a*c + 0im))/2a
end

function derivative(f)
    return function(x)
        h = x==0 ? sqrt(eps(Float64)) : sqrt(eps(Float64)) * x
        xph = x + h
        dx = xph - x
        f1 = f(xph)
        f0 = f(x)
        return (f1 - f0)/dx
    end
end
