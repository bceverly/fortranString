FORTRAN = egfortran
FCFLAGS = -g -c -ffree-form -std=f2008 -Wall

fortranString:	fortranString.o
	$(FORTRAN) -o fortranString fortranString.o string_m.o ustring_m.o string_utility.o

fortranString.o:	string_m.o ustring_m.o fortranString.f90
	$(FORTRAN) $(FCFLAGS) fortranString.f90

string_m.o:	string_m.f90
	$(FORTRAN) $(FCFLAGS) string_m.f90

ustring_m.o:	string_m.o string_utility.o ustring_m.f90
	$(FORTRAN) $(FCFLAGS) ustring_m.f90

string_utility.o:	string_utility.f90
	$(FORTRAN) $(FCFLAGS) string_utility.f90

.PHONY:	clean
clean:
	-rm *.o *.mod fortranString
