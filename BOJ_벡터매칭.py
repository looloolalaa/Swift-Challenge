# 벡터들의 합 특징
from itertools import combinations

for _ in range(int(input())):
    N = int(input())
    arr = [list(map(int, input().split())) for _ in range(N)]
    x_total, y_total = 0, 0
    for x, y in arr:
        x_total += x
        y_total += y


    def vector_sum(a):
        x, y = 0, 0
        for i in a:
            x += arr[i][0]
            y += arr[i][1]
        x -= (x_total - x)
        y -= (y_total - y)

        return (x ** 2 + y ** 2) ** 0.5


    ans = float('inf')
    for a in combinations(range(N), N//2):
        ans = min(ans, vector_sum(a))

    print(ans)
