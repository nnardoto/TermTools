library/TermTools.o:
	mkdir library
	gfortran -c src/TermTools.f90 -J library -o library/TermTools.o
