#include <stdio.h>
#include <stdlib.h>
#include "list.h"
List merge(List L1, List L2) {
    if (isEmpty(L1)) return copy(L2);
    if (isEmpty(L2)) return copy(L1);

    if (head(L1) <= head(L2)) {
        return konso(head(L1), merge(tail(L1), L2));
    } else {
        return konso(head(L2), merge(L1, tail(L2)));
    }
}

void splitList(List L, List *LLeft, List *LRight) {
    int n = length(L);
    int mid = n / 2;     

    List temp = L;
    *LLeft = NIL;
    for (int i = 0; i < mid; i++) {
        *LLeft = konsDot(*LLeft, head(temp));
        temp = tail(temp);
    }
    *LRight = copy(temp);
}


List mergeSort(List L) {
    if (isEmpty(L) || isOneElmt(L)) {
        return copy(L);
    }

    List L1, L2;
    splitList(L, &L1, &L2);

    List sortedL1 = mergeSort(L1);
    List sortedL2 = mergeSort(L2);

    List merged = merge(sortedL1, sortedL2);
    displayList(merged);
    printf("\n");

    return merged;
}

int main() {
    int n, x;
    scanf("%d", &n);
    List L = NIL;
    for (int i = 0; i < n; i++) {
        scanf("%d", &x);
        L = konsDot(L, x);
    }

    mergeSort(L);

    return 0;
}
