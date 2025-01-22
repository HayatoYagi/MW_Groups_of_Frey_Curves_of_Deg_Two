K.<s> = FunctionField(QQ)
# K.<s> = FunctionField(GF(17))
R.<x,y> = K[]

def my_factor(f):
    if f == 0:
        return 0
    return factor(f)

def tate(f):
    E = EllipticCurve(f)
    print("[" + str(E.a1()) + ", " + str(E.a2()) + ", " + str(E.a3()) + ", " + str(E.a4()) + ", " + str(E.a6()) + "]")
    print("j:", E.j_invariant())
    print("discriminant:", factor(E.discriminant()))
    print("b2:", my_factor(E.b2()))
    print("b6:", my_factor(E.b6()))
    print("b8:", my_factor(E.b8()))
    DiscP = -4 * E.a2()^3 * E.a6() + E.a2()^2 * E.a4()^2 - 4 * E.a4()^3 - 27 * E.a6()^3 + 18 * E.a2() * E.a4() * E.a6()
    print("DiscP*pi^6:", my_factor(DiscP))
    S.<T> = K[]
    print("sp", T^2 + E.a1() * T - E.a2()) # split or non-split を判定する用の多項式
    print("")

# 論文のE_1
f = y^2 - x * (x - (s - 1)^2) * (x - 4 * s)
tate(f)

# 論文のE_1'
print("E_1'")
f = y^2 - x * (x + (- 1 + 5 * s) * (s - 1)^2) * (x + 4 * s * (- 1 + 5 * s))
tate(f)
f_inf = y^2 - x * (x + s * (-s+5) * (1-s)^2) * (x + 4 * s^2 * (-s+5))
tate(f_inf)

# 論文のE_1"
f = y^2 - x * (x + s * (- 1 + 5 * s) * (s - 1)^2) * (x + 4 * s^2 * (- 1 + 5 * s))
tate(f)

f = y^2 - x * (x - s * (- 1 + 5 * s) * (s - 1)^2) * (x - 4 * s^2 * (- 1 + 5 * s))
tate(f)

# E_{1,s}
print("E_{1,s}")
f = y^2 - x * (x - 4 * s^2) * (x + (s^2 - 1)^2)
tate(f)

# E_{1,s}^{(1 + 3s^2)}
print("E_{1,s}^{(1 + 3s^2)}")
f = y^2 - x * (x - (1 + 3 * s^2) * 4 * s^2) * (x + (1 + 3 * s^2) * (s^2 - 1)^2)
tate(f)

# E_{0,s}
print("E_{0,s}")
f = y^2 - x * (x - 4 * s) * (x + (s - 1)^2)
tate(f)

# E_{0,s}^{(1 + 3s)}
print("E_{0,s}^{(1 + 3s)}")
f = y^2 - x * (x - (1 + 3 * s) * 4 * s) * (x + (1 + 3 * s) * (s - 1)^2)
tate(f)

# E_{0,s}^{(1 + 3s)} (s -> 1/s)
print("E_{0,s}^{(1 + 3s)} (s -> 1/s)")
f = y^2 - x * (x - 4 * s^2 * (s + 3)) * (x + s * (s + 3) * (1 - s)^2)
tate(f)

# E_{0,s}^{(s(1 + 3s))}
print("E_{0,s}^{(s(1 + 3s))}")
f = y^2 - x * (x - s * (1 + 3 * s) * 4 * s) * (x + s * (1 + 3 * s) * (s - 1)^2)
tate(f)

# E_{0,s}^{(s(1 + 3s))} (s -> 1/s)
print("E_{0,s}^{(s(1 + 3s))} (s -> 1/s)")
f = y^2 - x * (x - 4 * s * (s + 3)) * (x + (s + 3) * (1 - s)^2)
tate(f)