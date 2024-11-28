# Ks.<s> = FunctionField(QQbar)
s = var('s')
K.<t> = FunctionField(CC)

# y^2 = x (x - a^2) (x + b^2) を s で parametrize したもの
E1 = EllipticCurve([0,(s^2-1)^2-4*s^2,0,-4*s^2*(s^2-1)^2,0])
T1 = E1(0,0)
T2 = E1(2*s*(s+1)^2,2*s*(s+1)^2*(s^2+1))
T22 = E1(4*s^2,0)
T3 = E1(I*2*s*(s^2-1),2*I*s*(s+I)^2*(s^2-1))
print(2*T2-T22)
print(T1+T22)
print(factor(E1.discriminant()))

E1_twisted = EllipticCurve([
  0,
  (1+3*s^2)*((s^2-1)^2-4*s^2),
  0,
  -4*s^2*(s^2-1)^2*(1+3*s^2)^2,
  0
])
print(factor(E1_twisted.discriminant()))

# E1_twisted で s = 1 / s
E1_twisted_transformed = EllipticCurve([
  0,
  (s^2+3)*((1-s^2)^2-4*s^2),
  0,
  -4*s^2*(1-s^2)^2*(s^2+3)^2,
  0
])
print(factor(E1_twisted_transformed.discriminant()))

# y^2 = x (x - a^2) (x - b^2) を s で parametrize したもの
E2 = EllipticCurve([0,-(s^2-1)^2-4*s^2,0,4*s^2*(s^2-1)^2,0])
print(factor(E2.discriminant()))

E2_transformed = E2.change_weierstrass_model(1,-1-sqrt(2),0,0)
print(factor(E2_transformed.discriminant()))

# E1 で s = 2t/(t^2-3) としたもの
E4 = EllipticCurve([0, (((2*t)/(t^2-3))^2-1)^2-4*((2*t)/(t^2-3))^2, 0, -(2*((2*t)/(t^2-3)))^2*(((2*t)/(t^2-3))^2-1)^2, 0])
P = E4(((2*t)/(t^2-3))^2-1,i*((2*t)/(t^2-3))*(((2*t)/(t^2-3))^2-1)*(t^2+3)/(t^2-3))

# print(E.j_invariant())
# print(E.conductor())

# print(E.rank())
# print(E.torsion_subgroup())

# E1 = E.reduction(Place(t-1))

K.<t> = FunctionField(QQ)

# 変数変換により分母消したもの
E3_transformed = EllipticCurve([
  0,
  -(t^4+6*t^2+25)^2-16*t^2*(t^2+5)^2,
  0,
  16*t^2*(t^2+5)^2*(t^4+6*t^2+25)^2,
  0
])
print(factor(E3_transformed.discriminant()))

E4_transformed = EllipticCurve([
  0,
  -16*t^2*(t^2-3)^2+(4*t^2-(t^2-3)^2)^2,
  0,
  -16*t^2*(t^2-3)^2*(4*t^2-(t^2-3)^2)^2,
  0
])
print(factor(E4_transformed.discriminant()))

# E4_transformed で t = 1 / t' としたもの
E4_inversed = EllipticCurve([
  0,
  -16*t^2*(1-3*t^2)+(4*t^2-(1-3*t^2)^2)^2,
  0,
  -16*t^2*(1-3*t^2)*(4*t^2-(1-3*t^2)^2)^2,
  0
])
print(factor(E4_inversed.discriminant()))
