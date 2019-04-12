CXX = g++
CXXFLAGS = -std=c++17 -Wall -c
LXXFLAGS = -std=c++17
OBJECTS = main.o Human.o Oracle.o
TARGET = main


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
main.o: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp
Human.o: Human.cpp Human.h
	$(CXX) $(CXXFLAGS) Human.cpp
Oracle.o: Oracle.cpp Oracle.h Human.h
	$(CXX) $(CXXFLAGS) Oracle.cpp
clean:
	rm -f $(TARGET) $(OBJECTS)
