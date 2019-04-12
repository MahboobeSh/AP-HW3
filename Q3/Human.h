#ifndef HUMAN_H
#define HUMAN_H

#include <string>
#include <iostream>



class Human{
  
 public :
  
  Human(std::string a, std::string b ,int ,int ,int, bool c, int);
  std::string getFirstName();
  std::string getLastName();
  Human(const Human&);
  Human(Human&&);
  bool getGender();
  int getHairColor();
  int getEyeColor();
  int getAge();
  void setGender(bool);
  void setHairColor(int);
  void setEyeColor(int);
  void setAge(int);
  void setFirstName(std::string );
 

  ~Human();

  bool operator>(Human& a);
  bool operator==(Human& a);
  Human& operator++();
  Human operator++(int);
  Human operator+(Human& a);

  bool isFatherOf(Human& a);
  bool isMotherOf(Human& a);
  bool isChildOf(Human& a);

  Human* Mother;
  Human* Father;
  Human* spous;


  

 private:
  std::string firstName;
  std::string lastName;
  int hairColor{};
  int eyeColor{};
  int age{};
  bool gender;
  int numberOfchildren{};
  Human** children;
  
};





#endif
