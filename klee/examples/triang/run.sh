#! /bin/sh
rm -f *.ll *.bc ./input ./output
rm -f mapFile
rm -f pathFile
make clean
clang -I ../../include -emit-llvm -c -g $1.c
cp $1.bc input.bc
llvm-dis input.bc -o input.ll
make

opt -load ./live.so -path input.bc -o output.bc 

g++ --std=c++11 -c bb_rec.cpp -o bb_rec.o
ar rcs bb_rec.a bb_rec.o
clang++ output.bc ./bb_rec.a -o a.out

./a.out $2 $3 $4

python dumpPath.py mapFile pathFile

echo ----Live----
