def zeros_count(q,f_str,sp_str):
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
            S.<T> = R[]
            sp = S(sp_str)
            sp = sp.subs(s=s_val)
            print(s_val, factor(sp))
            singular_filbers.append(s_val)
    print("singular_filbers:", singular_filbers)
    return count

"""
# 論文のE_1'
f = "y^2 - x * (x + (- 1 + 5 * s) * (s - 1)^2) * (x + 4 * s * (- 1 + 5 * s))"
sp = "T^2 - 5*s^3 - 9*s^2 - 3*s + 1"

print("f:", f)
p = 17
print("p:", p)
ts = []
for m in range(1,5):
    q = p^m
    print("m:", m)
    count = zeros_count(q,f,sp)
    # I_2 * 3
    count += 2 * q * 3
    # I_4
    count += 4 * q
    # I_0^*
    count += 5 * q + 1
    # I_2^*
    count += (2 + 5) * q + 1
    # non-split
    if m % 2 == 1:
        count += 4
    print(count)
    tm = count - 1 - p ^ (2 * m) - 18 * p^m
    print("tm:", tm)
    ts.append(tm)
    print("")

print("c1:", -ts[0])
print("c2:", (ts[0]^2 - ts[1]) / 2)
print("c3:", (-ts[0]^3 + 3 * ts[0] * ts[1] - 2 * ts[2]) / 6)
print("c4:", (ts[0]^4 - 6 * ts[0]^2 * ts[1] + 3 * ts[1]^2 + 8 * ts[0] * ts[2] - 6 * ts[3]) / 24)
print("")
print("")
"""


# E_{0,s}^{(1 + 3s)}
f = "y^2 - x * (x - s * (1 + 3 * s) * 4 * s) * (x + s * (1 + 3 * s) * (s - 1)^2)"
sp = "T^2 - 3*s^3 + 17*s^2 + 3*s - 1"
print("f:", f)
p = 5
print("p:", p)
ts = []
for m in range(1,4):
    q = p^m
    print("m:", m)
    count = zeros_count(q,f,sp)
    # I_2
    count += 2 * q
    # I_4 * 2
    count += 4 * q * 2
    # I_0^*
    count += 5 * q + 1
    # I_2^*
    count += (2 + 5) * q + 1
    print(count)
    tm = count - 1 - p ^ (2 * m) - 19 * p^m
    print("tm:", tm)
    ts.append(tm)
    print("")

print("c1:", -ts[0])
print("c2:", (ts[0]^2 - ts[1]) / 2)
print("c3:", (-ts[0]^3 + 3 * ts[0] * ts[1] - 2 * ts[2]) / 6)
