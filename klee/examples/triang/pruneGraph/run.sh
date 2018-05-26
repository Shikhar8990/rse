#! /bin/sh
rm -f *.ll *.bc ./input ./output
make clean
clang -I ../../include -emit-llvm -c -g $1.c
cp $1.bc input.bc
llvm-dis input.bc -o input.ll
make

opt -load ./prune.so -prune input.bc -disable-output 
