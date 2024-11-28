K.<s> = FunctionField(QQ)
R.<x,y> = K[]

def tate(f):
    E = EllipticCurve(f)
    print("[" + str(E.a1()) + ", " + str(E.a2()) + ", " + str(E.a3()) + ", " + str(E.a4()) + ", " + str(E.a6()) + "]")
    print(factor(E.discriminant()))

f = y^2 - (x * (x - (- 1 + 5 * s) * (s - 1)^2) * (x - 4 * s * (- 1 + 5 * s)))
tate(f)