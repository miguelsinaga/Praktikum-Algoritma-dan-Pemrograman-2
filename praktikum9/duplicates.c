
#include "list.h"
#include <stdio.h>
List deleteDuplicates(List l) {
    
    if (isEmpty(l) || isOneElmt(l)) {
        return copy(l);
    }

    if (head(l) == head(tail(l))) {
        ElType x = head(l);
        List rest = tail(l);
        while (!isEmpty(rest) && head(rest) == x) {
            rest = tail(rest);
        }
        return deleteDuplicates(rest);
    } else {
        return konso(head(l), deleteDuplicates(tail(l)));
    }
}
