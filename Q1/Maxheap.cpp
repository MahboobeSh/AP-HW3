
#include <cmath>
#include "Maxheap.h"


Maxheap::Maxheap(){  

  std::cout << "empty maxheap created " << std::endl;
  size = 0;
  

}

Maxheap::Maxheap(int* input,int n){

  std::cout << " maxheap created with input array" << std::endl;
  size = n;
  arr = new int[n];
  for( int i{0} ; i < size ; i++)
    arr[i] = input[i];

  build_max_heap(arr , size );
  

}
Maxheap::Maxheap(const Maxheap& myheap){

  std::cout << " maxheap created with copy constructor" << std::endl;
  size = myheap.size;
  arr = new int[size];
  for( int i{0} ; i < size ; i++)
    arr[i] = myheap.arr[i];  

}
Maxheap::~Maxheap(){

  std::cout << " maxheap deleted " << std::endl;
  if ( size != 0)
  delete [] arr;
  
}

void Maxheap::add(int Key){

  int* copy = new int[size+1];
  for( int i{0} ; i < size ; i++)
    copy[i] = arr[i];
  
  copy[size] = Key;
  size++;
  if( size !=1)
    delete []arr;
  
  arr = copy;      //change maxheap array
  copy = NULL;
  add_max_heap(arr , size-1); 

  return;
}

void Maxheap::Delete(){

  int* copy = new int[size-1];
  for( int i{1} ; i < size ; i++)
    copy[i-1] = arr[i];
  

  size--;
  delete []arr;
  arr = copy;
  copy = NULL;
  build_max_heap(arr,size);
}

int Maxheap::Max(){
  return arr[0];
}

int Maxheap:: getHeight(){
  
  if(size == 0) return 0;
  else
  return static_cast<int>(std::log2(size))+1;
}

int Maxheap::parent(int n){
  
  if ( n < size )
    {
      if( (n % 2) == 1)
        return arr[n/2];
      else
	return arr[(n-1)/2];
    }
  else
    return 0;

}
int Maxheap::LeftChild(int n){
  if( (2*n+1) < size )
    return arr[ 2*n+1 ];
  else
    return 0;

}

int Maxheap::RightChild(int n){
  if((2*n+2) < size )
    return arr[ 2*n+2];
  else
    return 0;
}

void Maxheap:: printArray(){
  for(int i{0} ; i < size ; i++)
    std::cout << arr[i] << "  " ;
  std::cout << std::endl;
  return;
}

int Maxheap::operator[](int n){
  return arr[n];
}

void Maxheap::Heapsort(){

  // bilud_max_heap(arr,size);
  /* for(int i{size} ; i > 1; i-- )
    {
      std::swap( arr[i-1] ,arr[0] );
      max_heapify(arr,i-1,0);
      }*/
  for(int i{1} ;i< size; i++ )
    {
      max_heapify(&arr[i],size-i,0);
    }
  return;
}


int Maxheap::getSize(){
  return size;
}

void Maxheap::build_max_heap(int* arr,int length){
  
  for(int i{length/2} ; i >= 0 ; i-- )
    max_heapify(arr,length,i);

  return;
}

void Maxheap::max_heapify(int* arr ,int length , int i){

  int left{2*i+1};
  int right{2*i+2};
  int largest{i};

  if( (left < length) && ( arr[left] > arr[i]))    //find largest number index
      largest = left;
  if( (right < length) && ( arr[right] > arr[largest]) )
    largest = right;
  if(largest != i)
    {
      std::swap( arr[i] , arr[largest]);
      max_heapify(arr , length ,largest);
    }
  return;
  
}
void Maxheap::add_max_heap(int* arr, int i){
  if( i == 0 )
    return;

  int x{i/2};
  if( i % 2 == 0)
    x = ( i -1)/2;

  if(arr[x] < arr[i])
    {
       std::swap( arr[x] ,arr[i]);
        add_max_heap(arr,x);
    }
  return;  
}

std::ostream& operator<<(std::ostream& os ,Maxheap& a){

  int temp = 0 ;                                
  for( int i{0} ; i < a.getHeight() ; i++)         //write maxheap in os
    {
      for( int j{0} ; j < static_cast<int>( std::pow(2,i)) ; j++)
        {
	  if(temp < a.getSize())
	  {
            os << a.arr[temp] << "," ;
	    temp++;
	  }
	 else
	   break;
        }
      os << "\n";
    }
 
  return os;

}
