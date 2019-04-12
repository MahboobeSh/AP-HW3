#ifndef MYVECTOR_H
#define MYVECTOR_H


template<class T>

class myVector{

 public:
  myVector();
  ~myVector();
  myVector(const myVector& myvec ) ; 
  myVector(myVector&&);
  void push_back(T);
  void pop_back();
  void show();
  int getsize();
  int getcapacity();

  bool operator<(const myVector&)const;
  bool operator==(const myVector&)const;
  // int operator.(const myVector& , const myVector&) const;
  myVector operator+(const myVector&);
  myVector& operator=(const myVector&);
 
  
 
  
  
  
 private:
  int capacity;
  int size;
  T *arr;
 
  
};

#endif



