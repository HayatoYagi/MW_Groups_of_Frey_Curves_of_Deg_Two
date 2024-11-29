# K.<s> = FunctionField(QQ)
K.<s> = FunctionField(GF(17))
R.<x,y> = K[]

def my_factor(f):
    if f == 0:
        return 0
    return factor(f)

def tate(f):
    E = EllipticCurve(f)
    print("[" + str(E.a1()) + ", " + str(E.a2()) + ", " + str(E.a3()) + ", " + str(E.a4()) + ", " + str(E.a6()) + "]")
    print("discriminant:", factor(E.discriminant()))
    print("b2:", my_factor(E.b2()))
    print("b6:", my_factor(E.b6()))
    print("b8:", my_factor(E.b8()))
    DiscP = -4 * E.a2()^3 * E.a6() + E.a2()^2 * E.a4()^2 - 4 * E.a4()^3 - 27 * E.a6()^3 + 18 * E.a2() * E.a4() * E.a6()
    print("DiscP:", my_factor(DiscP))

# 論文のE_1'
f = y^2 - x * (x + (- 1 + 5 * s) * (s - 1)^2) * (x + 4 * s * (- 1 + 5 * s))
tate(f)
f_inf = y^2 - x * (x + s * (-s+5) * (1-s)^2) * (x + 4 * s^2 * (-s+5))
tate(f_inf)
