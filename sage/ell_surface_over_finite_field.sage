def zeros_count(p,m,twist_str, rh_str):
    q = p^m
    F = GF(q)
    R = PolynomialRing(F, ('x', 'y', 's'))

    x, y, s = R.gens()
    twist = R(twist_str)
    rh = R(rh_str)

    squares_count: dict[F,int] = {}
    for x_val in F:
        if x_val^2 not in squares_count:
            squares_count[x_val^2] = 0
        squares_count[x_val^2] += 1
    # print(squares_count)

    cnt = 0
    progress = 0
    for s_val in F:
        progress += 1
        print(round(progress*100/q,2), "%")
        twist_val = twist(0, 0, s_val)
        if twist_val == 0:
            cnt += q*3
        else:
            for x_val in F:
                y2 = rh(x_val, 0, s_val)/twist_val
                if y2 in squares_count:
                    cnt += squares_count[y2]

    # 無限遠点
    cnt += q*(p-1)+1

    return cnt

p = 17
m = 3
twist = "-(-1+5*s)"
rh = "x*(x-(s-1)^2)*(x-4*s)"
print("p:", p)
print("m:", m)
print("f:", twist, "y^2 =", rh)
print(zeros_count(p,m,twist,rh))