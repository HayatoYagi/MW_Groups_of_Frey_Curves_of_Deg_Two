def calc(f,q):
    F = GF(q,'a')
    K.<s> = FunctionField(F)
    E = EllipticCurve(K,f)

# # f = "y^2 - (x * (x - (- 1 + 5 * s) * (s - 1)^2) * (x - 4 * s * (- 1 + 5 * s)))"
# f = [0, -5*s^3 - 9*s^2 - 3*s + 1, 0, 100*s^5 - 240*s^4 + 184*s^3 - 48*s^2 + 4*s, 0]
# calc(f,17)


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

q = 17
f = "-(-1+5*s)*y^2-x*(x-(s-1)^2)*(x-4*s)"
print(q,f)
print(zeros_count(q,f))