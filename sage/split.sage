K.<s> = PolynomialRing(QQ)
R.<T> = K[]

# 論文の E_1'
sp = T^2 - 5*s^3 - 9*s^2 - 3*s + 1
multiplicative_fibers = [0, 1, 3+2*sqrt(2), 3-2*sqrt(2)]
for s_val in multiplicative_fibers:
    sp_val = sp.subs(s=s_val)
    print(s_val, factor(sp_val))

# E_{0,s}^{(1 + 3s)}
sp = T^2 - 3*s^3 + 17*s^2 + 3*s - 1
multiplicative_fibers = [0, 1, -1]
for s_val in multiplicative_fibers:
    sp_val = sp.subs(s=s_val)
    print(s_val, factor(sp_val))