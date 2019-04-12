CXX = g++
CXXFLAGS = -std=c++17 -Wall -c
LXXFLAGS = -std=c++17
OBJECTS = main.o Maxheap.o
TARGET = main


$(TARGET): $(OBJECTS)
	$(CXX) $(LXXFLAGS) $(OBJECTS) -o $(TARGET)
main.o: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp
Maxheap.o: Maxheap.cpp Maxheap.h
	$(CXX) $(CXXFLAGS) Maxheap.cpp
clean:
	rm -f $(TARGET) $(OBJECTS)
