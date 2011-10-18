
#ifndef PERMUTATION_H_
#define PERMUTATION_H_

#include <cstdio>
#include <iostream>
#include <string.h>
using namespace std;

class Permutation 
{
public:
    int size;
    int *data;

    Permutation();
    Permutation(int);
    Permutation(const Permutation &p);    
    ~Permutation();
    
    //operators
    int & operator[] (const int &);
    friend ostream & operator<<( ostream &, const Permutation & );        
    Permutation operator*(const Permutation &) const;
    Permutation operator~() const;
    
};

//DEFINITIONS
Permutation::Permutation() {
    this->size = 0;
    this->data = NULL;
}

Permutation::Permutation(int size) {
    this->size = size;
    this->data = new int[size];
}

Permutation::Permutation(const Permutation &p) {
    this->size = p.size;
    this->data = new int[p.size];
    for(int i = 0; i < p.size; i++) {
        this->data[i] = p.data[i];        
    }
    //memcpy(&(this->data), &(p.data), sizeof(int) * p.size);
}

Permutation::~Permutation() {
    delete [] this->data;
    this->data = NULL;
}


int & Permutation::operator[] (const int &i) {
    return this->data[i];
}

Permutation Permutation::operator*(const Permutation &p) const {
    Permutation result(p.size);
    for(int i = 0; i < p.size; i++) {
        result[i] = this->data[p.data[i]];
    }
    return result;
}

Permutation Permutation::operator~() const {
    Permutation result(this->size);
    for(int i = 0; i < this->size; i++) {
        result[this->data[i]] = i;
    }
    return result;
}

ostream & operator<<( ostream &out, const Permutation &p) {
    Permutation bkp(p);
    
    int pos;
    int temp;

    if(bkp.size >= 1) {
        for(int i = 0; i < bkp.size; i++) {
            pos = i;            
            if(bkp[pos] != pos && bkp[pos] != -1) {
                out << "( " << pos;
                while(bkp[pos] != i && pos != -1) {
                    out << ", " << bkp[pos];
                    temp = bkp[pos];
                    bkp[pos] = -1;
                    pos = temp;
                }
                if(bkp[pos] == i) {
                    bkp[pos] = -1;
                }
                out << " )";
            }
        }
    } else {
        out << "id 0";
    }
    
    out << endl;

    return out;
}

#endif //PERMUTATION_H_
