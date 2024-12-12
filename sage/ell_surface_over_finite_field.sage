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

# 論文のE_1'
# f = "y^2 - x * (x + (- 1 + 5 * s) * (s - 1)^2) * (x + 4 * s * (- 1 + 5 * s))"

# E_{0,s}^{(1 + 3s)}
f = "y^2 - x * (x - s * (1 + 3 * s) * 4 * s) * (x + s * (1 + 3 * s) * (s - 1)^2)"

print("f:", f)
p = 5
print("p:", p)
for m in range(1,5):
    q = p^m
    print("m:", m)
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
    print("t:", count - 1 - p ^ (2 * m) - 18 * 17^m)
    print("")