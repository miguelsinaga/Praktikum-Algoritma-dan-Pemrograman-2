#include <stdio.h>

void catalan_memo(int n, long long *result, long long memo[]) {
    if (memo[n] != -1) {
        *result = memo[n];
        return;
    }

    if (n <= 1) {
        memo[n] = 1;    // matematis: C(0)=1, C(1)=1
        *result = memo[n];
        return;
    }

    long long total = 0;
    for (int i = 0; i < n; i++) {
        long long left, right;
        catalan_memo(i, &left, memo);
        catalan_memo(n - 1 - i, &right, memo);
        total += left * right;
    }

    memo[n] = total;
    *result = total;
}

int main() {
    int n;
    if (scanf("%d", &n) != 1) return 0;

    if (n == 0) {
        printf("0\n");
        return 0;
    }

    long long memo[21];
    for (int i = 0; i <= 20; ++i) memo[i] = -1;

    long long ans;
    catalan_memo(n, &ans, memo);

    printf("%lld\n", ans);
    return 0;
}
