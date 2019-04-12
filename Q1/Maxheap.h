#ifndef MAXHEAP_H
#define MAXHEAP_H

#include <iostream>
class Maxheap;
std::ostream& operator<<(std::ostream& os ,Maxheap& a);

class Maxheap{
 public:
  Maxheap();
  Maxheap(int* , int);
  Maxheap(const Maxheap& );
  void add(int n);
  void Delete();
  int Max();
  int getHeight();
  int parent(int);
  int LeftChild(int);
  int RightChild(int);
  void printArray();
  int operator[](int);
  int operator+(int);
  int operator-(int);
  void Heapsort();
  ~Maxheap();
  int getSize();
  int* arr;
  
  

 private:
  int size{};
  
  void max_heapify(int*,int,int);
  void build_max_heap(int*,int);
  void add_max_heap(int *, int); 


  




};


#endif
