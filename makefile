CC=g++
CROSS = arm-none-linux-gnueabi-gcc 
CFLAGS= -std=gnu++11
OPENCVFLAGS= `pkg-config --cflags --libs opencv`
OPENCVCFLAGS= `pkg-config --cflags opencv`
OPENCVLIBS= `pkg-config --libs opencv`
THREADFLAGS= -lpthread -lstdc++
LDFLAGS= 
SOURCES=blob.cpp BlobContour.cpp BlobOperators.cpp BlobProperties.cpp BlobResult.cpp ComponentLabeling.cpp main.cpp 
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=blobtest

all: $(SOURCES) $(EXECUTABLE) 
		
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) $(OPENCVCFLAGS) -o $@ $(OPENCVLIBS) $(THREADFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) $(OPENCVCFLAGS) -c  $< $(THREADFLAGS)
	
clean: 
	rm $(OBJECTS) $(EXECUTABLE)

