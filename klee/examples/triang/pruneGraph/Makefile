CXXFLAGS = $(shell llvm-config --cxxflags) -fno-rtti

all: prune.so

prune.o: PruneGraph.cpp PruneGraph.h
	$(CXX) $(CXXFLAGS) -std=c++11 PruneGraph.cpp -c -o $@

prune.so: prune.o
	$(CXX) -shared $^ -o $@

clean:
	rm -f *.o *~ *.so *.ll *.bc *.out ready/*
