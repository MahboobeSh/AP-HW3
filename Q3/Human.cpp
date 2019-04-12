#include <iostream>
#include "Human.h"
#include <ctime>


Human::Human(std::string firstName,std::string lastName,int hairColor,int eyeColor ,int age, bool gender, int numberOfchildren){

  std::cout << " human created " << std::endl;
  this->firstName = firstName;
  this->lastName = lastName;
  this->hairColor = hairColor;
  this->eyeColor = eyeColor;
  this->age = age;
  this->gender = gender;
  this->numberOfchildren = numberOfchildren;
  Mother = NULL;
  Father = NULL;
  spous = NULL;

}


Human::Human( const Human& a){

  std::cout << " human  copy constructor " << std::endl;
  this->firstName = a.firstName;
  this->lastName = a.lastName;
  this->hairColor = a.hairColor;
  this->eyeColor = a. eyeColor;
  this->age = a. age;
  this->gender = a.gender;
  this->numberOfchildren =a. numberOfchildren;
  Mother = a.Mother;
  Father =a.Father;
  spous = a.spous;

  if( numberOfchildren !=0 )
    {

      children = new Human*[numberOfchildren];
       for( int i{0} ; i < numberOfchildren  ; i++ )
		children[i] =  children [i];
	
    }
}



Human::Human( Human&& a){

  std::cout << " human  move constructor " << std::endl;
  this->firstName = a.firstName;
  this->lastName = a.lastName;
  this->hairColor = a.hairColor;
  this->eyeColor = a. eyeColor;
  this->age = a. age;
  this->gender = a.gender;
  this->numberOfchildren = a.numberOfchildren;
  Mother = a.Mother;
  Father =a.Father;
  spous = a.spous;
  children = a.children;
  a.children = NULL;
}
Human::~Human(){
  std::cout << "human deleted " << std::endl;
  if(numberOfchildren !=0)
    delete [] children;

}
bool Human::getGender(){
  return gender;
}
int Human::getHairColor(){
  return hairColor;
}
int Human::getEyeColor(){
  return eyeColor;
}
int Human::getAge(){
  return age;
}
void Human::setGender(bool a){
  gender = a;
  return;
}
void Human::setHairColor(int a){
  hairColor = a;
  return;
}
void Human::setEyeColor(int a){
  eyeColor = a;
  return;
}
void Human::setAge(int a){
  age = a;
  return;
}

void Human::setFirstName(std::string a){
  firstName = a;
    return ;

}
 
bool Human:: operator>(Human& a){
  if( age > a.getAge())
    return true;
  return false;
}
bool Human:: operator==(Human& a){
  if( (age== a.getAge()) && (gender == a.getGender()) &&
      (hairColor == a.getHairColor()) && (eyeColor == a.getEyeColor()))
    return true;
  return false;
}
Human Human::operator+(Human& a){
  Human* b;
  if( spous == &a )
    {
      if( a.gender )
	{
	 
	   b = new Human {"no name",a.lastName, a.hairColor,eyeColor, 0, 0, 0};
	   b->Mother = this;
           b->Father = &a;
	}
      else
	{
         
	   b = new Human {"no name",a.lastName,hairColor, a.eyeColor, 0, 1, 0};
	   b->Mother = &a;
           b->Father =this;
	   
	}
      Human** copy1 { new Human*[++numberOfchildren]};
      Human** copy2 { new Human*[++a.numberOfchildren]};
      for( int i{0} ; i < numberOfchildren -1 ; i++ )
		copy1[i] =  children [i];
	  
       for( int i{0} ; i <a. numberOfchildren -1 ; i++ )
	  copy2[i] = a.children[i];

      copy1 [ numberOfchildren - 1 ] = b;
      copy2 [ a.numberOfchildren - 1 ] = b;

      if( numberOfchildren > 1 )
	delete [] children;
  
      if( numberOfchildren > 1 )
	delete [] a.children;

      children = copy1;
      a.children = copy2;
      copy1 = NULL;
      copy2 = NULL;
      

    }
  return *b;
  

};
Human& Human::operator++(){
  age++;
  return *this;
  }

Human Human::operator++(int){
  Human a{*this};
  age++;
  return a;
  }



bool Human::isFatherOf(Human& a){

  if(a.Father == this)
    return true;
  return false;
}

bool Human::isMotherOf(Human& a){

  if(a.Mother == this)
    return true;
  return false;
}
bool Human::isChildOf(Human& a){

  for( int i{0} ; i < numberOfchildren ; i++ )
    {
      if( a.children[i] == this )
	return true;
    }
  return false;


}
