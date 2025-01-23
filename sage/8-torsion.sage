def my_factor(f):
    if f == 0:
        return 0
    return factor(f)

# s, x, y = var('s x y')
R.<s, x, y> = QQ[]

lh = 2*s*(s+1)^2
rh_numerator = 16 * s^4 * (s^2-1)^4 + 8 * s^2 * (s^2-1)^2 * x^2 + x^4
rh_denominator = 4 * x * (x-4*s^2) * (x + (s^2 - 1)^2)


f = rh_numerator - lh * rh_denominator
f = f.subs(x = y + 2 * s * (s+1)^2)
print(f)

g = y^4-f
print(g)
for i in range(5):
    # g の y^i の係数を取得し latex 形式で出力
    print(i, latex(my_factor(g.coefficient(y^i))))

print(latex(factor(g)))