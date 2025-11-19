#include <stdio.h>
#include <stdlib.h>
#include "list.h"
List removeDuplicates(List l) {
    if (isEmpty(l) || isOneElmt(l)) {
        return copy(l);
    }

    if (head(l) == head(tail(l))) {
        ElType x = head(l);
        List rest = tail(l);
        while (!isEmpty(rest) && head(rest) == x) {
            rest = tail(rest);
        }

        return removeDuplicates(rest);  
    } else {
        return konso(head(l), removeDuplicates(tail(l)));
    }
}


