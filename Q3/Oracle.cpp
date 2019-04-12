
#include "Oracle.h"

Oracle::Oracle(std::string name){

  std::cout << "oracle created" << std :: endl;
  Name = name;
}

bool marry(Human& a,Human& b){

  if( (a.spous == NULL) && (b.spous == NULL) && (a.getAge() >= 18) && (b.getAge() >= 18) )
    {
        a.spous = &b;
        b.spous = &a;
        return true;
    }
  else return false;
  

}
