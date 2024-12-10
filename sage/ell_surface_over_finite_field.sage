def zeros_count(q,f_str):
    F = GF(q)
    R = PolynomialRing(F, ('x', 'y', 's'))

    x, y, s = R.gens()
    f = R(f_str)

    singular_filbers = []
    count = 0
    for s_val in F:
        try:
            fs = f.subs(s=s_val)
            Es = EllipticCurve(fs)
            count += Es.cardinality()
        except ArithmeticError:
            singular_filbers.append(s_val)
    print("singular_filbers:", singular_filbers)
    return count
    
p = 17
m = 1
q= p^m
f = "y^2 - x * (x + (- 1 + 5 * s) * (s - 1)^2) * (x + 4 * s * (- 1 + 5 * s))"
print("p:", p)
print("m:", m)
print("f:", f)
count = zeros_count(q,f)
# I_2 * 3
count += 2 * q * 3
# I_4
count += 4 * q
# I_0^*
count += 5 * q + 1
# I_2^*
count += (2 + 5) * q + 1
print(count)