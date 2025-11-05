#include <stdio.h>

void countWays(int n, int *result) {
    // Basis
    if (n == 1) {
        *result = 1;
        return;
    }
    if (n == 2) {
        *result = 2;
        return;
    }

    int a, b;
    countWays(n - 1, &a);  // hitung f(n-1)
    countWays(n - 2, &b);  // hitung f(n-2)

    *result = a + b;        // f(n) = f(n-1) + f(n-2)
}

void solve(int n) {
    int ans;
    countWays(n, &ans);
    printf("%d\n", ans);
}

int main() {
    int n;
    scanf("%d", &n);
    solve(n);
    return 0;
}
