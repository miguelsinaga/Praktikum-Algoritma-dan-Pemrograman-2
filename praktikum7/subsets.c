#include <stdio.h>

int arr[15], subset[15];
int n;

void generate(int index, int start, int k) {
    if (index == k) {
        printf("[");
        for (int i = 0; i < k; i++) {
            printf("%d", subset[i]);
            if (i < k - 1) printf(",");
        }
        printf("]\n");
        return;
    }

    // Rekursi memilih elemen berikut
    for (int i = start; i < n; i++) {
        subset[index] = arr[i];
        generate(index + 1, i + 1, k);
    }
}

int main() {
    scanf("%d", &n);
    
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    // Untuk setiap panjang subset dari 0 sampai n
    for (int k = 0; k <= n; k++) {
        generate(0, 0, k);
    }

    return 0;
}
