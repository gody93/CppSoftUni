CC=g++
CFLAGS=-c -ggdb
LDFLAGS=
SOURCES=main.cpp Person.cpp Teacher.cpp Student.cpp GuestTeach.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=main

all: $(SOURCES) $(EXECUTABLE)
    
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
clean:
	rm *o main
