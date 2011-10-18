
#include "permutation.hpp"

#include <iostream>
using namespace std;

int main() {
    Permutation p1(6);
    Permutation p2(6);
    
    p1[0] = 5; p1[1] = 4; p1[2] = 1; p1[3] = 3; p1[4] = 2; p1[5] = 0;
    p2[0] = 1; p2[1] = 0; p2[2] = 3; p2[3] = 2; p2[4] = 5; p2[5] = 4;
    cout << p1;
    cout << p2;
    
    cout << (p1 * p2);
    cout << ~p1;
    return 0;
}
