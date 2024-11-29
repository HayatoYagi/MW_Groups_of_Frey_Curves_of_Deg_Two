def zeros_count(q,f_str):
    F = GF(q)
    R = PolynomialRing(F, ('x', 'y', 's'))
    x, y, s = R.gens()
    f = R(f_str)
    cnt = 0
    for x_val in F:
        print(x_val, "/", q)
        for y_val in F:
            for z_val in F:
                # Check if the polynomial evaluates to 0
                if f(x_val, y_val, z_val) == 0:
                    cnt += 1
    return cnt

p = 17
m = 2
q = p^m
f = "-(-1+5*s)*y^2-x*(x-(s-1)^2)*(x-4*s)"
print("q:", q)
print("f:", f)
print(zeros_count(q,f))