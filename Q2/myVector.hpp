
#ifndef MYVECTOR_HPP
#define MYVECTOR_HPP


#include <iostream>
#include "myVector.h"

template<class T> 
myVector<T>::myVector(){
  std::cout << " vector  constructor"<< std::endl;
  size = 0;
  capacity = 0;


}

template<class T> 
myVector<T>::myVector(const myVector<T>& myvec){
  std::cout << " vector   copy constructor"<< std::endl;
  size = myvec.size;
  capacity = myvec.capacity;
  
  arr = new T[capacity];
  
  for(int i{0}; i < size ; i++)
    arr[i] = myvec.arr[i];
  
}
template<class T> 
myVector<T>::myVector( myVector<T>&& a){

  std::cout <<"vector  move constructor " << std::endl;
  size = a.size;
  capacity = a.capacity;
  arr = a.arr;
  a.arr = NULL;
 }
template<class T>
myVector<T>:: ~myVector(){
  std::cout << "delete vector "<< std::endl;


  if(capacity != 0)
    delete [] arr;


}
template<class T>
void myVector<T>:: push_back(T number){

  if(capacity == 0)
    {
      arr = new T[1];
      arr[0]= number;
      capacity =1;
      size ++;
      return;

    }
  
  
  size++;
  if(size <= capacity)
    arr[ size -1 ] = number;
  else
    {
      T* copy = new T[2*capacity];
      for( int i{0}; i < capacity ; i++ )
        copy[i] = arr[i];

      delete []arr;

      arr = copy;
      capacity = 2*capacity;
      copy = NULL;

      arr[size -1 ] = number ;
      
    }
  return;
}
template<class T> 
void myVector<T>::pop_back(){
  if (size == 0)
    {
      std::cout << "vector is empty " << std::endl;
      return;
    }

  size--;
  if( size <= (capacity / 2) )
    {
       T* copy = new T[capacity / 2];
      for( int i{0}; i < size ; i++ )
        copy[i] = arr[i];

      delete []arr;

      arr = copy;
      capacity = capacity / 2;
      copy = NULL;
    }
}

template<class T> 
void myVector<T>::show(){

  for(int i{0}; i < size ; i++)
    std::cout << arr[i] <<"   ";
  std::cout << std::endl;

}
template<class T> 
int myVector<T>::getsize(){
  return size;
}
template<class T> 
int  myVector<T>::getcapacity(){
  return capacity;
}

template<class T> 
bool myVector<T>::operator<(const myVector& myvec) const{

  return (size < myvec.size);

}
template<class T> 
bool myVector<T>::operator==(const myVector<T>& myvec)const{

  return (size == myvec.size);
  
}
/*
int myVector::operator.(const myVector& myvec) const{

  int sum{0};
  

  if( size <= myvec.size)
    {
      for(int i{0} ; i < size ;i++)
	sum += arr[i]* myvec.arr[i];
    }
  else
    {
       for(int i{0} ; i < size ;i++)
	sum += arr[i]* myvec.arr[i];
    }

  return sum;
}

*/

template<class T> 
myVector<T> myVector<T> ::operator+(const myVector<T>& a){
  myVector h;
  if( size < a.size )
    {
      for ( int i{0} ; i < size ; i++)
	h.push_back( arr[i] + a.arr[i]);
      for ( int j{size} ; j < a.size ;j++ )
	h.push_back ( a.arr[j]);
		   	    

    }
  else{

      for ( int i{0} ; i < a.size ; i++)
	h.push_back( arr[i] + a.arr[i]);
      for ( int j{size} ; j < size ;j++ )
	h.push_back ( arr[j]);

  }
  return h;

}
template<class T> 
myVector<T>& myVector<T>::operator=(const myVector<T>& a){
  std::cout <<"  = copy version " << std::endl;
  if( this == &a )
    return *this;

  delete []arr;
  size = a.size;
  arr = new T [ capacity ];
  capacity = a.capacity;
  for(int i{0} ; i < size ; i++)
    arr[i] = a.arr[i];
  


  return *this;
}

#endif

