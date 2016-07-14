FORTRAN = egfortran
FCFLAGS = -c -ffree-form -std=f2008

fortranString:	fortranString.o
	$(FORTRAN) -o fortranString fortranString.o class_string.o

fortranString.o:	class_string.o fortranString.f08
	$(FORTRAN) $(FCFLAGS) fortranString.f08

class_string.o:	class_string.f08
	$(FORTRAN) $(FCFLAGS) class_string.f08

.PHONY:	clean
clean:
	-rm *.o *.mod fortranString
