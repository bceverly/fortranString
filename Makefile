FORTRAN = egfortran
FCFLAGS = -c -ffree-form

fortranString:	fortranString.o
	${FORTRAN} -o fortranString fortranString.o

fortranString.o:	fortranString.f08
	$(FORTRAN) ${FCFLAGS} fortranString.f08
