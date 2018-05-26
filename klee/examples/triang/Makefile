CXXFLAGS = $(shell llvm-config --cxxflags) -fno-rtti

all: live.so

live.o: LivenessPass.cpp LivenessPass.h
	$(CXX) $(CXXFLAGS) -std=c++11 LivenessPass.cpp -c -o $@

live.so: live.o
	$(CXX) -shared $^ -o $@

clean:
	rm -f *.o *~ *.so *.ll *.bc *.out ready/*
