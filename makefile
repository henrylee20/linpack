CC = /opt/intel/bin/icc
#CC = gcc
FLAGS =


#FLAGS += -ffast-math
#FLAGS += -fast
#FLAGS += -vec-report

FLAGS += -qopt-report=3

FLAGS += -O3

# Processer-Specific Opt
#FLAGS += -march=core-avx2
#FLAGS += -axcore-avx2
#FLAGS += -xcore-avx2
FLAGS += -xHost

FLAGS += -ipo

FLAGS += -finline
#FLAGS += -inline-forceinline

# Parallel performance
#FLAGS += -qopenmp-simd
FLAGS += -parallel
#FLAGS += -par-threshold8
#FLAGS += -guide=4
#FLAGS += -qopt-matmul	#default by -O3 and -parallel
#FLAGS += -mkl=parallel 	#Intel Math Kernel Lib

# Floating-Point Opt
FLAGS += -fp-model fast=2
#FLAGS += -fimf-precision:high
FLAGS += -no-prec-div
#FLAGS += -no-prec-sqrt

# Fine-Turning
#FLAGS += -unroll
FLAGS += -funroll-all-loops
#FLAGS += -unroll-aggressive

# Perfetch, may take effect Orz
FLAGS += -qopt-prefetch
#FLAGS += -hotpatch
#FLAGS += -qopt-block-factor=16000
#FLAGS += -ffunction-sections
#FLAGS += -qopt-args-in-regs=all
#FLAGS += -qopt-subscript-in-range
FLAGS += -falign-functions

FLAGS += -qopt-multi-version-aggressive
FLAGS += -opt-malloc-options=4
#FLAGS += -qopt-mem-layout-trans=3

# alias, no effect to other
FLAGS += -fno-alias
#FLAGS += -fno-fnalias
#FLAGS += -no-ansi-alias
#FLAGS += -fargument-noalias
FLAGS += -fargument-noalias-global

# inline expansion by compiler, no effect
FLAGS += -fbuiltin

# alway pop args to each function as soon as that func returns
FLAGS += -fno-defer-pop

# assume memory will be paddded
#FLAGS += -qopt-assume-safe-padding

#FLAGS += -use-intel-optimized-headers

TYPE = -DROLL -DSP

linpack: linpack.c makefile
	${CC} $< -o $@ ${FLAGS} ${TYPE}

.PHONY: clean
clean:
	rm -f linpack Linpack.txt 
