
#include <iostream>
#include "myVector.hpp"
#include <utility>

using namespace std::rel_ops;
int main(){

  myVector<int> a;    //creat empty vector
  myVector<int> b;
   
  for( int i{0} ; i < 9 ; i++ )  //showing how size and capacity increase
    {
      a.push_back(i);
      std::cout <<"size = " <<  a.getsize()  << "   capacity = "
		<< a.getcapacity() <<std::endl;

    }
  
  for( int i{15} ; i > 4 ; i--)
    b.push_back(i);


  a.show();        //show vectors
  b.show();
                         
  myVector<int> c{a+b};   //creat new  vector with copy 
  
  std::cout <<"size = " <<  c.getsize()  << "   capacity = "
		<< c.getcapacity() <<std::endl;
  c.show();

  b.pop_back();
  b.pop_back();
  c = a + b;   // using = operator
  c. show();

  
  myVector<int> d;
  
  for ( int i{0} ; i < 7 ; i++ )   //show < = > how work
    {
     if( d < c)
       std::cout << " d <  c" <<std::endl;
     else if ( d == c )
       std::cout << " d = c" <<std::endl;
     else if ( d > c )
        std::cout << " d > c" <<std::endl;

     d.push_back(i);
     d.push_back(i+1);
    }

  myVector<double> e;   //creat vector type double
  e.push_back(2.5);
  e.push_back(3.4);
  e.push_back(2.6789);
  e.push_back(3.145678);

  e.show();
  myVector<double> f{e};  // creat copy vector type double

  //show size and capacity changes 
  std::cout <<"size = " <<  f.getsize()  << "   capacity = "   
         	<< f.getcapacity() <<std::endl;
  f.pop_back();
  f.pop_back();

  std::cout <<"size = " <<  f.getsize()  << "   capacity = "
	    << f.getcapacity() <<std::endl;
  
  
  


  return 0;
  
 }



